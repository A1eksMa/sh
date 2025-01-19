#!/bin/bash
apt update && apt upgrade -y
apt install xrdp -y
systemctl enable xrdp
adduser xrdp ssl-cert
mv /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bak
nano /etc/xrdp/startwm.sh
#aws s3 cp s3://my.rep/xrdp/startwm.sh /etc/xrdp/startwm.sh
chmod 755 /etc/xrdp/startwm.sh
systemctl restart xrdp
