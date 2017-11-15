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
  prefix      = "${var.name}-"
}

resource "null_resource" "main" {
  count = "${var.provision == "true" ? 1 : 0}"

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.main.private_key_pem}\" > ${format("%s.pem", random_id.name.hex)}"
    # command = "echo \"${tls_private_key.main.private_key_pem}\" > ${var.name != "" ? format("%s.pem", var.name) : format("%s.pem", random_id.name.hex)}"
  }

  provisioner "local-exec" {
    command = "chmod 600 ${format("%s.pem", random_id.name.hex)}"
    # command = "chmod 600 ${var.name != "" ? format("%s.pem", var.name) : format("%s.pem", random_id.name.hex)}"
  }
}
