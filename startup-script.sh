#!/bin/bash
echo "Running startup script" > /var/log/startup-script.log
sudo apt update
sudo apt install -y nginx
#sudo cp index.html /var/www/html/index.html
echo "Startup script completed" >> /var/log/startup-script.log
