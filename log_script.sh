#!/bin/bash

yum install rsyslog -y
rsync -P /vagrant/log/rsyslog.conf /etc/
systemctl restart rsyslog
rsync -P /vagrant/log/auditd.conf /etc/audit/
service auditd restart

