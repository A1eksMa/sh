#!usr/bin/bash
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
