#!/usr/bin/env bash

echo "[INFO] Installing Ansible"
su -c "apt install ansible sshpass -y"

echo "[INFO] Running Playbook"
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i localhost, main.yml -Kk