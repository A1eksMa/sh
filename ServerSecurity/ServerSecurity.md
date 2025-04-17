# Server Security
[My First 5 Minutes On A Server; Or, Essential Security for Linux Servers • Bryan Kennedy](https://github.com/A1eksMa/sh/blob/main/links/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers.md),   
[Первые 10 минут на сервере](https://habr.com/ru/companies/rootwelt/articles/303462/)

## Key Steps to Make Your Web Server Secure:
### Create strong passwords
Set n environment variables
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
### Limit superuser/root access
Add non-root user with sudo
```bash
# Check if the user variable is set
if [ -z "$USER" ]; then
  echo "Error: The user variable is not set."
  exit 1
fi

# Create the user
useradd -m -s /bin/bash $USER

# Use bash as a default shell
usermod -s /bin/bash $USER

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
Generate an SSH key pair for root on a local computer:
- rsa - an old algorithm based on the difficulty of factoring large numbers,
- key size of at least 2048 bits is recommended for RSA; 4096 bits is better.
  
```bash
ssh-keygen -t rsa -b 4096
```

Click `Enter` to skip this options:
```
>> Enter file in which to save the key (/home/user/.ssh/id_rsa):
>> Enter passphrase (empty for no passphrase):
>> Enter same passphrase again:
>> Your identification has been saved in /home/user/.ssh/id_rsa.
>> Your public key has been saved in /home/user/.ssh/id_rsa.pub.
```

If you get the `id_rsa` key, you can generate the public key only:
```bash
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub
```

To use public key authentication, the public key must be copied to a server and installed in an `authorized_keys` file. This can be conveniently done using the ssh-copy-id tool. Like this:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
```

Generate an SSH key pair for non-root user
```bash
mkdir /home/$USER/.ssh
chmod 700 /home/$USER/.ssh
cd /home/$USER/.ssh/
touch authorized_keys
```
Copy id_rsa.pub into file /home/$USER/.ssh/authorized_keys from environment variable:
```bash
echo $USER_RSA_PUB >> /home/$USER/.ssh/authorized_keys
```
or use text editor:
```bash
nano /home/$USER/.ssh/authorized_keys
```
Pastle the content of `id_rsa.pub`, press `Ctrl + o` and `Enter` to save, and after press `Ctrl + x` to quit.

```bash
chmod 400 /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER -R
```

Добавляем группу %sudo под рутовым пользователем, как показано ниже. Убедитесь, что все остальные пользователи и группы отбиты комментариями с символом # (у пользователей нет префиксов, а группы начинаются с %). На большинстве свежих установок там ничего нет, но на всякий случай.
```bash
root ALL=(ALL) ALL
%sudo ALL=(ALL:ALL) ALL
# Add user to sudo group
usermod -aG sudo $USER
```
Конфигурация ssh для этой машины хранится здесь:

nano /etc/ssh/sshd_config
PermitRootLogin no
PasswordAuthentication no


```bash
service ssh restart
```



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
apt update && apt upgrade -y && apt autoremove -y
(crontab -l ; echo "0 0 * * * apt update && apt upgrade -y") | crontab -
```
This command appends the new cron task to the existing crontab file


### Use firewalls
Во-первых, следует убедиться в поддержке IPv6. Откройте конфигурационный файл.

vim /etc/default/ufw

Установите IPv6 в значение yes.

IPV6=yes


```bash
#!/bin/bash
apt install ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable
ufw status verbose
```

### Consider using Linux as your web server operating system
### Utilize VPNs and private networks
### Use a multi-server environment
### Employ dedicated servers for maximum security
### Implement regular backups
### Monitor server logs
У DigitalOcean есть отличное описание установки и настройки Logwatch, но если мы хотим уложиться в 10 минут, то просто установим его и сделаем задание cron для ежедневного запуска и отправки письма по электронной почте.

apt install logwatch

Добавляем задание cron.

nano /etc/cron.daily/00logwatch

Добавьте следующую строку в файл cron:

/usr/sbin/logwatch --output mail --mailto $EMAIL --detail high
### Secure the filesystem
### Disable unnecessary services
### Implement ongoing security training
