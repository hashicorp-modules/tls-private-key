# TLS Private Key Terraform Module

- Generates a secure RSA or ECDAS private key
- Encodes the private key as PEM
- Downloads the private key locally and sets the file permission to 0600

Checkout [examples](./examples) for fully functioning examples.

## Environment Variables

This module doesn't require any environment variables to be set.

## Input Variables

- `create`: [Optional] Create Module, defaults to true.
- `name`: [Optional] Filename to write the private key data to, default to "tls-private-key".
- `algorithm`: [Optional] The name of the algorithm to use for the key. Currently-supported values are "RSA" and "ECDSA". Defaults to "RSA"
- `rsa_bits`: [Optional] When algorithm is "RSA", the size of the generated RSA key in bits. Defaults to "2048".
- `ecdsa_curve`: [Optional] When algorithm is "ECDSA", the name of the elliptic curve to use. May be any one of "P224", "P256", "P384" or "P521". Defaults to \"P224\".
- `permissions`: [Optional] The Unix file permission to assign to the cert files (e.g. 0600), defaults to "0600".

## Outputs

- `algorithm`: The algorithm that was selected for the key.
- `private_key_pem`: The private key data in PEM format.
- `private_key_name`: The private key filename.
- `private_key_filename`: The private key filename with file extension.
- `public_key_pem`: The public key data in PEM format.
- `public_key_openssh`: The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves "P256", "P384" and "P251" are supported. This attribute is empty if an incompatible ECDSA curve is selected.

## Submodules

This module has no submodules.

## Authors

HashiCorp Solutions Engineering Team.

## License

Mozilla Public License Version 2.0. See LICENSE for full details.
