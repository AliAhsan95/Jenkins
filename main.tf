provider "aws" {
  region = "us-east-1"  
}

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0866a3c8686eaeeba" 
  instance_type = "t2.micro"

   vpc_security_group_ids = [aws_security_group.allow_http_and_ssh.id]
    key_name = "devopskeypair2"

  tags = {
    Name = "Ubuntu-Instance"
  }
}

resource "aws_instance" "rhel_instance" {
  ami           = "ami-0583d8c7a9c35822c"  
  instance_type = "t2.micro"

 vpc_security_group_ids = [aws_security_group.allow_http_and_ssh.id]
    key_name = "devopskeypair2"



  tags = {
    Name = "RHEL-Instance"
  }
}

