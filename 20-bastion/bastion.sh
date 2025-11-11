#!/bin/bash

# growing the /home volume for terraform purpose
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

#Installing Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# creating databases
cd /home/ec2-user
git clone https://github.com/azharmd-dev/azharproject-dev-infra
chown ec2-user:ec2-user -R azharproject-dev-infra
cd azharproject-dev-infra/40-databases
terraform init
terraform apply -auto-approve