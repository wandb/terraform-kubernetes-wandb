locals {
  app_name           = "wandb"
  redis_ca_cert_name = "server_ca.pem"
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
        labels = {
          app = local.app_name
        }
      }

      spec {
        init_container {
          name = "create-nginx"
          image = "busybox"

          volume_mount {
            name = "varlog"
            mount_path = "/var/log/"
          }

          command = [ "/bin/sh", "-c", "mkdir -p /var/log/nginx && chmod g+w /var/log/nginx" ]
        }

        container {
          name              = local.app_name
          image             = "${var.wandb_image}:${var.wandb_version}"
          image_pull_policy = "Always"

          volume_mount {
            mount_path = "/etc/ssl/certs/${local.redis_ca_cert_name}"
            sub_path   = local.redis_ca_cert_name
            name       = local.app_name
          }

          volume_mount {
            name = "varlog"
            mount_path = "/var/log/"
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
            name  = "MYSQL"
            value_from {
              secret_key_ref {
                name = local.app_name
                key = "MYSQL"
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

          port {
            name           = "http"
            container_port = 8080
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
            period_seconds = 240
          }

          resources {
            requests = {
              cpu    = "500m"
              memory = "1G"
            }
            limits = {
              cpu    = "4000m"
              memory = "8G"
            }
          }
        }

        container {
          name = "sidecar-gorilla"
          image = "busybox"

          volume_mount {
            name = "varlog"
            mount_path = "/var/log"
          }

          args = [ "/bin/sh", "-c", "tail -n+1 -f /var/log/gorilla.log" ]
        }

        container {
          name = "sidecar-local"
          image = "busybox"

          volume_mount {
            name = "varlog"
            mount_path = "/var/log/"
          }

          args = [ "/bin/sh", "-c", "tail -n+1 -f /var/log/local.log" ]
        }

        volume {
          name = local.app_name
          config_map {
            name     = kubernetes_config_map.config_map.metadata[0].name
            optional = true
          }
        }

        volume {
          name = "varlog"
          empty_dir {
            
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
      port      = 8080
      node_port = var.service_port
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
    "MYSQL" = var.database_connection_string
  }
}
