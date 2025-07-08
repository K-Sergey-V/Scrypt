#!/bin/bash
# wget https://k-sergey-v.github.io/Scrypt/deb-php.sh
# Install lastet NGINX (nginx repository)
# version by 2025-05-12-0027
# Sergey Krichko
#===============================================================================
#---------------- Install PHP (https://packages.sury.org/php/) -----------------
#---Debian
if [ -z "$1" ]; then
    echo "Ошибка: не указана версия PHP"
    exit 1
fi
phpversion=$1
#read -p "Enter version=" phpversion

#---
echo "================================================================="
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> version=$phpversion"
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> update && upgrade:"
sudo apt update && upgrade

#---
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> add repository"
sudo apt -y install lsb-release ca-certificates curl apt-transport-https
sudo curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb
sudo dpkg -i /tmp/debsuryorg-archive-keyring.deb
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

#---
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> update"
sudo apt update

#---
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Install"
sudo apt install -y php$phpversion-cli php$phpversion-fpm php$phpversion-common
sudo apt install -y php$phpversion-pgsql php$phpversion-curl php$phpversion-xml \
 php$phpversion-dev php$phpversion-imap php$phpversion-redis php$phpversion-apcu php$phpversion-soap \
 php$phpversion-bcmath php$phpversion-bz2 php$phpversion-opcache  php$phpversion-imagick imagemagick \
 php$phpversion-fpm php$phpversion-gd php$phpversion-gmp php$phpversion-intl php$phpversion-mbstring \
 php$phpversion-xmlrpc php$phpversion-zip php$phpversion-memcache php$phpversion-memcached \
 memcached redis-server


#---
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Installed version:"
sudo php -v
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    PHP     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ SUCCESSFUL ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "

sleep 1.1  # Waits