#!/bin/bash

apt-get -y update
apt-get -y install vim && apt-get -y install curl
apt-get -y install sudo
apt-get -y install whois

user=carole
mdp=$(mkpasswd $user)
useradd $user --password $mdp -s /bin/bash
usermod -aG sudo $user
