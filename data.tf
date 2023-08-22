data "kubernetes_config_map" "wandb-infra" {
    metadata {
        name = "wandb-infra"
    }
}

data "kubernetes_secret" "wandb-infra" {
    metadata {
        name = "wandb-infra"
    }
}