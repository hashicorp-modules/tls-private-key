terraform {
  required_version = ">= 0.9.3"
}

resource "tls_private_key" "main" {
  count = "${var.provision == "true" ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  rsa_bits    = "${var.rsa_bits}"
  ecdsa_curve = "${var.ecdsa_curve}"
}

resource "random_id" "name" {
  count = "${var.provision == "true" ? 1 : 0}"

  byte_length = 4
  prefix      = "tls-private-key-"
}

resource "null_resource" "main" {
  count = "${var.provision == "true" ? 1 : 0}"

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.main.private_key_pem}\" > ${format("%s.pem", var.name != "" ? var.name : random_id.name.hex)}"
  }

  provisioner "local-exec" {
    command = "chmod 600 ${format("%s.pem", var.name != "" ? var.name : random_id.name.hex)}"
  }
}
