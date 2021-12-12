provider "aws" {
  access_key = "XXXXXXXXX"
  secret_key = "XXXXXXXXXX"
  region     = "ap-south-1"
}

#There are 3-resource in this file. 
#Create security group with firewall rules
resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_jenkins_port"
  }
}

resource "aws_instance" "myDemoInstance" {
  ami             = "ami-0002bdad91f793433"
  key_name        = var.key_name
  instance_type   = var.instance_type
  security_groups = ["security_jenkins_port"]
  tags = {
    Name = "jenkins_instance"
  }
}

# Create Elastic IP address
resource "aws_eip" "myDemoInstance" {
  vpc      = true
  instance = aws_instance.myDemoInstance.id
  tags = {
    Name = "jenkins_elstic_ip"
  }
}
