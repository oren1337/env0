resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "joomla-key-pair" {
  key_name   = "joomla-key-${random_uuid.uuid.result}"
  public_key = "${tls_private_key.private_key.public_key_openssh}"
}
