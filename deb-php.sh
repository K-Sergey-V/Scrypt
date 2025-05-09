#!/bin/bash
#===================================================================
#---------------- Install NGINX (nginx repository) -----------------
#---Debian
echo "================================================================="
echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Enter version"
version

echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> update && upgrade:"
sudo apt update && upgrade

echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> add repository"
sudo apt -y install lsb-release ca-certificates curl apt-transport-https
sudo curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb
sudo dpkg -i /tmp/debsuryorg-archive-keyring.deb
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> update"
sudo apt update

echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Install"
sudo apt install -y php$version-cli php$version-fpm php$version-common php$version-pgsql \
php$version-dev php$version-imap php$version-redis php$version-apcu php$version-soap \
php$version-bcmath php$version-bz2 php$version-curl \
php$version-fpm php$version-gd php$version-gmp php$version-intl php$version-mbstring \
php$version-opcache  php$version-imagick imagemagick php$version-xml \
php$version-xmlrpc php$version-zip php$version-memcache php$version-memcached \
memcached redis-server


echo "-----------------------------------------------------------------"
echo "> > > > > Install PHP (https://packages.sury.org/php/) =====>>>>> Installed version:"
sudo php -v
echo "================================================================="
