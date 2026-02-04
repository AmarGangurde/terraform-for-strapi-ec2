variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "public_key" {
  description = "Public key material to upload to AWS (ssh-rsa ... )"
  type        = string
}
