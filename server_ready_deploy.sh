#!/bin/bash

nginx_status=$(dpkg -l | grep -qw nginx)
repo_dir="/home/nouman/test/Demo/"
clone_dir="/home/nouman/test/"
repo_URL="https://github.com/NomiRajpoot1/Demo.git"
server_dir="/var/www/html/"


if $nginx_status; then 
	echo 'Nginx is already install'
else
	echo 'Nginx installing......'
	sudo apt install nginx -y
	systemctl start nginx
fi 
systemctl status nginx --no-pager

if [ ! -d "$repo_dir" ]; then 
	echo 'Repository cloning....'
	cd "$clone_dir"
	git clone "$repo_URL" "$repo_dir"
        cd "$repo_dir"	
else
    echo "Repository already cloned. Pulling the latest changes..."
    cd "$repo_dir"
    git pull
fi

echo 'Moving file into server...'
sudo cp -r * "$server_dir"
echo '##  Ended  ##'
