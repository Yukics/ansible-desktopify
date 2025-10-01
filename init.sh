#!/bin/bash
#set -e

if [ ! -d .venv ] && [ ! -f /tmp/already_init ]; then
    echo "[INFO] Install os dependencies"
    sudo apt update -y
    sudo apt install -y software-properties-common python3-venv python3-pip
    deactivate 2> /dev/null
    pip3 install --user --break-system-packages pywal
    python3 -m venv .venv
fi

export ANSIBLE_CONFIG='./ansible.cfg'

if [ "$(pip -V | grep `pwd`)x" == "x" ]; then
    echo "[INFO] Activate .venv"
    source .venv/bin/activate
    if [ ! -f /tmp/already_init ]; then
        echo "[INFO] Install pip dependencies"
        pip install ansible ansible-compat pexpect
    fi
fi
touch /tmp/already_init

[ -f .env ] && set -a && source .env && set +a
ansible-playbook -i inventories/inventory.ini playbooks/main.yml
