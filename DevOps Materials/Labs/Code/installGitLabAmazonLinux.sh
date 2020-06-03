#!/bin/bash

#change the hostname to the external dns
sudo hostname $(curl http://169.254.169.254/latest/meta-data/public-ipv4)

#install the dependencies.
sudo yum install -y curl openssh-server postfix cronie 
sudo service postfix start 
sudo chkconfig postfix on 

#add the rpm and install gitlab
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash 

sudo yum install -y gitlab-ce

#tell it to reconfigure to set everything up
sudo gitlab-ctl reconfigure

