#!/bin/bash
# wget https://k-sergey-v.github.io/Scrypt/deb-nginx.sh && sudo bash deb-nginx.sh
# Install lastet NGINX (nginx repository)
# version by 2025-05-12-0027
# Sergey Krichko
#===================================================================
#---------------- Install NGINX (nginx repository) -----------------
#---Debian
echo "> > > > > > > > > > > > > > > > > > > > > > > > > > > > > >"
echo "====================================================="
echo "-----------------------------------------------------"
echo "> > > > > Install NGINX (nginx repository) =====>>>>> update && upgrade:"
sudo apt update && upgrade

echo "-----------------------------------------------------"
echo "> > > > > Install NGINX (nginx repository) =====>>>>> add repository:"

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
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/debian `lsb_release -cs` nginx" \
  | sudo tee /etc/apt/sources.list.d/nginx.list > /dev/null
 
#---Set up repository pinning to prefer our packages over distribution-provided ones:
sudo echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
  |  sudo tee /etc/apt/preferences.d/99nginx

#---
echo "-----------------------------------------------------"
echo "> > > > > Install NGINX (nginx repository) =====>>>>> update:"
sudo apt update

#---To install -y nginx, run the following commands:
echo "-----------------------------------------------------"
echo "> > > > > Install NGINX (nginx repository) =====>>>>> Install NGINX LAST MAIN VERSION:"
sudo apt install -y nginx
echo "-----------------------------------------------------"
echo "> > > > > Install NGINX (nginx repository) =====>>>>> Configure"

#---create directory
sudo mkdir -p /etc/nginx/{sites-available,sites-enabled}

#---Edit => /etc/nginx/nginx.conf
#---Paste => include /etc/nginx/sites-enabled/*;
sudo sed -i '/include \/etc\/nginx\/conf\.d\/\*\.conf;/a \    include /etc/nginx/sites-enabled/*;' /etc/nginx/nginx.conf
#FIND_LINE='    include /etc/nginx/sites-enabled/*;'
#ADD_LINE='    include /etc/nginx/sites-enabled/*;'
#AFTER_LINE='include /etc/nginx/conf.d/*.conf;'
#FILE='/etc/nginx/nginx.conf'
#if grep -Fxq "$ADD_LINE" "$FILE"; then
#    echo "Настройка уже применена!"
#    else
#    sudo sed -i "/$AFTER_LINE/a $ADD_LINE" "$FILE"
#    echo "Настройка '$ADD_LINE' добавлена."
#fi



#---info about server
#sudo sed -i  '/<h1>Welcome to nginx!</h1>//<h1>Welcome to nginx! </h1>/s  /usr/share/nginx/html/index.html
sudo tee /usr/share/nginx/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head>
<title>$(hostname) nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx! $(hostname)</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
EOF

#---Start NGINX
sudo systemctl start nginx

#---
echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
echo "> > > > > Install NGINX (nginx repository) =====>>>>> Installed version:"
sudo nginx -v
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   NGINX    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ SUCCESSFUL ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
sleep 1.1  # Wait