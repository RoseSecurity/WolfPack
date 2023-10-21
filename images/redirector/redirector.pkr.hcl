# Build an Apache redirector
source "amazon-ebs" "redirector" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  ssh_username  = var.ssh_username
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
  ssh_agent_auth = var.ssh_agent_auth_enabled
  temporary_key_pair_type = var.temporary_key_pair_type
  associate_public_ip_address = var.associate_public_ip_address

  # AMI details
  source_ami_filter {
    filters = {
      architecture        = "x86_64"
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  # EBS 
  launch_block_device_mappings {
    device_name           = var.device_name
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }

# If you do not have a VPC or Subnet ID, you can use these filters to assist in assignment
#  vpc_filter {
#    filters = {
#      "isDefault" : "false",
#    }
#  }

#  subnet_filter {
#    filters = {
#      "state" : "available"
#    }
#    most_free = true
#    random    = false
#  }

  tags = {
    Name = "Redirector"
  }
}

build {
  sources = [
    "source.amazon-ebs.redirector"
  ]

  provisioner "shell" {
    script = "../../scripts/user_data.sh"
  }
  provisioner "ansible-local" {
    playbook_file = "../../playbooks/apache_install.yaml"
  }
  provisioner "ansible-local" {
    playbook_file = "../../playbooks/apache_configure.yaml"
  }
  provisioner "ansible-local" {
    playbook_file = "../../playbooks/apache_start.yaml"
  }
}