output "algorithm" {
  value = "${element(tls_private_key.key.*.algorithm, 0)}"
}

output "private_key_pem" {
  value = "${element(tls_private_key.key.*.private_key_pem, 0)}"
}

output "private_key_name" {
  value = "${element(random_id.name.*.hex, 0)}"
}

output "private_key_filename" {
  value = "${format("%s.key.pem", element(random_id.name.*.hex, 0))}"
}

output "public_key_pem" {
  value = "${element(tls_private_key.key.*.public_key_pem, 0)}"
}

output "public_key_openssh" {
  value = "${element(tls_private_key.key.*.public_key_openssh, 0)}"
}
