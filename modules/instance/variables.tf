variable "subnet_id" {
  description = "Subnet ID to launch instance in"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name to use for instance"
  type        = string
}

variable "ami_id" {
  description = "Optional AMI id to use for the instance. If empty, module will lookup the latest Amazon Linux 2 AMI."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}
