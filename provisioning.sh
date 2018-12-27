#!/usr/bin/env bash

#
# This file is executed on the VM being deployed, NOT on the host system
# ALL paths etc. are relative to the target VM environment
#
# By default, Vagrant will mount the folder with the Vagrant file as "/vagrant"
# Our "boostrap" configuration files can be accessed by using
# the "/vagrant/bootstrap/" path prefix
# -----------------------------------------------------------------------

#
# Install basic tools
#
sudo apt-get update
sudo apt-get install -y git make

#
# Install java runtime environment
#
# sudo apt-get install -y default-jdk
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

#
# Install nodejs
#
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

#
# Install elastic repositories (logstash, kibana, filebeat...)
#
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update

sudo apt-get install -y elasticsearch
# sudo service elasticsearch start called in play.sh

sudo apt-get install -y kibana
# sudo service kibana start called in play.sh

sudo apt-get install -y logstash
sudo ln -s /home/vagrant/src/02-beats-input-push.conf /etc/logstash/conf.d/02-beats-input-push.conf
sudo ln -s /home/vagrant/src/10-syslog-filter.conf /etc/logstash/conf.d/10-syslog-filter.conf
sudo ln -s /home/vagrant/src/30-elasticsearch-output.conf /etc/logstash/conf.d/30-elasticsearch-output.conf
# sudo service logstash start called in play.sh

#
# NGINX for reverse proxying to kibana
#
sudo apt-get install -y nginx
sudo ln -s /home/vagrant/src/kibana-conf /etc/nginx/sites-enabled/kibana-conf
# sudo service nginx start called in play.sh
