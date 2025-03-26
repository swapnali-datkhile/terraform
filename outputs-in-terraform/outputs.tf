output "elastic-public-ip" {
  value = aws_eip.elastic-ip.public_ip
}
