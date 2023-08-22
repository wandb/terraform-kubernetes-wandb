resource "kubernetes_config_map" "wandb" {
  metadata {
    name = "wandb"
  }

  data = {
    "server_ca.pem" = data.kubernetes_config_map.wandb-infra.data["redis-ca-certificate"] == {} ? "server_ca.pem" : data.kubernetes_config_map.wandb-infra.data["redis-ca-certificate"]
  }
}
