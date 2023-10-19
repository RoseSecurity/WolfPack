# AWS region where resources will be created (string)
variable "region" {
  type = string
  default = "us-east-1"
  description = "AWS region for resources"
}

# VPC ID where instance will be launched (string)
variable "vpc_id" {
  type = string
  default = "vpc-0b2459d2135088fb6"
  description = "ID of VPC for launching instance"
}

# Subnet ID in VPC for launching instance (string)
variable "subnet_id" {
  type = string
  default = "subnet-0b6f6fba869bd8e31"
  description = "Subnet ID for launching instance"
}

# AMI name to lookup for creating instance (string)
variable "ami_name" {
  type = string
  default = "apache-redirector"
  description = "AMI name to lookup for instance"
}

# Instance type for launching EC2 instance (string)
variable "instance_type" {
  type = string
  default = "t3.nano"
  description = "EC2 instance type"
}

# SSH username for connecting to instance (string)
variable "ssh_username" {
  type = string
  default = "ubuntu"
  description = "SSH username for instance"
}

# Use SSH agent for authentication (bool)
variable "ssh_agent_auth" {
  type = bool
  default = false
  description = "Whether to use SSH agent for auth"
}

# Type of temporary SSH key pair to create (string)
variable "temporary_key_pair_type" {
  type = string
  default = "ed25519"
  description = "Temporary SSH key pair type"
}

# Assign a public IP address to instance (bool)
variable "associate_public_ip_address" {
  type = bool
  default = true
  description = "Whether to assign public IP to instance"
}

# Size of EBS volume in GB (number)
variable "volume_size" {
  type = number
  default = 32
  description = "EBS volume size (GB)"
}

# EBS volume type (gp2, io1, etc) (string)
variable "volume_type" {
  type = string
  default = "gp2"
  description = "EBS volume type"
}

# Delete EBS volume on instance termination (bool)
variable "delete_on_termination" {
  type = bool
  default = true
  description = "Delete EBS volume on termination"
}

# Name tag for EC2 instance (string)
variable "name" {
  type = string
  default = "Redirector"
  description = "Name tag for EC2 instance"
}