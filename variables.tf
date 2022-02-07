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