terraform {
  required_version = ">= 0.11.6"
}

resource "random_id" "name" {
  count = var.create ? 1 : 0

  byte_length = 4
  prefix      = "${var.name}-"
}

resource "tls_private_key" "key" {
  count = var.create ? 1 : 0

  algorithm   = var.algorithm
  rsa_bits    = var.rsa_bits
  ecdsa_curve = var.ecdsa_curve
}

resource "null_resource" "download_private_key" {
  count = var.create ? 1 : 0

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key[0].private_key_pem}' > ${format("%s.key.pem", random_id.name[0].hex)} && chmod ${var.permissions} ${format("%s.key.pem", random_id.name[0].hex)}"
  }
}

