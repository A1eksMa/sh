```bash
#!/bin/bash
#Installing java:
apt install openjdk-14-jdk -y
#Set $JAVA_HOME:
echo JAVA_HOME="/usr/lib/jvm/java-1.14.0-openjdk-amd64" >> /etc/environment
source /etc/environment
#Setting tomcat-user:
groupadd tomcat
useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
mkdir /opt/tomcat
#Installing tomcat:
cd /tmp
#download
apache-tomcat-9.0.43.tar.gz
tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
#Setting tomcat permissions:
cd /opt/tomcat
chmod -R g+r conf
chmod g+x conf
chgrp -R tomcat bin
chmod g+rwx bin
chmod g+r bin/*
chown -R tomcat webapps/ work/ temp/ logs/
cd /opt/
chgrp -R tomcat tomcat
chown -R tomcat tomcat
#Update tomcat settings:
/etc/systemd/system/tomcat.service

systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat
```
```bash
#Installing dependencies:
apt update && apt upgrade -y
apt install build-essential libvncserver-dev libcairo2-dev libjpeg-turbo8-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev -y

#Installing guacamole-server:
cd /tmp
# download
./guacamole-server-1.3.0.tar.gz
# unpack
tar -xzf guacamole-server-1.3.0.tar.gz
cd guacamole-server-1.3.0/
./configure --with-init-dir=/etc/init.d && make && make install
#Installing guacamole-client:
# download
/opt/tomcat/webapps/guacamole.war
# Settings:
mkdir /etc/guacamole/
/etc/guacamole/guacamole.properties
/etc/guacamole/user-mapping.xml
#Starting:
ldconfig
/etc/init.d/guacd start
systemctl enable guacd
systemctl restart tomcat
```
