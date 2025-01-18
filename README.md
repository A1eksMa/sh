# ServerSecurity
## Key Steps to Make Your Web Server Secure:
### Create strong passwords
### Limit superuser/root access
```bash
#!/bin/bash
useradd -m -s /bin/bash username
usermod -aG sudo,adm username
{ echo 'StrongUserPa$$w0rd'; echo 'StrongUserPa$$w0rd'; } | passwd username

echo 'Match User sky' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
systemctl restart sshd
```
### Generate an SSH key pair
### Keep your server updated
To update packages on a Linux server:
```bash
apt update
apt upgrade -y
apt autoremove -y
```
To set up a cron task to run updates at 24:00 every day, open the crontab editor:
```bash
crontab -e
```
This will open the crontab editor in the default text editor. Add the following line to the file:
```bash
0 0 * * * apt update && apt upgrade -y
```
Save and exit the editor.

**Script**

```bash
#!/bin/bash
apt update && apt upgrade -y
apt install -y cron
(crontab -l ; echo "0 0 * * * apt update && apt upgrade -y") | crontab -
```
This command appends the new cron task to the existing crontab file


### Use firewalls
### Consider using Linux as your web server operating system
### Utilize VPNs and private networks
### Use a multi-server environment
### Employ dedicated servers for maximum security
### Implement regular backups
### Monitor server logs
### Secure the filesystem
### Disable unnecessary services
### Implement ongoing security training
