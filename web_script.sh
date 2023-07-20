#!/bin/bash

yum install epel-release -y
yum install nginx -y
systemctl enable nginx.service
systemctl restart nginx.service
yum install rsyslog -y
rsync -P /vagrant/web/nginx.conf /etc/nginx/
systemctl restart nginx
rsync -P /vagrant/web/audit.rules /etc/audit/rules.d/
service auditd restart
yum install audispd-plugins -y
rsync -P /vagrant/web/auditd.conf /etc/audit/
rsync -P /vagrant/web/au-remote.conf /etc/audisp/plugins.d/
rsync -P /vagrant/web/audisp-remote.conf /etc/audisp/
service auditd restart

