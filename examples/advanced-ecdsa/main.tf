module "tls_private_key" {
  source = "../../../tls-private-key"
  # source = "git@github.com:hashicorp-modules/tls-private-key.git?ref=f-refactor"

  count       = "${var.count}"
  name        = "${var.name}"
  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
}
