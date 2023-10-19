# Build an Apache redirector
source "amazon-ebs" "redirector" {
  ami_name      = "apache-redirector"
  instance_type = "t3.nano"
  region        = "us-east-1"
  ssh_username  = "ubuntu"
  vpc_id = "vpc-0b2459d2135088fb6"
  subnet_id = "subnet-0b6f6fba869bd8e31"
  ssh_agent_auth = false
  temporary_key_pair_type = "ed25519"
  associate_public_ip_address = true
  user_data_file = "../../scripts/user_data.sh"

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
    device_name           = "/dev/sda1"
    volume_size           = 32
    volume_type           = "gp2"
    delete_on_termination = true

  }

  #vpc_filter {
    #filters = {
      #"isDefault" : "false",
    #}
  #}

 # subnet_filter {
  #  filters = {
   #   "state" : "available"
    #}
    #most_free = true
    #random    = false
  #}
  tags = {
    Name = "Redirector"
  }
}

build {
  sources = [
    "source.amazon-ebs.redirector"
  ]

  provisioner "ansible-local" {
    playbook_file = "../../playbooks/apache_install.yaml"
  }
  provisioner "shell" {
    script = "../../scripts/apache_redirector.sh"
  }
  provisioner "ansible-local" {
    playbook_file = "../../playbooks/apache_start.yaml"
  }
}