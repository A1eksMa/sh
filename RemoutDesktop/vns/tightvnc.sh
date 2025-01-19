#!/bin/bash
apt update && apt upgrade -y
apt install tightvncserver -y
#mv ~/.vnc/xstartup ~/.vnc/xstartup.bak.bak
aws s3 cp s3://my.rep/tightvncserver/xstartup ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup
#vncserver -localhost
#Password:	VNCUser
#Verify:	VNCUser
#Would you like to enter a view-only password (y/n)? n
#vncserver -kill :1
