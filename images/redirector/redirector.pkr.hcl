# Build an Apache redirector
source "amazon-ebs" "redirector" {
  ami_name      = "apache-redirector"
  instance_type = "t2.micro"
  region        = var.region
  ssh_username  = "operator"

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
}


build {
  sources = ["source.amazon-ebs.redirector"]

  provisioner "shell" {
    script = "../scripts/apache_redirector.sh"
  }
}