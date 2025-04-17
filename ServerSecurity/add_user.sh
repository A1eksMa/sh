#!/bin/bash
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

# Add user to sudo group
usermod -aG sudo $USER

# Allow user password authentication. Uncomment this block, if you need.
# echo "Match User username" >> /etc/ssh/sshd_config
# echo "    PasswordAuthentication yes" >> /etc/ssh/sshd_config
# systemctl restart sshd

# Configure SSH access
mkdir /home/$USER/.ssh
chmod 700 /home/$USER/.ssh
cd /home/$USER/.ssh/

# Put `id_rsa.pub` into user's `authorized_keys` file
touch authorized_keys
echo $USER_RSA_PUB >> /home/$USER/.ssh/authorized_keys

# Set user rights
chmod 400 /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER -R
