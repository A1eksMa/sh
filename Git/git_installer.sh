#!/bin/bash
# Set environment variables
echo "export GIT_EMAIL=\"you@example.com\"" >> ~/.bashrc
echo "export GIT_USER=\"Your_Name\"" >> ~/.bashrc
# Optional:
# echo "export GIT_TOKEN=\"Your Secret Token\"" >> ~/.bashrc
source ~/.bashrc

# Update packages and Install git
sudo apt update && sudo apt install git

# Configure git
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER
