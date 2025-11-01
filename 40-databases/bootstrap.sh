#!/bin/bash

dnf install ansible -y
ansible-pull -U https://github.com/azharmd-dev/ansible-roles-tf.git -e component=mongodb main.yaml