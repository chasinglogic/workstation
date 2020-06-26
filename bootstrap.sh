#!/bin/bash

echo "Installing prereqs..."
sudo dnf install -y ansible make python

echo "Installing roles"
ansible-galaxy install -r requirements.yml

echo "Running playbook"
ansible-playbook -i inventory playbook.yml
