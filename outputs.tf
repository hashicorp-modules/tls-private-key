output "algorithm" {
  value = "${tls_private_key.key.*.algorithm}"
}

output "private_key_pem" {
  value = "${tls_private_key.key.*.private_key_pem}"
}

output "private_key_name" {
  value = "${random_id.name.hex}"
}

output "private_key_filename" {
  value = "${format("%s.key.pem", random_id.name.hex)}"
}

output "public_key_pem" {
  value = "${tls_private_key.key.*.public_key_pem}"
}

output "public_key_openssh" {
  value = "${tls_private_key.key.*.public_key_openssh}"
}
