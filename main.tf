locals {
  app_name           = "wandb"
  weave_app_name     = "weave"
  parquet_app_name   = "parquet"
  redis_ca_cert_name = "server_ca.pem"
  static_secrets     = {
    "MYSQL"       = var.database_connection_string
    "OIDC_SECRET" = var.oidc_secret
  }
  all_secrets        = merge(local.static_secrets, var.other_wandb_secrets)
}

resource "kubernetes_service_account" "default" {
  metadata {
    name        = var.service_account_name
    annotations = var.service_account_annotations
    labels = var.service_account_labels
  }

  automount_service_account_token  = true
}

resource "kubernetes_priority_class" "priority" {
  metadata {
    name = "wandb-priority"
  }

  value = 1000000000
  global_default = false
  description = "Priority class for wandb pods."
}

resource "kubernetes_deployment" "wandb" {
  metadata {
    name = local.app_name
    labels = {
      app = local.app_name
    }
  }

  spec {
    replicas                  = 1
    progress_deadline_seconds = var.progress_deadline_seconds

    strategy {
      type = "RollingUpdate"
    }

    selector {
      match_labels = {
        app = local.app_name
      }
    }

    template {
      metadata {
        labels = merge({ app = local.app_name }, var.deployment_pod_labels)
      }

      spec {
        service_account_name = kubernetes_service_account.default.metadata[0].name
        priority_class_name  = kubernetes_priority_class.priority.metadata[0].name

        container {
          name              = local.app_name
          image             = "${var.wandb_image}:${var.wandb_version}"
          image_pull_policy = "Always"

          volume_mount {
            mount_path = "/etc/ssl/certs/${local.redis_ca_cert_name}"
            sub_path   = local.redis_ca_cert_name
            name       = local.app_name
          }

          env {
            name  = "LOCAL_RESTORE"
            value = var.local_restore
          }

          env {
            name  = "LICENSE"
            value = var.license
          }

          env {
            name  = "BUCKET"
            value = var.bucket
          }

          env {
            name  = "BUCKET_QUEUE"
            value = var.bucket_queue
          }

          env {
            name  = "AWS_S3_KMS_ID"
            value = var.bucket_kms_key_arn
          }

          env {
            name  = "AWS_REGION"
            value = var.bucket_aws_region
          }

          env {
            name  = "HOST"
            value = var.host
          }

          env {
            name  = "AUTH0_DOMAIN"
            value = var.auth0_domain
          }

          env {
            name  = "AUTH0_CLIENT_ID"
            value = var.auth0_client_id
          }

          env {
            name  = "OIDC_CLIENT_ID"
            value = var.oidc_client_id
          }

          dynamic "env" {
            for_each = local.all_secrets
            content {
              name = env.key
              value_from {
                secret_key_ref {
                  name = local.app_name
                  key  = env.key
                }
              }
            }
          }

          env {
            name  = "OIDC_AUTH_METHOD"
            value = var.oidc_auth_method
          }

          env {
            name  = "OIDC_ISSUER"
            value = var.oidc_issuer
          }

          env {
            name  = "REDIS"
            value = var.redis_connection_string
          }

          env {
            name  = "GORILLA_CUSTOM_METRICS_PROVIDER"
            value = var.cloud_monitoring_connection_string
          }

          env {
            name = "WEAVE_SERVICE"
            value = var.weave_enabled ? "${kubernetes_service.weave.0.metadata.0.name}:9994" : ""
          }

          env {
            name = "PARQUET_ENABLED"
            value = var.weave_enabled ? "true" : "false"
          }

          env {
            name = "PARQUET_HOST"
            value = var.parquet_enabled ? "http://${kubernetes_service.parquet.0.metadata.0.name}:8087" : ""
          }

          env {
            name = "WEAVE_ENABLED"
            value = var.weave_enabled ? "true" : "false"
          }

          dynamic "env" {
            for_each = var.other_wandb_env
            content {
              name  = env.key
              value = env.value
            }
          }

          port {
            name           = "http"
            container_port = 8080
            protocol       = "TCP"
          }

          port {
            name           = "prometheus"
            container_port = 8181
            protocol       = "TCP"
          }

          liveness_probe {
            http_get {
              path = "/healthz"
              port = "http"
            }
          }
          readiness_probe {
            http_get {
              path = "/ready"
              port = "http"
            }
          }
          startup_probe {
            http_get {
              path = "/ready"
              port = "http"
            }
            failure_threshold = 120
          }

          resources {
            requests = var.resource_requests
            limits   = var.resource_limits
          }
        }
        volume {
          name = local.app_name
          config_map {
            name     = kubernetes_config_map.config_map.metadata[0].name
            optional = true
          }
        }
      }
    }
  }

  timeouts {
    create = "1h"
    update = "1h"
    delete = "10m"
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name = local.app_name
  }

  spec {
    type = "NodePort"
    selector = {
      app = local.app_name
    }
    port {
      name      = "http"
      port      = 8080
      node_port = var.service_port
    }
  }
}

resource "kubernetes_service" "prometheus" {
  metadata {
    name = "prometheus"
  }

  spec {
    selector = {
      app = local.app_name
    }
    port {
      name = "prometheus"
      port = 8181
    }
  }
}

resource "kubernetes_config_map" "config_map" {
  metadata {
    name = local.app_name
  }

  data = {
    "server_ca.pem" = var.redis_ca_cert
  }
}

resource "kubernetes_secret" "secret" {
  metadata {
    name = local.app_name
  }

  data = {
    for key, value in local.all_secrets : key => value
  }
}
