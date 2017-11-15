variable "provision" {
  default     = "true"
  description = "Override to prevent provisioning resources in this module, defaults to \"true\"."
}

variable "name" {
  default     = "tls-private-key"
  description = "Filename to write the private key data to, default to \"tls-private-key\"."
}

variable "algorithm" {
  default     = "RSA"
  description = "The name of the algorithm to use for the key. Currently-supported values are \"RSA\" and \"ECDSA\". Defaults to \"RSA\""
}

variable "rsa_bits" {
  default     = "2048"
  description = "When algorithm is \"RSA\", the size of the generated RSA key in bits. Defaults to \"2048\"."
}

variable "ecdsa_curve" {
  default     = "P224"
  description = "When algorithm is \"ECDSA\", the name of the elliptic curve to use. May be any one of \"P224\", \"P256\", \"P384\" or \"P521\". Defaults to \"P224\"."
}
