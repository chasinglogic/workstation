#!/bin/bash

echo "Installing prereqs..."
if [[ -f $(which apt) ]]; then
    sudo apt install -y ansible build-essential python3
else
    sudo dnf install -y ansible
fi

echo "Installing roles"
ansible-galaxy install -r requirements.yml

echo "Running playbook"
ansible-playbook -i inventory playbook.yml
