resource "kubernetes_secret" "wandb" {
  metadata {
    name = "wandb"
  }

  data = {
    "MYSQL"       = data.kubernetes_secret.wandb-infra.data["MYSQL"]
    "OIDC_SECRET" = var.oidc_secret
  }
}

resource "kubernetes_secret" "other" {
  metadata {
    name = "other"
  }

  data = {
    for key, value in var.other_wandb_secrets : key => value
  }
}