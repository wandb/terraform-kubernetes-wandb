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

variable "mysql_connection_string" {
  type        = string
  description = "The MySQL connection string."
}

variable "bucket_aws_region" {
  type    = string
  default = "The AWS Region where your bucket lives"
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