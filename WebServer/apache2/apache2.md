apt install apache2 libapache2-mod-php8.0 libapache2-mod-fcgid -y
a2dismod mpm_prefork
a2enmod mpm_event ssl rewrite proxy proxy_http proxy_fcgi setenvif actions fcgid alias
a2enconf php8.0-fpm
systemctl start apache2
systemctl enable apache2
