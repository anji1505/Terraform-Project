provider "aws" {
  profile    = "default"
  region     = "ap-south-1"
  access_key = "AKIA2MNVMFO5YFL4765I"
  secret_key = "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"
}

# Create the key pair
variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "terraform-test-key"
}

# Generate SSH Key Pair
resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create Key Pair in AWS for EC2 instance
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

# Save PEM file locally
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = "E:/Terraform-Project/${var.key_name}.pem"  # Adjust path as needed
}

resource "aws_security_group" "terraform_ec2_security_group" {
  name        = "terraform-ec2-security-group"
  description = "This is a terraform-ec2-server Instance security group"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 1433
    to_port     = 1433
    cidr_blocks = ["18.223.240.65/32"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 9000
    to_port     = 9000
    cidr_blocks = ["18.223.240.65/32"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["18.223.240.65/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["18.223.240.65/32"]
  }

  ingress {
    from_port   = 4200
    to_port     = 4200
    protocol    = "tcp"
    cidr_blocks = ["18.223.240.65/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["18.223.240.65/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["18.223.240.65/32"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform_test" {
  ami                    = var.ami_id
  instance_type         = var.terraform_test_instance_type  # Changed to new variable
  availability_zone     = var.availability_zones
  security_groups       = [aws_security_group.terraform_ec2_security_group.name]  # Use security group name
  user_data             = file("script1.sh")
  associate_public_ip_address = var.add_public_ip_address
  tags                  = { Name = var.hostname }
  key_name      = aws_key_pair.key_pair.key_name  # Use the correct key pair resource name
  root_block_device {
    volume_size = var.root_volume_size
  }
}

output "terraform-ec2-server_ip_is" {
  value = aws_instance.terraform_test.public_ip  # Get the public IP of the instance
}

