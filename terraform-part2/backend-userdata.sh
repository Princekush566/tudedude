#!/bin/bash

exec > /var/log/user-data.log 2>&1

apt-get update -y

apt-get install -y git python3-pip

cd /home/ubuntu

git clone https://github.com/Princekush566/tudedude.git

cd tudedude/backend

pip3 install --break-system-packages --ignore-installed -r requirements.txt

nohup python3 app.py > backend.log 2>&1 &