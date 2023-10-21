#!/usr/bin/env bash

set -x

# Install necessary dependencies
sudo apt-get update -y
sudo apt-get -y -qq install curl wget git vim apt-transport-https ca-certificates software-properties-common

# Add Ansible repository
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# Create the 'operators' group (if it doesn't already exist)
sudo groupadd -r operators

# Create the 'operator' user and add it to the 'operators' group
sudo useradd -m -s /bin/bash -g operators operator

# Copy the sudoers file for backup
sudo cp /etc/sudoers /etc/sudoers.orig

# Add the 'operator' user to the sudoers file
echo "operator  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/operator
