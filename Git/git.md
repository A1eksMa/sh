# Install GIT

## Set environment variables

Open the `.bashrc` file in a text editor using the command:
```bash
nano ~/.bashrc
```
Add the following block lines to the end of the file:
```~/.bashrc
# Configure git
export GIT_EMAIL="you@example.com"
export GIT_USER="Your Name"
```
Press `Ctrl + o` and `Enter` to save, and after press `Ctrl + x` to quit.

Reload the `.bashrc` file by running the command:
```bash
source ~/.bashrc
```

## Install
```bash
sudo apt update && sudo apt install git
```
## Configure
```bash
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER
```
