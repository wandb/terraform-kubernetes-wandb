resource "kubernetes_deployment" "parquet" {
  metadata {
    name = local.parquet_app_name
    labels = {
      app = local.parquet_app_name
    }
  }

  count = var.parquet_enabled ? 1 : 0

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.parquet_app_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.parquet_app_name
        }
      }

      spec {
        priority_class_name = kubernetes_priority_class.priority.metadata[0].name

        container {
          name = local.parquet_app_name
          image             = "${var.wandb_image}:${var.wandb_version}"
          image_pull_policy = "Always"

          volume_mount {
            mount_path = "/etc/ssl/certs/${local.redis_ca_cert_name}"
            sub_path   = local.redis_ca_cert_name
            name       = local.app_name
          }

          env {
            name = "ONLY_SERVICE"
            value = "gorilla-parquet"
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
            name = "MYSQL"
            value_from {
              secret_key_ref {
                name = local.app_name
                key  = "MYSQL"
              }
            }
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

          env {
            name = "OIDC_SECRET"
            value_from {
              secret_key_ref {
                name = local.app_name
                key  = "OIDC_SECRET"
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

          env {
            name = "GORILLA_STATSD_HOST"
            value = "datadog.datadog"
          }

          env {
            name = "GORILLA_STATSD_PORT"
            value = "8125"
          }

          port {
            name           = "http"
            container_port = 8087
            protocol       = "TCP"
          }

          port {
            name           = "prometheus"
            container_port = 8181
            protocol       = "TCP"
          }

          resources {
            requests = {
              cpu    = "3000m"
              memory = "12G"
            }
            limits   = {
              cpu    = "3000m"
              memory = "12G"
            }
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

resource "kubernetes_service" "parquet" {
  metadata {
    name = local.parquet_app_name
  }

  count = var.parquet_enabled ? 1 : 0

  spec {
    type = "NodePort"
    selector = {
      app = local.parquet_app_name
    }
    port {
      name      = "http"
      port      = 8087
      target_port = 8087
    }
  }
}
