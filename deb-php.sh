#!/bin/bash
# wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-php.sh
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

echo "\e[33m================================================================="
echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> version=$phpversion"
#read -p "Enter version=" phpversion
sleep 3  # Waits 5 seconds

echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> update && upgrade:"
sudo apt update && upgrade

echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> add repository"
sudo apt -y install lsb-release ca-certificates curl apt-transport-https
sudo curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb
sudo dpkg -i /tmp/debsuryorg-archive-keyring.deb
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> update"
sudo apt update

echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Install"
sudo apt install -y php$phpversion-cli php$phpversion-fpm php$phpversion-common
sudo apt install -y php$phpversion-pgsql php$phpversion-curl php$phpversion-xml \
 php$phpversion-dev php$phpversion-imap php$phpversion-redis php$phpversion-apcu php$phpversion-soap \
 php$phpversion-bcmath php$phpversion-bz2 php$phpversion-opcache  php$phpversion-imagick imagemagick \
 php$phpversion-fpm php$phpversion-gd php$phpversion-gmp php$phpversion-intl php$phpversion-mbstring \
 php$phpversion-xmlrpc php$phpversion-zip php$phpversion-memcache php$phpversion-memcached \
 memcached redis-server


echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m-----------------------------------------------------------------"
echo "\e[33m-----------------------------------------------------------------"
echo "\e[32m> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Installed version:"
sudo php -v
echo "\e[33m================================================================="
echo "\e[33m================================================================="
echo "\e[33m================================================================="
echo "\e[33m< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < \e[0m"
echo "\e[33m< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < \e[0m"
echo "\e[33m< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < \e[0m"