#### Kubernetes FAQs

What is the upgrade process for the W&B instance when running via terraform?

> There's a couple of ways to upgrade the W&B image.
> Running the command
> `kubectl set image deployment.apps/wandb wandb=wandb/local:0.9.49`
> In this, `deployment.apps/wandb` is the name of the deployment and `wandb=` is the name of the container assuming this is what you have on your deployment as well or else these would need to be updated as per your settings.
> You could also update the property `ImagePullPolicy: Always` in the deployment file and just run `kubectl apply -f <deployment.yaml>.`

How does W&B check for the health and readiness of the application?

> W&B leverages the readiness & liveness probes from the Kubernetes API to check and maintain the health of the service. You can find this information in the code here: https://github.com/wandb/terraform-kubernetes-wandb/blob/main/main.tf#L111-L123
