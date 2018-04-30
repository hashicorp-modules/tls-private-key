output "zREADME" {
  value = <<README
A private RSA key has been generated and downloaded locally. The file permissions have been changed to 0600 so the key can be used immediately for SSH or scp.

Run the below command to add this private key to the list maintained by ssh-agent so you're not prompted for it when using SSH or scp to connect to hosts with your public key.

  ${format("ssh-add %s", module.tls_private_key.private_key_filename)}

The public part of the key loaded into the agent ("public_key_openssh" output) must be placed on the target system in ~/.ssh/authorized_keys.

To SSH into a host using this private key, you can use the below command after updating USER@HOST.

  ${format("ssh -i %s USER@HOST", module.tls_private_key.private_key_filename)}

To force the generation of a new key, the private key instance can be "tainted" using the below command.

  terraform taint -module=tls_private_key tls_private_key.key
README
}

output "algorithm" {
  value = "${module.tls_private_key.algorithm}"
}

output "private_key_name" {
  value = "${module.tls_private_key.private_key_name}"
}

output "private_key_filename" {
  value = "${module.tls_private_key.private_key_filename}"
}

output "private_key_pem" {
  value = "${module.tls_private_key.private_key_pem}"
}

output "public_key_pem" {
  value = "${module.tls_private_key.public_key_pem}"
}

output "public_key_openssh" {
  value = "${module.tls_private_key.public_key_openssh}"
}
