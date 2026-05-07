#!/bin/bash

exec > /var/log/user-data.log 2>&1

apt-get update -y

apt-get install -y git curl

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

apt-get install -y nodejs

cd /home/ubuntu

git clone https://github.com/Princekush566/tudedude.git

cd tudedude/frontend

echo "BACKEND_URL=http://${backend_ip}:5000" > .env

npm install

nohup node server.js > frontend.log 2>&1 &