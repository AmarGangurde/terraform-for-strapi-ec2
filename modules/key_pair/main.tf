
resource "tls_private_key" "generated" {
  count     = var.public_key == "" ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

locals {
  public_key_material = var.public_key != "" ? var.public_key : tls_private_key.generated[0].public_key_openssh
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = local.public_key_material
}

output "private_key_pem" {
  description = "Private key PEM if Terraform generated the key (sensitive)"
  value       = var.public_key != "" ? "" : tls_private_key.generated[0].private_key_pem
  sensitive   = true
}

