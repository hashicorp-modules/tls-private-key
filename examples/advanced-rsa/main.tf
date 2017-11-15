module "tls_private_key" {
  source = "../../../tls-private-key"
  # source = "git@github.com:hashicorp-modules/tls-private-key.git?ref=f-refactor"

  provision = "${var.provision}"
  name      = "${var.name}"
  algorithm = "${var.algorithm}"
  rsa_bits  = "${var.rsa_bits}"
}
