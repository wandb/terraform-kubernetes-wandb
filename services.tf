resource "kubernetes_service" "prometheus" {
  metadata {
    name = "prometheus"
  }

  spec {
    selector = {
      app = "wandb"
    }
    port {
      name = "prometheus"
      port = 8181
    }
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name = "wandb"
  }

  spec {
    type = "NodePort"
    selector = {
      app = "wandb"
    }
    port {
      name      = "http"
      port      = 8080
      node_port = var.service_port
    }
  }
}