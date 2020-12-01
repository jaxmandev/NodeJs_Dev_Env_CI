#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

# Install nginx
sudo apt-get install nginx -y

# Unlink default file
sudo unlink /etc/nginx/sites-enabled/default
# go to directory
cd /etc/nginx/sites-available

# Create a new configuration file
touch custom_server.conf
# Add the following commands
echo """server {

listen 80;

location / {

proxy_pass http://192.168.10.100:3000;

}

}
""" | sudo tee custom_server.conf

# Create a symbolic link to copy data between files
sudo ln -s /etc/nginx/sites-available/custom_server.conf /etc/nginx/sites-enabled/custom_server.conf

# Test the nginx service
sudo service nginx configtest


# Restart the nginx service so the new config takes hold
sudo service nginx restart

# Navigate to the app location
cd /home/ubuntu/app

# Start the app
pm2 start app.js --update-env
