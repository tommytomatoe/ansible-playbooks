#! /bin/bash

# Ansible insall wrapper

# TODO - check if platform is Ubuntu

apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible