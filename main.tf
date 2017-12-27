terraform {
  required_version = ">= 0.9.3"
}

resource "random_id" "name" {
  count = "${var.count}"

  byte_length = 4
  prefix      = "${var.name}-${count.index + 1}-"
}

resource "tls_private_key" "key" {
  count = "${var.count}"

  algorithm   = "${var.algorithm}"
  rsa_bits    = "${var.rsa_bits}"
  ecdsa_curve = "${var.ecdsa_curve}"
}

resource "null_resource" "key" {
  count = "${var.count}"

  provisioner "local-exec" {
    command = "echo '${element(tls_private_key.key.*.private_key_pem, count.index)}' > ${format("%s.key.pem", element(random_id.name.*.hex, count.index))} && chmod 600 ${format("%s.key.pem", element(random_id.name.*.hex, count.index))}"
  }
}
