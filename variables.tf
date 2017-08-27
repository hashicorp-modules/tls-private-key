variable "private_key_filename" {
  default     = "private-key.pem"
  description = "(Optional) Filename to write the private key data to. Defaults to \"private-key.pem\"."
}

variable "algorithm" {
  default     = "RSA"
  description = "(Optional) The name of the algorithm to use for the key. Currently-supported values are \"RSA\" and \"ECDSA\". Defaults to \"RSA\""
}

variable "rsa_bits" {
  default     = "2048"
  description = "(Optional) When algorithm is \"RSA\", the size of the generated RSA key in bits. Defaults to \"2048\"."
}

variable "ecdsa_curve" {
  default     = "P224"
  description = "(Optional) When algorithm is \"ECDSA\", the name of the elliptic curve to use. May be any one of \"P224\", \"P256\", \"P384\" or \"P521\". Defaults to \"P224\"."
}
