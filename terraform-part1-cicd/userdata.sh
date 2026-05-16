#!/bin/bash

exec > /var/log/user-data.log 2>&1

apt update -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install nodejs -y

# Install Python + Git
apt install python3-pip git -y

# Install PM2
npm install -g pm2

# Clone Repository
cd /home/ubuntu

git clone https://github.com/Princekush566/tudedude.git

cd tudedude

# Backend Setup
cd backend

pip3 install -r requirements.txt

pm2 start "python3 app.py" --name backend

# Frontend Setup
cd ../frontend

npm install

pm2 start server.js --name frontend

pm2 save

pm2 startup systemd -u ubuntu --hp /home/ubuntu

# Install Docker
apt install docker.io -y

systemctl start docker
systemctl enable docker

# Run Jenkins Container
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  jenkins/jenkins:lts