#generating key-pairs
#it generates the key pairs like in aws manually we genarated pem file

resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = file("${path.module}/terra-ec2-key.pub")
}

#vpc security group
resource "aws_default_vpc" "default" {
  
}

#security groups

resource "aws_security_group" "security-group" {
  name        = "automate-ssh"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id
  
  #inbound rules
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allows ssh inboud traffic"
  }

  #outbound rule
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all outbound traffic"
  }

  tags = {
    Name = "automate-ssh"
  }
}

#ec2 instance

resource "aws_instance" "ec2-instance"{
    key_name = aws_key_pair.ec2-key.key_name
    security_groups = [aws_security_group.security-group.name]
    instance_type = var.instance_type
    ami = var.ami_id
    user_data = file("${path.module}/script.sh")

    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
    }

    tags = {
        name = "terraform-ec2"
    }
}