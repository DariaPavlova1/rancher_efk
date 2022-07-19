variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "Rancher AWS region for S3 buckets"
}

variable "rancher_version" {
  type        = string
  default     = "2.6.5"
  description = "Rancher version"
}

variable "rancher_cluster_name" {
  type        = string
  default     = "local"
  description = "Rancher cluster name"
}

variable "rancher_hostname" {
  type        = string
  default     = "rancher.ci.folio.org"
  description = "Rancher hostname"
}

variable "rancher_token_key" {
  type        = string
  description = "Rancher token key"
  default     = "token-tglpl:vz7kpwrkkbhjr7kbssd82nddt7kv2fj4zqsq792l4l8vxtdv9hrtrl"
}

variable "email" {
  type        = string
  default     = "daria_pavlova1epam.com"
  description = "Please, enter your email (elastic email) or a user"
}

variable "kibana_endpoint" {
  description = "Kibana endpoint"
  type        = string
  default     = "TO CONNECT TO KIBANA: kubectl port-forward svc/<KIBANA-ENDPOINT> 5601:5601"
}