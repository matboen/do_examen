#!/usr/bin/env bash
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible sshpass

cp /vagrant/hosts /etc/hosts


KNOW_HOSTS_FILE="/home/vagrant/.ssh/known_hosts"

if [ -f "$KNOW_HOSTS_FILE" ]; then
    echo "Removing $KNOW_HOSTS_FILE"
    rm $KNOW_HOSTS_FILE
fi

ssh-keyscan www1 192.168.55.89 >> $KNOW_HOSTS_FILE 
ssh-keyscan mgr 192.168.55.1 >> $KNOW_HOSTS_FILE
chown vagrant:vagrant $KNOW_HOSTS_FILE 




# TODO: ssh-keyscan can be replaced if a playbook is created that copies the
# files, ssh-agent needs to be implemented as wel.

