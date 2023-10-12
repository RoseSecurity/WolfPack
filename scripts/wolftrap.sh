#!/usr/bin/env bash

# Script to stand up infrastructure

# Install plugins
packer init images/redirector/

echo "ami_id = \"$(packer build -machine-readable images/redirector/redirector.pkr.hcl | awk -F, '$0 ~/artifact,0,id/ {print $6}')\"" > terraform.tfvars

terraform init 
terraform apply -auto-approve