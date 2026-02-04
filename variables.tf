variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH (restrict in production)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_key_path" {
  description = "Path to the public key file to upload as key pair"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Name for the created aws_key_pair (optional)"
  type        = string
  default     = "terraform-ec2-key"
}

variable "ami_id" {
  description = "Optional AMI id to use for the instance (leave empty to use Amazon Linux 2 latest)."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
