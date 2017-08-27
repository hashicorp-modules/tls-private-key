# TLS Private Key Terraform Module

Generates a secure RSA or ECDAS private key, encodes it as PEM, downloads it locally, and updates the local key file permission to 0600.

## Environment Variables

This module doesn't require any environment variables to be set.

## Input Variables

- `private_key_filename` - [Optional] Filename to write the private key data to. Defaults to "private-key.pem".
- `algorithm` - [Optional] The name of the algorithm to use for the key. Currently-supported values are "RSA" and "ECDSA". Defaults to "RSA"
- `rsa_bits` - [Optional] When algorithm is "RSA", the size of the generated RSA key in bits. Defaults to "2048".
- `ecdsa_curve` - [Optional] When algorithm is "ECDSA", the name of the elliptic curve to use. May be any one of "P224", "P256", "P384" or "P521". Defaults to \"P224\".

## Outputs

- `algorithm` - The algorithm that was selected for the key.
- `private_key_pem` - The private key data in PEM format.
- `private_key_filename` - The private key filename.
- `public_key_pem` - The public key data in PEM format.
- `public_key_openssh` - The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves "P256", "P384" and "P251" are supported. This attribute is empty if an incompatible ECDSA curve is selected.

## Module Dependencies

This module has no external dependencies.

## Authors

HashiCorp Solutions Engineering Team.

## License

Mozilla Public License Version 2.0. See LICENSE for full details.
