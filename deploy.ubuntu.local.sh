#!/bin/sh
  
echo "###Deploy Ubuntu###"
echo "Init creating ssh key to verify conectivity...."

sudo apt install -y software-properties-common

sudo add-apt-repository --yes --update ppa:ansible/ansible

sudo apt install -y ansible git net-tools

ssh-keygen -q -b 2048 -t rsa -N "" -C "creating SSH" -f KEY-UBUNTU

chmod 400 KEY-UBUNTU

cat KEY-UBUNTU.pub >> ~/.ssh/authorized_keys

git clone https://github.com/alexolomeo/drupal.docker.git

ansible -i hosts -m ping all

ansible-playbook -i hosts deploy.yml -v

