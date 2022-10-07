# let create and ec2 instance with existing key and security group ( we can access this instance.) 
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4WDBRPKYSIHCQNW4"
  secret_key = "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"
}
resource "aws_instance" "ngnit" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  key_name = "1-key"
  security_groups = ["aws_security_group.ngnit-sg.name"]

  tags = {
    Name = "Nginit-Digital"
  }
}

# security group using terra

resource "aws_security_group" "ngnit-sg" {
    name = "ngnit-sg"
    description = "ngnit-sg"
    vpc_id = "vpc-01385805fe68f1ea5"

    ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ngnit-sg"
  }
}

    