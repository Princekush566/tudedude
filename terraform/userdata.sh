#!/bin/bash

exec > /var/log/user-data.log 2>&1

apt-get update -y

# Install basic packages
apt-get install -y git python3-pip curl

# Install Node.js 18 properly
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Move to home
cd /home/ubuntu

# Clone repo
git clone https://github.com/Princekush566/tudedude.git

# Backend setup
cd tudedude/backend

pip3 install --break-system-packages -r requirements.txt

nohup python3 app.py > backend.log 2>&1 &

# Frontend setup
cd ../frontend

npm install

nohup node server.js > frontend.log 2>&1 &