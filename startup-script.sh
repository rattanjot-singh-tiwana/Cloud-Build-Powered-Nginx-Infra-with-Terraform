#!/bin/bash
echo "Running startup script" > /var/log/startup-script.log
sudo apt update
sudo apt install -y nginx
curl -o /var/www/html/index.html https://raw.githubusercontent.com/rattanjot-singh-tiwana/Cloud-Build-Powered-Nginx-Infra-with-Terraform/refs/heads/main/index.html
echo "Startup script completed" >> /var/log/startup-script.log
