# AWS region where resources will be created (string)
variable "region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-1"
}

# VPC ID where instance will be launched (string)
variable "vpc_id" {
  type        = string
  description = "ID of VPC for launching instance"
  default     = ""
}

# Subnet ID in VPC for launching instance (string)
variable "subnet_id" {
  type        = string
  description = "Subnet ID for launching instance"
  default     = ""
}

# AMI name to lookup for creating instance (string)
variable "ami_name" {
  type        = string
  description = "AMI name to lookup for instance"
  default     = "apache-redirector"
}

# Instance type for launching EC2 instance (string)
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.nano"
}

# SSH username for connecting to instance (string)
variable "ssh_username" {
  type        = string
  description = "SSH username for instance"
  default     = "ubuntu"
}

# Use SSH agent for authentication (bool)
variable "ssh_agent_auth_enabled" {
  type        = bool
  description = "Whether to use SSH agent for auth"
  default     = false
}

# Type of temporary SSH key pair to create (string)
variable "temporary_key_pair_type" {
  type        = string
  description = "Temporary SSH key pair type"
  default     = "ed25519"
}

# Assign a public IP address to instance (bool)
variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to assign public IP to instance"
  default     = true
}

variable "device_name" {
  type        = string
  description = "The device name exposed to the instance"
  default     = "/dev/sda1"
}

# Size of EBS volume in GB (number)
variable "volume_size" {
  type        = number
  description = "EBS volume size (GB)"
  default     = 32
}

# EBS volume type (gp2, io1, etc) (string)
variable "volume_type" {
  type        = string
  description = "EBS volume type"
  default     = "gp2"
}

# Delete EBS volume on instance termination (bool)
variable "delete_on_termination" {
  type        = bool
  description = "Delete EBS volume on termination"
  default     = true
}

# Name tag for EC2 instance (string)
variable "name" {
  type        = string
  description = "Name tag for EC2 instance"
  default     = "Redirector"
}
