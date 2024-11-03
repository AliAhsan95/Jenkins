provider "aws" {
  region = "us-east-1"  
}

# Define a security group that allows HTTP and SSH access
resource "aws_security_group" "allow_http_and_ssh" {
  name        = "allow_http_and_ssh"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Ubuntu EC2 instance
resource "aws_instance" "ubuntu1_instance" {
  ami                    = "ami-0866a3c8686eaeeba"  # Replace with the Ubuntu AMI ID
  instance_type          = "t2.micro"
  key_name               = "devopskeypair2"  # Replace with your EC2 key pair name
  vpc_security_group_ids = [aws_security_group.allow_http_and_ssh.id]  # Reference the security group ID

  tags = {
    Name = "Ubuntu-Instance"
  }
}

# RHEL EC2 instance
resource "aws_instance" "rhel1_instance" {
  ami                    = "ami-0583d8c7a9c35822c"  # Replace with the RHEL AMI ID
  instance_type          = "t2.micro"
  key_name               = "devopskeypair2"  # Replace with your EC2 key pair name
  vpc_security_group_ids = [aws_security_group.allow_http_and_ssh.id]  # Reference the security group ID

  tags = {
    Name = "RHEL-Instance"
  }
}

