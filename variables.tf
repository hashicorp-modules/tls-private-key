variable "create" {
  description = "Create Module, defaults to true."
  default     = true
}

variable "name" {
  description = "Filename to write the private key data to, default to \"tls-private-key\"."
  default     = "tls-private-key"
}

variable "algorithm" {
  description = "The name of the algorithm to use for the key. Currently-supported values are \"RSA\" and \"ECDSA\". Defaults to \"RSA\""
  default     = "RSA"
}

variable "rsa_bits" {
  description = "When algorithm is \"RSA\", the size of the generated RSA key in bits. Defaults to \"2048\"."
  default     = "2048"
}

variable "ecdsa_curve" {
  description = "When algorithm is \"ECDSA\", the name of the elliptic curve to use. May be any one of \"P224\", \"P256\", \"P384\" or \"P521\". Defaults to \"P224\"."
  default     = "P224"
}

variable "permissions" {
  description = "The Unix file permission to assign to the cert files (e.g. 0600). Defaults to \"0600\"."
  default     = "0600"
}
