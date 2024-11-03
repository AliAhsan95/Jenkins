provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "amazon_linx" {
    count = 1
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_http_and_ssh.id]
    key_name = "devopskeypair2"
    tags = {
        name = "aws_instance"
    }
}

