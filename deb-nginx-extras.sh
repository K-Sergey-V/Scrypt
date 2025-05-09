#!/bin/bash
#===================================================================
#---------------- Install NGINX (debian repository) ----------------
#---Debian
#---Install the prerequisites:
echo "#============================================================"
echo "update && upgrade:"
sudo apt update && upgrade

echo "#============================================================"
echo "Install nginx-extras:"
sudo apt install -y nginx nginx-extras

echo "#============================================================"
echo "Install version:"
sudo nginx -v
