#!/usr/bin/env bash

set -euo pipefail

# Update package list and install necessary dependencies
sudo apt-get update -y
sudo apt-get install -y \
    curl \
    wget \
    git \
    vim \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# Add Ansible repository and install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# Create the 'operators' group (if it doesn't already exist)
if ! getent group operators > /dev/null; then
    sudo groupadd -r operators
fi

# Create the 'operator' user and add it to the 'operators' group
if ! id -u operator > /dev/null 2>&1; then
    sudo useradd -m -s /bin/bash -g operators operator
fi

# Backup the sudoers file
sudo cp /etc/sudoers /etc/sudoers.orig

# Add the 'operator' user to the sudoers file
echo "operator  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/operator > /dev/null

# Ensure the correct permissions for the sudoers file
sudo chmod 0440 /etc/sudoers.d/operator
