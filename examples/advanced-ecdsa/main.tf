module "tls_private_key" {
  # source = "github.com/hashicorp-modules/tls-private-key"
  source = "../../../tls-private-key"

  create      = "${var.create}"
  name        = "${var.name}"
  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
}
