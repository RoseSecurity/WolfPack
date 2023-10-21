# DISCLAIMER:
# See the variables.pkr.hcl file for a description of each of the variables.
# Some variables are excluded intentionally, and care should be taken if
# adjusting from the default.

# HOW TO USE:
# Uncomment the below for each variable you want to override after renaming
# this file to answers.auto.pkrvars.hcl from answers.auto.pkrvars.hcl.tpl

region                   = "us-east-1"
vpc_id                   = "vpc-0b2459d2135088fb6"
subnet_id                = "subnet-004ff98e4cdb92768"
ami_name                 = "apache-redirector"
instance_type            = "t3.nano"
ssh_username             = "ubuntu"
ssh_agent_auth_enabled    = false
temporary_key_pair_type  = "ed25519"
associate_public_ip_address = true
device_name              = "/dev/sda1"
volume_size              = 32
volume_type              = "gp2"
delete_on_termination    = true
name                     = "Redirector"
