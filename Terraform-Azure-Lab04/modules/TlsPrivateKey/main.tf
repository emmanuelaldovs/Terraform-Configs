# Create (and display) an SSH key
resource "tls_private_key" "example_ssh_t" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}