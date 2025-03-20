provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678" # Invalid: TFLint may warn about hardcoded AMI IDs
  instance_type = "t2.micro"     # Warning: May suggest a more recent instance type
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_security_group" "example" {
  name        = "example_sg"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Critical: Open SSH to the world
  }
}
