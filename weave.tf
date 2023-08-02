resource "kubernetes_deployment" "weave" {
  metadata {
    name = local.weave_app_name
    labels = {
      app = local.weave_app_name
    }
  }

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
          name = local.weave_app_name
          image             = "${var.wandb_image}:${var.wandb_version}"
          image_pull_policy = "Always"

          env {
            name = "ONLY_SERVICE"
            value = "weave"
          }

          env {
            name = "WANDB_BASE_URL"
            value = "${var.host}"
          }

          env {
            name = "WEAVE_AUTH_GRAPHQL_URL"
            value = "${var.host}/graphql"
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
          }

          resources {
            requests = {
              cpu    = "500m"
              memory = "1G"
            }
            limits   = {
              cpu    = "8000m"
              memory = "16G"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "weave" {
  metadata {
    name = local.weave_app_name
  }

  spec {
    type = "NodePort"
    selector = {
      app = local.weave_app_name
    }
    port {
      name      = "http"
      port      = 9994
      target_port = 9994
    }
  }
}