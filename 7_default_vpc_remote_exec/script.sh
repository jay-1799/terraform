#!/bin/bash


until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done


##install nginx
# sudo yum update -y
# sudo yum install -y nginx 
sudo amazon-linux-extras install -y nginx1

sudo systemctl start nginx
sudo systemctl enable nginx