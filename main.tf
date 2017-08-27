terraform {
  required_version = ">= 0.9.3"
}

resource "tls_private_key" "main" {
  algorithm   = "${var.algorithm}"
  rsa_bits    = "${var.rsa_bits}"
  ecdsa_curve = "${var.ecdsa_curve}"
}

resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "echo \"${tls_private_key.main.private_key_pem}\" > ${var.private_key_filename}"
  }

  provisioner "local-exec" {
    command = "chmod 600 ${var.private_key_filename}"
  }
}
