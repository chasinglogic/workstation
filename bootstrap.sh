#!/bin/bash

echo "Installing prereqs..."
sudo apt install -y ansible build-essential python3

echo "Installing roles"
ansible-galaxy install -r requirements.yml

echo "Running playbook"
ansible-playbook -i inventory playbook.yml
