# Weights & Biases Kubernetes Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.6 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth0_client_id"></a> [auth0\_client\_id](#input\_auth0\_client\_id) | The Auth0 Client ID of application | `string` | `""` | no |
| <a name="input_auth0_domain"></a> [auth0\_domain](#input\_auth0\_domain) | The Auth0 domain of your tenant | `string` | `""` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The S3 / GCS bucket for storing data | `string` | n/a | yes |
| <a name="input_bucket_aws_region"></a> [bucket\_aws\_region](#input\_bucket\_aws\_region) | The AWS Region where your bucket lives | `string` | `""` | no |
| <a name="input_bucket_kms_key_arn"></a> [bucket\_kms\_key\_arn](#input\_bucket\_kms\_key\_arn) | AWS KMS key used to decrypt the bucket. | `string` | `""` | no |
| <a name="input_bucket_queue"></a> [bucket\_queue](#input\_bucket\_queue) | The SQS / Google PubSub queue for object creation events | `string` | n/a | yes |
| <a name="input_cloud_monitoring_connection_string"></a> [cloud\_monitoring\_connection\_string](#input\_cloud\_monitoring\_connection\_string) | The cloud provider to publish custom system metrics to for monitoring. Possible values are s3://, gs://, or az://. | `string` | `"noop://"` | no |
| <a name="input_database_connection_string"></a> [database\_connection\_string](#input\_database\_connection\_string) | The MySQL connection string. | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | The FQD of your instance. | `string` | n/a | yes |
| <a name="input_license"></a> [license](#input\_license) | Your wandb/local license | `string` | n/a | yes |
| <a name="input_local_restore"></a> [local\_restore](#input\_local\_restore) | Restores Weights & Biases to a stable state if needed. | `bool` | `false` | no |
| <a name="input_oidc_auth_method"></a> [oidc\_auth\_method](#input\_oidc\_auth\_method) | OIDC auth method | `string` | `"implicit"` | no |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | The Client ID of application in your identity provider | `string` | `""` | no |
| <a name="input_oidc_issuer"></a> [oidc\_issuer](#input\_oidc\_issuer) | A url to your Open ID Connect identity provider, i.e. https://cognito-idp.us-east-1.amazonaws.com/us-east-1_uiIFNdacd | `string` | `""` | no |
| <a name="input_oidc_secret"></a> [oidc\_secret](#input\_oidc\_secret) | The Client secret of the application in your identity provider | `string` | `""` | no |
| <a name="input_other_wandb_env"></a> [other\_wandb\_env](#input\_other\_wandb\_env) | n/a | `map(string)` | `{}` | no |
| <a name="input_progress_deadline_seconds"></a> [progress\_deadline\_seconds](#input\_progress\_deadline\_seconds) | The version of Weights & Biases local to deploy. | `number` | `3600` | no |
| <a name="input_redis_ca_cert"></a> [redis\_ca\_cert](#input\_redis\_ca\_cert) | The redis certificate authority. | `string` | `""` | no |
| <a name="input_redis_connection_string"></a> [redis\_connection\_string](#input\_redis\_connection\_string) | The redis connection string. | `string` | `""` | no |
| <a name="input_resource_limits"></a> [resource\_limits](#input\_resource\_limits) | Specifies the allocation for resource limits | `map(string)` | <pre>{<br>  "cpu": "4000m",<br>  "memory": "8G"<br>}</pre> | no |
| <a name="input_resource_requests"></a> [resource\_requests](#input\_resource\_requests) | Specifies the allocation for resource requests | `map(string)` | <pre>{<br>  "cpu": "500m",<br>  "memory": "1G"<br>}</pre> | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | n/a | `number` | `32543` | no |
| <a name="input_wandb_image"></a> [wandb\_image](#input\_wandb\_image) | Docker repository of to pull the wandb image from. | `string` | `"wandb/local"` | no |
| <a name="input_wandb_version"></a> [wandb\_version](#input\_wandb\_version) | The version of Weights & Biases local to deploy. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_port"></a> [service\_port](#output\_service\_port) | n/a |
<!-- END_TF_DOCS -->
