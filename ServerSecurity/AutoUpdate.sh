#!/bin/bash
# Update packages on a Linux server
apt update && apt upgrade -y && apt autoremove -y

# This command appends the new cron task to the existing crontab file
(crontab -l ; echo "0 0 * * * apt update && apt upgrade -y") | crontab -
