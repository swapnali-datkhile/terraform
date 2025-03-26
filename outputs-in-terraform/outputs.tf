output "elastic-public-ip" {
  value = aws_eip.elastic-ip.public_ip
}

# if you have not decided which specific attribute you want you can use below approach which will give you all values related to resource
output "elastic-ip-all-details" {
  value = aws_eip.elastic-ip
}

# In some cases you want url in output. Use below approach to achieve that requirement.
output "URL" {
  value = "https://${aws_eip.elastic-ip.public_ip}:8080"
}
