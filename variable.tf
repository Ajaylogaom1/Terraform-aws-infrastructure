variable "instance_type"{
    description = "The instance type for the EC2 instance"
    type = string
    default = "t3.micro"
}

variable "volume_size"{
    description = "The volume size for the EBS volume"
    type = number
    default = 10
}

variable "volume_type"{
    description = "The volume type for the EBS volume"
    type = string
    default = "gp3"
}

variable "ami_id"{
    description = "the AMI ID for the Ec2 instance" 
    type = string
    default = "ami-0dd60a46ecc6eac16"
}


