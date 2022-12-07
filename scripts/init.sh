#!/bin/bash
#Installing Docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-cache -y policy docker-cee
sudo apt install -y docker-ce
sudo usermod -a -G docker ubuntu
sudo systemctl enable docker
sudo systemctl restart docker
sudo apt install -y nginx
cd /etc/nginx/sites-available
sudo cat << 'EOF' > /etc/nginx/sites-available/node_app.conf
server {
              listen 80;
              server_name _;
              location / {
                           proxy_pass http://localhost:3000;
                           proxy_http_version 1.1;
                           proxy_set_header Upgrade $http_upgrade;
                           proxy_set_header Connection 'upgrade';
                           proxy_set_header Host $host;
                           proxy_cache_bypass $http_upgrade;
               }
}
EOF
cd /etc/nginx/sites-enabled
sudo ln -s ../sites-available/node_app.conf .
sudo unlink default
sudo systemctl reload nginx

