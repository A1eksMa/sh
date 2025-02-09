#!/bin/bash
# Set environment variables
echo "export GIT_EMAIL=/"you@example.com/"" >> ~/.bashrc
echo "export GIT_USER=/"Your Name/"" >> ~/.bashrc
echo "export GIT_TOKEN=/"Your Secret Token/"" >> ~/.bashrc
source ~/.bashrc

# Update packages and Install git
apt update && apt install git

# Configure git
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER
