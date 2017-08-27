output "algorithm" {
  value = "${tls_private_key.main.algorithm}"
}

output "private_key_pem" {
  value = "${tls_private_key.main.private_key_pem}"
}

output "private_key_filename" {
  value = "${var.private_key_filename}"
}

output "public_key_pem" {
  value = "${tls_private_key.main.public_key_pem}"
}

output "public_key_openssh" {
  value = "${tls_private_key.main.public_key_openssh}"
}
