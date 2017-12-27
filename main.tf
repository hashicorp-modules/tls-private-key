terraform {
  required_version = ">= 0.9.3"
}

resource "random_id" "name" {
  byte_length = 4
  prefix      = "${var.name}-"
}

resource "tls_private_key" "key" {
  count = "${var.provision == "true" ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  rsa_bits    = "${var.rsa_bits}"
  ecdsa_curve = "${var.ecdsa_curve}"

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ${format("%s.key.pem", random_id.name.hex)} && chmod 600 ${format("%s.key.pem", random_id.name.hex)}"
  }
}
