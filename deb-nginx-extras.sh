#!/bin/bash
#===================================================================
#---------------- Install NGINX (debian repository) ----------------
#---Debian
#---Install the prerequisites:
sudo apt update & upgrade
sudo apt install -y nginx nginx-extras

echo "#============================================================"
echo "Install version:"
sudo nginx -v
