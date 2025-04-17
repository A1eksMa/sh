#!/bin/bash
apt update && apt upgrade -y
apt install ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable
