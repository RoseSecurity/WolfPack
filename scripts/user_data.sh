#!/usr/bin/env bash

set -x

# Install necessary dependencies
sudo apt-get update -y
sudo apt-get -y -qq install curl wget git vim apt-transport-https ca-certificates software-properties-common

# Add Ansible repository
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# Setup sudo to allow no-password sudo for "operators" group and adding "operator" user
sudo groupadd -r operators
sudo useradd -m -s /bin/bash operator
sudo usermod -a -G operators operator
sudo cp /etc/sudoers /etc/sudoers.orig
echo "operator  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/operator

# Installing SSH key
sudo mkdir -p /home/operator/.ssh
sudo chmod 700 /home/operator/.ssh
sudo cp /tmp/tf-packer.pub /home/operator/.ssh/authorized_keys
sudo chmod 600 /home/operator/.ssh/authorized_keys
sudo chown -R operator /home/operator/.ssh
sudo usermod --shell /bin/bash operator