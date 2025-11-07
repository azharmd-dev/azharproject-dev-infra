#!/bin/bash

component=$1
env=$2

#Installing Ansible
dnf install ansible -y

REPO_URL=https://github.com/azharmd-dev/ansible-roles-tf.git
Repo_Dir=/opt/azharprojects/ansible
Ansible_Dir=ansible-roles-tf

mkdir -p $Repo_Dir
mkdir -p /var/log/azharprojects/
touch ansible.log

cd $Repo_Dir

# check if ansible repo is already cloned or not

if [ -d $Ansible_Dir ]; then

    cd $Ansible_Dir
    git pull
else
    git clone $REPO_URL
    cd $Ansible_Dir
fi

ansible-playbook -e component=$component -e env=$env main.yaml


