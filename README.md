# Weights & Biases Kubernetes Module

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                        | Version |
| --------------------------------------------------------------------------- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | ~> 1.0  |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | ~> 2.23  |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | ~> 2.6  |

## Resources

| Name | Type |
| ---- | ---- |

## Inputs

| Name                                                                                                                                    | Description                                                                                                           | Type          | Default                                                  | Required |
| --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ------------- | -------------------------------------------------------- | :------: |
| <a name="input_auth0_client_id"></a> [auth0_client_id](#input_auth0_client_id)                                                          | The Auth0 Client ID of application                                                                                    | `string`      | `""`                                                     |    no    |
| <a name="input_auth0_domain"></a> [auth0_domain](#input_auth0_domain)                                                                   | The Auth0 domain of your tenant                                                                                       | `string`      | `""`                                                     |    no    |
| <a name="input_bucket"></a> [bucket](#input_bucket)                                                                                     | The S3 / GCS bucket for storing data                                                                                  | `string`      | n/a                                                      |   yes    |
| <a name="input_bucket_aws_region"></a> [bucket_aws_region](#input_bucket_aws_region)                                                    | The AWS Region where your bucket lives                                                                                | `string`      | `""`                                                     |    no    |
| <a name="input_bucket_kms_key_arn"></a> [bucket_kms_key_arn](#input_bucket_kms_key_arn)                                                 | AWS KMS key used to decrypt the bucket.                                                                               | `string`      | `""`                                                     |    no    |
| <a name="input_bucket_queue"></a> [bucket_queue](#input_bucket_queue)                                                                   | The SQS / Google PubSub queue for object creation events                                                              | `string`      | n/a                                                      |   yes    |
| <a name="input_cloud_monitoring_connection_string"></a> [cloud_monitoring_connection_string](#input_cloud_monitoring_connection_string) | The cloud provider to publish custom system metrics to for monitoring. Possible values are s3://, gs://, or az://.    | `string`      | `"noop://"`                                              |    no    |
| <a name="input_database_connection_string"></a> [database_connection_string](#input_database_connection_string)                         | The MySQL connection string.                                                                                          | `string`      | n/a                                                      |   yes    |
| <a name="input_host"></a> [host](#input_host)                                                                                           | The FQD of your instance.                                                                                             | `string`      | n/a                                                      |   yes    |
| <a name="input_license"></a> [license](#input_license)                                                                                  | Your wandb/local license                                                                                              | `string`      | n/a                                                      |   yes    |
| <a name="input_local_restore"></a> [local_restore](#input_local_restore)                                                                | Restores Weights & Biases to a stable state if needed.                                                                | `bool`        | `false`                                                  |    no    |
| <a name="input_oidc_auth_method"></a> [oidc_auth_method](#input_oidc_auth_method)                                                       | OIDC auth method                                                                                                      | `string`      | `"implicit"`                                             |    no    |
| <a name="input_oidc_client_id"></a> [oidc_client_id](#input_oidc_client_id)                                                             | The Client ID of application in your identity provider                                                                | `string`      | `""`                                                     |    no    |
| <a name="input_oidc_issuer"></a> [oidc_issuer](#input_oidc_issuer)                                                                      | A url to your Open ID Connect identity provider, i.e. https://cognito-idp.us-east-1.amazonaws.com/us-east-1_uiIFNdacd | `string`      | `""`                                                     |    no    |
| <a name="input_oidc_secret"></a> [oidc_secret](#input_oidc_secret)                                                                      | The Client secret of the application in your identity provider                                                        | `string`      | `""`                                                     |    no    |
| <a name="input_other_wandb_env"></a> [other_wandb_env](#input_other_wandb_env)                                                          | n/a                                                                                                                   | `map(string)` | `{}`                                                     |    no    |
| <a name="input_progress_deadline_seconds"></a> [progress_deadline_seconds](#input_progress_deadline_seconds)                            | The version of Weights & Biases local to deploy.                                                                      | `number`      | `3600`                                                   |    no    |
| <a name="input_redis_ca_cert"></a> [redis_ca_cert](#input_redis_ca_cert)                                                                | The redis certificate authority.                                                                                      | `string`      | `""`                                                     |    no    |
| <a name="input_redis_connection_string"></a> [redis_connection_string](#input_redis_connection_string)                                  | The redis connection string.                                                                                          | `string`      | `""`                                                     |    no    |
| <a name="input_resource_limits"></a> [resource_limits](#input_resource_limits)                                                          | Specifies the allocation for resource limits                                                                          | `map(string)` | <pre>{<br> "cpu": "4000m",<br> "memory": "8G"<br>}</pre> |    no    |
| <a name="input_resource_requests"></a> [resource_requests](#input_resource_requests)                                                    | Specifies the allocation for resource requests                                                                        | `map(string)` | <pre>{<br> "cpu": "500m",<br> "memory": "1G"<br>}</pre>  |    no    |
| <a name="input_service_port"></a> [service_port](#input_service_port)                                                                   | n/a                                                                                                                   | `number`      | `32543`                                                  |    no    |
| <a name="input_wandb_image"></a> [wandb_image](#input_wandb_image)                                                                      | Docker repository of to pull the wandb image from.                                                                    | `string`      | `"wandb/local"`                                          |    no    |
| <a name="input_wandb_version"></a> [wandb_version](#input_wandb_version)                                                                | The version of Weights & Biases local to deploy.                                                                      | `string`      | `"latest"`                                               |    no    |

## Outputs

| Name                                                                    | Description |
| ----------------------------------------------------------------------- | ----------- |
| <a name="output_service_port"></a> [service_port](#output_service_port) | n/a         |

<!-- END_TF_DOCS -->

