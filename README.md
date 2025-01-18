# ServerSecurity
## Set variables
Open the `.bashrc` file in a text editor using the command:
```bash
nano ~/.bashrc
```
Add the following line to the end of the file:
```~/.bashrc
export USER="your_user_name"
export USER_PASSWORD="StrongUserPa$$w0rd"
```
Press `Ctrl + o` and `Enter` to save, and after press `Ctrl + x` to quit.
Reload the `.bashrc` file by running the command:
```bash
source ~/.bashrc
```
## Key Steps to Make Your Web Server Secure:
### Create strong passwords
### Limit superuser/root access
Add non-root user with sudo
```bash
#!/bin/bash
# Check if the user variable is set
if [ -z "$USER" ]; then
  echo "Error: The user variable is not set."
  exit 1
fi

# Create the user
useradd -m -s /bin/bash $USER

# Add user to sudo group
usermod -aG sudo,adm $USER

# Check if the user password variable is set
if [ -z "USER_PASSWORD" ]; then
  echo "Error: The user password variable is not set. User #USER created without password."
  exit 1
fi

# Set user password
{ echo $USER_PASSWORD; echo $USER_PASSWORD; } | passwd $USER

# Allow user password authentication
echo "Match User username" >> /etc/ssh/sshd_config
echo "    PasswordAuthentication yes" >> /etc/ssh/sshd_config
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
