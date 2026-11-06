output "aws_ec2_public_ip" {
  value = aws_instance.ec2-instance.public_ip
}

output "aws_ec2_public_dns" {
  value = aws_instance.ec2-instance.public_dns
}