# Server Security

## Links
- [My First 5 Minutes On A Server; Or, Essential Security for Linux Servers • Bryan Kennedy](https://github.com/A1eksMa/sh/blob/main/links/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers.md)
- [First 10 Minutes On A Server • Den Rootwelt](https://habr.com/ru/companies/rootwelt/articles/303462/)
- [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)  

## Configure security shell (SSH)

Generate an SSH key pair on a local computer:
- rsa - an old algorithm based on the difficulty of factoring large numbers,
- key size of at least 2048 bits is recommended for RSA; 4096 bits is better.
  
```bash
ssh-keygen -t rsa -b 4096
```

Type `Enter` to skip this options or set RSA file name and secret passphrase:
```
>> Enter file in which to save the key (/home/user/.ssh/id_rsa):
>> Enter passphrase (empty for no passphrase):
>> Enter same passphrase again:
>> Your identification has been saved in /home/user/.ssh/id_rsa.
>> Your public key has been saved in /home/user/.ssh/id_rsa.pub.
```

If you get the private key, you can generate the public key only:
```bash
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub
```

To use public key authentication, the public key must be copied to a server and installed in an `authorized_keys` file.  
This can be conveniently done using the ssh-copy-id tool.  
Replace `user@host` with yours user and host! There are:
- `user` yours user name on a server,
- `host` is a server IP adress, that looks like a xxx.xxx.xxx.xxx  
Like this: `root@123.45.678.91`
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

Congratulations! Now you have access to the server by SSH (without password authorization).

## Set environment variables

Go to the remoute server as a root user and configure it!
```bash
ssh root@host
```

Open the `.bashrc` file in a text editor using the command:
```bash
nano ~/.bashrc
```

Add the following block lines to the end of the file:
```~/.bashrc
export EMAIL="your@email.com"
export USER="your_user_name"
export USER_PASSWORD="StrongUserPa$$w0rd"
export USER_RSA_PUB="id_rsa.pub_for_your_user"
```

Press `Ctrl + o` and `Enter` to save, and after press `Ctrl + x` to quit.
Reload the `.bashrc` file by running the command:
```bash
source ~/.bashrc
```

## Update

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
Run script [`AutoUpdate.sh`](AutoUpdate.sh) to update your system and configures cron to autoupdates. 

## Firewall

To use firewall, entry to a server as a root.
Sudo privillegies requared to use ufw as a non-root user.
Run script [`ufw.sh`](ufw.sh) to minimal configure the `ufw`.

```bash
apt update && apt upgrade -y
apt install ufw
```

Check IPv6 support. Open ufw configure:
```bash
nano /etc/default/ufw
```

Turn on `IPv6`:
```/etc/default/ufw
IPV6=yes
```

It's recomended to deny all incoming and allow all outgoing flows:
```bash
ufw default deny incoming
ufw default allow outgoing
```

Open SSH port to save connection with a remoute server:
```bash
ufw allow ssh
```

Start ufw:
```bash
ufw enable
```

Stop ufw
```bash
ufw disable
```

To see ufw status:
```bash
ufw status verbose
```

## Add non-root user

Run script [`AddUser.sh`](AddUser.sh) to execute steps below.
This script add non-root user with sudo privilegies and configures his password and SSH access to a server.

Create the user if user variable is set:
```bash
if [ -z "$USER" ]; then
  echo "Error: The user variable is not set."
  exit 1
fi
useradd -m -s /bin/bash $USER
```

Use bash as a default shell
```bash
usermod -s /bin/bash $USER
```

Add user to sudo group
```bash
usermod -aG sudo $USER
```

Set user password if the user password variable is set:
```bash
if [ -z "USER_PASSWORD" ]; then
  echo "Error: The user password variable is not set. User #USER created without password."
  exit 1
fi
{ echo $USER_PASSWORD; echo $USER_PASSWORD; } | passwd $USER
```

Create SSH folder for non-root user
```bash
mkdir /home/$USER/.ssh
chmod 700 /home/$USER/.ssh
```

Copy `id_rsa.pub` into file `/home/$USER/.ssh/authorized_keys` from environment variable:
```bash
cd /home/$USER/.ssh/
touch authorized_keys
echo $USER_RSA_PUB >> /home/$USER/.ssh/authorized_keys
```

or use text editor:
```bash
nano /home/$USER/.ssh/authorized_keys
```
Pastle the content of `id_rsa.pub`, press `Ctrl + o` and `Enter` to save, and after press `Ctrl + x` to quit.

Configure SSH privilegies:
```bash
chmod 400 /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER -R
```

## Configure SSH

Open file `sshd_config` in text editor:
```bash
nano /etc/ssh/sshd_config
```

Configure this options:
```/etc/ssh/sshd_config
PermitRootLogin no
PasswordAuthentication no
```
Press `Ctrl + o` and `Enter` to save, and after press `Ctrl + x` to quit.

Optional: 
Sometimes it needed to authorizate user on a remoute server with password. 
Allow user password authentication:
```bash
echo "Match User username" >> /etc/ssh/sshd_config
echo "    PasswordAuthentication yes" >> /etc/ssh/sshd_config
```

Restart ssh to apply changes.
To restart SSH daemon:
```bash
systemctl restart sshd
```

To restart SSH service:
```bash
service ssh restart
```
