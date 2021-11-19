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
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.6.1 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The S3 / GCS bucket for storing data | `string` | n/a | yes |
| <a name="input_bucket_aws_region"></a> [bucket\_aws\_region](#input\_bucket\_aws\_region) | The AWS Region where your bucket lives | `string` | `""` | no |
| <a name="input_bucket_kms_key_arn"></a> [bucket\_kms\_key\_arn](#input\_bucket\_kms\_key\_arn) | AWS KMS key used to decrypt the bucket. | `string` | `""` | no |
| <a name="input_bucket_queue"></a> [bucket\_queue](#input\_bucket\_queue) | The SQS / Google PubSub queue for object creation events | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | The FQD of your instance. | `string` | n/a | yes |
| <a name="input_license"></a> [license](#input\_license) | Your wandb/local license | `string` | n/a | yes |
| <a name="input_mysql_connection_string"></a> [mysql\_connection\_string](#input\_mysql\_connection\_string) | The MySQL connection string. | `string` | n/a | yes |
| <a name="input_progress_deadline_seconds"></a> [progress\_deadline\_seconds](#input\_progress\_deadline\_seconds) | The version of Weights & Biases local to deploy. | `number` | `3600` | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | n/a | `number` | `32543` | no |
| <a name="input_wandb_image"></a> [wandb\_image](#input\_wandb\_image) | Docker repository of to pull the wandb image from. | `string` | `"wandb/local"` | no |
| <a name="input_wandb_version"></a> [wandb\_version](#input\_wandb\_version) | The version of Weights & Biases local to deploy. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_port"></a> [service\_port](#output\_service\_port) | n/a |
<!-- END_TF_DOCS -->