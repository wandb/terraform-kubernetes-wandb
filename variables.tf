variable "local_restore" {
  description = "Restores Weights & Biases to a stable state if needed."
  type        = bool
  default     = false
}

variable "wandb_version" {
  description = "The version of Weights & Biases local to deploy."
  type        = string
  default     = "latest"
}

variable "wandb_image" {
  description = "Docker repository of to pull the wandb image from."
  type        = string
  default     = "wandb/local"
}

variable "host" {
  type        = string
  description = "The FQD of your instance."
}

variable "license" {
  type        = string
  description = "Your wandb/local license"
}

variable "bucket" {
  type        = string
  description = "The S3 / GCS bucket for storing data"
}

variable "bucket_queue" {
  type        = string
  description = "The SQS / Google PubSub queue for object creation events"
}

variable "bucket_kms_key_arn" {
  type        = string
  description = "AWS KMS key used to decrypt the bucket."
  default     = ""
}

variable "database_connection_string" {
  type        = string
  description = "The MySQL connection string."
}

variable "bucket_aws_region" {
  type        = string
  description = "The AWS Region where your bucket lives"
  default     = ""
}

variable "auth0_domain" {
  type        = string
  description = "The Auth0 domain of your tenant"
  default     = ""
}

variable "auth0_client_id" {
  type        = string
  description = "The Auth0 Client ID of application"
  default     = ""
}

variable "resource_requests" {
  type        = map(string)
  description = "Specifies the allocation for resource requests"
  default = {
    cpu    = "1000m"
    memory = "1G"
  }
}

variable "resource_limits" {
  type        = map(string)
  description = "Specifies the allocation for resource limits"
  default = {
    cpu    = null
    memory = null
  }
}

variable "parquet_resource_requests" {
  type        = map(string)
  description = "Specifies the allocation for resource limits"
  default = {
    cpu    = "1000m"
    memory = "2G"
  }
}

variable "parquet_resource_limits" {
  type        = map(string)
  description = "Specifies the allocation for resource limits"
  default = {
    cpu    = null
    memory = null
  }
}

variable "weave_resource_requests" {
  type        = map(string)
  description = "Specifies the allocation for resource limits"
  default = {
    cpu    = "1000m"
    memory = "12G"
  }
}

variable "weave_resource_limits" {
  type        = map(string)
  description = "Specifies the allocation for resource limits"
  default = {
    cpu    = null
    memory = null
  }
}

variable "other_wandb_env" {
  type    = map(string)
  description = "Other environment variables to pass to the wandb/local container"
  default = {}
}

variable "other_wandb_secrets" {
  type    = map(string)
  description = "Other secret environment variables to pass to the wandb/local container"
  default = {}
}

# variable "slack_client_id" {
#   type    = string
#   description = "The client ID of the Slack application you want to use for alerts"
#   default = ""
# }

# variable "slack_secret" {
#   type    = string
#   description = "The secret of the Slack application you want to use for alerts"
#   default = ""
# }

variable "oidc_issuer" {
  type        = string
  description = "A url to your Open ID Connect identity provider, i.e. https://cognito-idp.us-east-1.amazonaws.com/us-east-1_uiIFNdacd"
  default     = ""
}

variable "oidc_client_id" {
  type        = string
  description = "The Client ID of application in your identity provider"
  default     = ""
}

variable "oidc_secret" {
  type        = string
  description = "The Client secret of the application in your identity provider"
  default     = ""
  sensitive   = true
}

variable "oidc_auth_method" {
  type        = string
  description = "OIDC auth method"
  default     = "implicit"
  validation {
    condition     = contains(["pkce", "implicit"], var.oidc_auth_method)
    error_message = "Invalid OIDC auth method."
  }
}

variable "progress_deadline_seconds" {
  description = "The version of Weights & Biases local to deploy."
  type        = number
  default     = 3600 # 1h
}

variable "service_port" {
  type    = number
  default = 32543
}

variable "redis_connection_string" {
  type        = string
  description = "The redis connection string."
  default     = ""
}

variable "redis_ca_cert" {
  type        = string
  description = "The redis certificate authority."
  default     = ""
}

variable "cloud_monitoring_connection_string" {
  type        = string
  description = "The cloud provider to publish custom system metrics to for monitoring. Possible values are s3://, gs://, or az://."
  default     = "noop://"
}

variable "weave_enabled" {
  type       = bool
  default    = false
  description = "whether to enable Weave or not"
}

variable "parquet_enabled" {
  type       = bool
  default    = false
  description = "whether to enable Parquet independently or not"
}

variable "dd_env" {
  type        = string
  description = "The Datadog environment to send metrics to."
  default     = ""
}

variable "weave_enable_datadog" {
  type        = bool
  description = "Whether to enable Datadog for Weave."
  default     = false
}

variable "weave_dd_profiling_enabled" {
  type        = bool
  description = "Whether to enable Datadog profiling for Weave."
  default     = false
}

variable "weave_storage_class" {
  type        = string
  description = "The storage class to use for the weave cache."
  default     = "standard"
}

variable "weave_storage_size" {
  type        = string
  description = "The size of the weave cache, we don't mount a pvc when not set."
  default     = ""
}

variable "weave_storage_provisioner" {
  type        = string
  description = "The storage provisioner to use for the weave cache, we don't create a new storage class when not set."
  default     = ""
}

variable "weave_storage_type" {
  type        = string
  description = "The type of storage provisioner to use."
  default     = ""
}

variable "service_account_name" {
  type = string
  description = "The name of the service account to use for the wandb/local deployment."
  default = "wandb-serviceaccount"
}

variable "service_account_annotations" {
  type    = map(string)
  default = {}
}