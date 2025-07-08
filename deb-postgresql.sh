#!/bin/bash
# wget https://k-sergey-v.github.io/Scrypt/deb-postgresql.sh
# Install lastet NGINX (nginx repository)
# version by 2025-05-12-0027
# Sergey Krichko
#===================================================================================
#---------------- Install POSTGRESQL (https://www.postgresql.org/) -----------------
#---Debian
if [ -z "$1" ]; then
    echo "Ошибка: не указана версия POSTGRESQL"
    exit 1
fi
psqlversion=$1
#read -p "Enter need POSTGRESQL version=" psqlversion

#---
echo "> > > > > > > > > > > > > > > > > > > > > > > > > > > > > >"
echo "===================================================================="
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> version=$psqlversion"

#---
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> update && upgrade:"
sudo apt update && upgrade

#---
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> add main repository POSTGRESQL"
#---Manual Repository Configuration
#---Import the repository key from https://www.postgresql.org/media/keys/ACCC4CF8.asc:
sudo apt install -y curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
 
#---Create /etc/apt/sources.list.d/pgdg.list. The distributions are called codename-pgdg. In the example, replace bookworm with the actual distribution you are using. File contents:
sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

#---
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> update"
sudo apt update

#---
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> Install"
sudo apt install -y postgresql-$psqlversion

#---
echo "--------------------------------------------------------------------"
echo "--------------------------------------------------------------------"
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> Installed version:"
sudo psql --version

echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ POSTGRESQL ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ SUCCESSFUL ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
echo "< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < "
sleep 1.1  # Waits