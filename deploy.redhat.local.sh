#!/bin/sh
  
echo "###  Deploy RedHat  ###"
echo "Init creating ssh key to verify conectivity...."

sudo dnf update -y

sudo dnf install -y ansible git

ssh-keygen -q -b 2048 -t rsa -N "" -C "creating SSH" -f KEY-REDHAT

chmod 400 KEY-REDHAT

cat KEY-REDHAT.pub >> ~/.ssh/authorized_keys

git clone https://github.com/alexolomeo/drupal.docker.git

ansible -i hosts -m ping all

ansible-playbook -i hosts deploy.yml -v
