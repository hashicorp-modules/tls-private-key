module "tls_private_key" {
  # source = "github.com/hashicorp-modules/tls-private-key?ref=f-refactor"
  source = "../../../tls-private-key"

  count     = "${var.count}"
  name      = "${var.name}"
  algorithm = "${var.algorithm}"
  rsa_bits  = "${var.rsa_bits}"
}
