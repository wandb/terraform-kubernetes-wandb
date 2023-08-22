resource "kubernetes_deployment" "weave" {
  metadata {
    name = local.weave_app_name
    labels = {
      app = local.weave_app_name
    }
  }

  count = var.weave_enabled ? 1 : 0

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.weave_app_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.weave_app_name
        }
      }

      spec {
        priority_class_name = kubernetes_priority_class.priority.metadata[0].name

        container {
          name              = local.weave_app_name
          image             = "${var.wandb_image}:${var.wandb_version}"
          image_pull_policy = "Always"

          env {
            name  = "ONLY_SERVICE"
            value = "weave"
          }

          env {
            name  = "WANDB_BASE_URL"
            value = var.host
          }

          env {
            name  = "WEAVE_AUTH_GRAPHQL_URL"
            value = "${var.host}/graphql"
          }

          env {
            name  = "DD_SERVICE"
            value = "weave-python"
          }

          env {
            name  = "DD_ENV"
            value = var.dd_env
          }

          dynamic "env" {
            for_each = var.weave_enable_datadog ? ["DD_AGENT_HOST", "DD_TRACE_AGENT_HOSTNAME"] : []
            content {
              name = env.value
              value_from {
                field_ref {
                  field_path = "status.hostIP"
                }
              }
            }
          }

          env {
            name  = "WEAVE_ENABLE_DATADOG"
            value = var.weave_enable_datadog ? "true" : "false"
          }

          env {
            name  = "DD_PROFILING_ENABLED"
            value = var.weave_dd_profiling_enabled ? "true" : "false"
          }

          port {
            name           = "http"
            container_port = 9994
            protocol       = "TCP"
          }

          liveness_probe {
            http_get {
              path = "__weave/hello"
              port = "http"
            }
          }

          readiness_probe {
            http_get {
              path = "__weave/hello"
              port = "http"
            }
          }

          startup_probe {
            http_get {
              path = "__weave/hello"
              port = "http"
            }
            failure_threshold = 12
            period_seconds    = 10
          }

          resources {
            requests = {
              cpu    = "500m"
              memory = "1G"
            }
            limits = {
              cpu    = "8000m"
              memory = "16G"
            }
          }

          dynamic "volume_mount" {
            for_each = var.weave_storage_size != "" ? ["weave-cache"] : []
            content {
              name       = volume_mount.value
              mount_path = "/vol/weave/cache"
            }
          }
        }
        dynamic "volume" {
          for_each = var.weave_storage_size != "" ? ["weave-cache"] : []
          content {
            name = volume.value
            persistent_volume_claim {
              claim_name = "${local.weave_app_name}-pvc"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_storage_class" "weave" {
  metadata {
    name = var.weave_storage_class
  }

  count = var.weave_storage_provisioner != "" ? 1 : 0

  storage_provisioner = var.weave_storage_provisioner
  parameters = {
    type = var.weave_storage_type
  }
  reclaim_policy      = "Delete" # TODO: might want reclaim here
  volume_binding_mode = "WaitForFirstConsumer"
}

resource "kubernetes_persistent_volume_claim" "weave" {
  metadata {
    name = "${local.weave_app_name}-pvc"
  }

  count = var.weave_storage_size != "" ? 1 : 0

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.weave_storage_size
      }
    }
    storage_class_name = var.weave_storage_class
  }
}

resource "kubernetes_service" "weave" {
  metadata {
    name = local.weave_app_name
  }

  count = var.weave_enabled ? 1 : 0

  spec {
    type = "NodePort"
    selector = {
      app = local.weave_app_name
    }
    port {
      name        = "http"
      port        = 9994
      target_port = 9994
    }
  }
}