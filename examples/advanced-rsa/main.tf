module "tls_private_key" {
  source = "../../../tls-private-key"
  # source = "git@github.com:hashicorp-modules/tls-private-key.git"

  private_key_filename = "${var.private_key_filename}"
  algorithm            = "${var.algorithm}"
  rsa_bits             = "${var.rsa_bits}"
}
