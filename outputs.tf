output "webserver_ids" {
  value = ["${aws_instance.webserver.*.id}"]
}

output "ip_addresses" {
  value = ["${aws_instance.webserver.*.public_ip}"]
}

output "keyvalue" {
  value = tls_private_key.oskey.public_key_openssh
}
