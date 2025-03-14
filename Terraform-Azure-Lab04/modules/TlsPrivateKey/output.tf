output "privateKey_algorithm_out" {
    value = tls_private_key.example_ssh_t.algorithm
}

output "privateKey_rsa_bits_out" {
    value = tls_private_key.example_ssh_t.rsa_bits
}

output "private_key_pem_out" {
  value     = tls_private_key.example_ssh_t.private_key_pem
  #sensitive = true
}
output "public_key_openssh_out" {
  value = tls_private_key.example_ssh_t.public_key_openssh
}