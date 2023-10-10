#!/usr/bin/env bash

# Script to stand up infrastructure

echo "ami_id = \"$(packer build -machine-readable images/redirector.pkr.hcl | awk -F, '$0 ~/artifact,0,id/ {print $6}')\"" > terraform.tfvars

terraform init 
terraform apply -auto-approve