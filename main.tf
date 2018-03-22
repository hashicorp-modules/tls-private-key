terraform {
  required_version = ">= 0.9.3"
}

resource "random_id" "name" {
  count = "${var.create ? 1 : 0}"

  byte_length = 4
  prefix      = "${var.name}-"
}

resource "tls_private_key" "key" {
  count = "${var.create ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  rsa_bits    = "${var.rsa_bits}"
  ecdsa_curve = "${var.ecdsa_curve}"
}

resource "null_resource" "download_private_key" {
  count = "${var.create ? 1 : 0}"

  provisioner "local-exec" {
    command = "echo '${element(tls_private_key.key.*.private_key_pem, 0)}' > ${format("%s.key.pem", element(random_id.name.*.hex, 0))} && chmod ${var.permissions} ${format("%s.key.pem", element(random_id.name.*.hex, 0))}"
  }
}
