# create security group for my ngnit website
resource "aws_security_group" "NGNIT_sg" {
  name        = "NGNIT"
  description = "enable http/https access on port 80/443"
  vpc_id      = var.vpc_id
  # specify the vpc where you wan to create the sg,
# this rules will allow us to open the port we need. ( Tuto = https://www.youtube.com/watch?v=oohXRXjahFA)
  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "https access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "ngnit security sg"
  }
}

# create security group for the container
resource "aws_security_group" "ecs_security_group" {
  name        = "ecs security group"
  description = "enable http/https access on port 80/443 via alb sg"
  vpc_id      = var.vpc_id

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.NGNIT_sg.id] # this is the security group where you wan to allow traffic to get in to your container.
  }

  ingress {
    description      = "https access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = [aws_security_group.NGNIT_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "ecs_security_group"
  }
}
# this is all about creating the sg module. 
# next = is to export the ID of the NGNIT_sg sg and the ID of ecs_security_group because we will use it when creating other resources
# using output module. 