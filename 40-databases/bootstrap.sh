#!/bin/bash

component=$1
dnf install ansible -y
ansible-pull -U https://github.com/azharmd-dev/ansible-roles-tf.git -e component=$component main.yaml