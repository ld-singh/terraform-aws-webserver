#!/bin/bash
##Installing Docker
#sudo apt-get remove docker docker-engine docker.io
#sudo apt-get update
#sudo apt-get install -y \
#apt-transport-https \
#ca-certificates \
#curl \
#software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo apt-key fingerprint 0EBFCD88
#sudo add-apt-repository \
#"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#$(lsb_release -cs) \
#stable"
#sudo apt-get update
#sudo apt-get install docker-ce -y
#sudo usermod -a -G docker $USER
#sudo systemctl enable docker
#sudo systemctl restart docker
#sudo apt install -y nginx
#echo "Hello World" > /var/www/html/index.html
##server {
##    location / {
##        proxy_set_header Host $host;
##        proxy_set_header X-Real-IP $remote_addr;
##        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
##        proxy_set_header X-Forwarded-Proto $scheme;
##
##        proxy_pass http://localhost:3000;
##    }
##}
