# ansible-playbooks
a collection of Ansible playbooks for provisioning and deploying

## How to use ansible-playbooks 
At Right Click Design and Plate.Work, we customize these sample playbooks to quickly provision and deploy web apps for development, staging, and production. 

Typically, we spin up as many DigitalOcean Droplets or AWS Compute units as needed, update the Inventory files, then fire away. The less time on configuring servers and VMs, the more time we have for solving mysteries.

Hope you have fun!

## Install Ansible on the Control Machine
Currently Ansible can be run from any machine with Python 2.6 or 2.7 installed (Windows isn’t supported for the control machine).

For more info: http://docs.ansible.com/ansible/intro_installation.html

### On Ubuntu:
```
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

### On OS X: 
```
$ sudo easy_install pip
$ sudo pip install ansible
```

## Target Host  
We're making the following assumptions about the target host:

* Starts as a default Ubuntu 14.04 or 16.04 on a DigitalOcean Droplet
* Uses `apt-get` as the package manager 
* Accessible via public IP address or hostname 

Note: Ansible tasks will need to be updated to work for operating systems that use `rpm` or `yum` as the package manager. 

## Configuration 

### Most of the configuration happens in the `vars` directory. 

1. `vars/default.yml`: contains most of variables and preferences.
2. `vars/prod-config.yml`: contains production secrets, such as your AWS Token. This file is password protected using `ansible-vault`. The example vault's password is 'awesome'. 
3. `vars/staging-config.yml`: contains staging secrets. This file contains the exact same variables as `prod-config.yml`.

### Inventory files 

1. `production`: a list of production servers.
2. `staging`: a list of staging servers.

To make life a little easier, add the hosts to your `~/.ssh/config` file.

## Provisioning new hosts 

Time to get to the fun stuff.

```
# Provision new staging servers 
ansible-playbook -i staging provision.yml

# Provision new production servers
# '--ask-vault-pass' is required to unlock the 'prod-config.yml' file 
# the password for the sample vault is 'awesome'
ansible-playbook -i production provision.yml --ask-vault-pass
```

## Deploying

More details later. The included sample playbook is a very specific app using `pm2` and `nodejs`. 

But for now, here's how you'd deploy a new app: 

```
# Deploy to staging servers 
ansible-playbook -i staging deploy.yml

# Deploy production servers
ansible-playbook -i production deploy.yml --ask-vault-pass
```

## Future updates
* Provide more examples
  * framework-specific apps, ie. angular2, react, etc
* Add more server configuration options
  * SSL, iptables, etc
* Add backup playbooks 
* Add more provisioning playbooks 
  * nginx, tomcat, etc 
* Add support for additional platforms
  * CentOS, Arch Linux, etc 

## Have fun!
Find us at https://rcd.cool and get in touch at hello@rcd.cool. 

## MIT License