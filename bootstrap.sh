#!/bin/bash

# Update on witch build 
sudo apt-get update 

# Install NodeJs 12
wget -qO- https://deb.nodesource.com/setup_12.x | -E bash -
apt-get install -yq nodejs

# Install Nginx 
apt-get install -yq nginx