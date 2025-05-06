#!/bin/bash
#===================================================================
#---------------- Install NGINX (debian repository) ----------------
#---Debian
#---Install the prerequisites:
#sudo apt update
#sudo apt install -y nginx nginx-extras

#===================================================================
#---------------- Install NGINX (nginx repository) -----------------
#---Debian
#---Install the prerequisites:
sudo apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring 
#---Import an official nginx signing key so apt could verify the packages authenticity. Fetch the key:
sudo curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
  | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

#---Verify that the downloaded file contains the proper key:
sudo gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
#    The output should contain the full fingerprint 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 as follows:
#    pub   rsa2048 2011-08-19 [SC] [expires: 2027-05-24]
#          573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
#    uid                      nginx signing key <signing-key@nginx.com>
#    Note that the output can contain other keys used to sign the packages. 
 
#---To set up the apt repository for stable nginx packages, run the following command:
sudo echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/debian `lsb_release -cs` nginx" \
  | sudo tee /etc/apt/sources.list.d/nginx.list
 
#---Set up repository pinning to prefer our packages over distribution-provided ones:
sudo echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
  |  sudo tee /etc/apt/preferences.d/99nginx

#---To install -y nginx, run the following commands:
sudo apt update
sudo apt install -y nginx

#---create directory
sudo mkdir -p /etc/nginx/{sites-available,sites-enabled}

#---Edit
#sudo nano /etc/nginx/nginx.conf
#---Paste
#include /etc/nginx/sites-enabled/*;
