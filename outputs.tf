output "algorithm" {
  value = element(concat(tls_private_key.key.*.algorithm, [""]), 0) # TODO: Workaround for issue #11210
}

output "private_key_pem" {
  value = element(concat(tls_private_key.key.*.private_key_pem, [""]), 0) # TODO: Workaround for issue #11210
}

output "private_key_name" {
  value = element(concat(random_id.name.*.hex, [""]), 0) # TODO: Workaround for issue #11210
}

output "private_key_filename" {
  value = element(
    concat(formatlist("%s.key.pem", random_id.name.*.hex), [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

output "public_key_pem" {
  value = element(concat(tls_private_key.key.*.public_key_pem, [""]), 0) # TODO: Workaround for issue #11210
}

output "public_key_openssh" {
  value = element(concat(tls_private_key.key.*.public_key_openssh, [""]), 0) # TODO: Workaround for issue #11210
}

