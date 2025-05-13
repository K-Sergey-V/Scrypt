#!/bin/bash
# wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-postgresql.sh
# Install lastet NGINX (nginx repository)
# version by 2025-05-12-0027
# Sergey Krichko
#===================================================================================
#---------------- Install POSTGRESQL (https://www.postgresql.org/) -----------------
#---Debian
echo "\e[32m> > > > > > > > > > > > > > > > > > > > > > > > > > > > > >"
echo "\e[32m===================================================================="
echo "\e[32m--------------------------------------------------------------------"
echo "\e[32m> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> version"
read -p "Enter need POSTGRESQL version=" psqlversion

echo "\e[32m--------------------------------------------------------------------"
echo "\e[32m> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> update && upgrade:"
sudo apt update && upgrade

echo "\e[32m--------------------------------------------------------------------"
echo "\e[32m> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> add main repository POSTGRESQL"
#---Manual Repository Configuration
#---Import the repository key from https://www.postgresql.org/media/keys/ACCC4CF8.asc:
sudo apt install -y curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
 
#---Create /etc/apt/sources.list.d/pgdg.list. The distributions are called codename-pgdg. In the example, replace bookworm with the actual distribution you are using. File contents:
sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

echo "\e[32m--------------------------------------------------------------------"
echo "\e[32m> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> update"
#---Finally, update the package lists, and start installing packages:
sudo apt update
echo "\e[32m--------------------------------------------------------------------"
echo "\e[32m> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> Install"
sudo apt install -y postgresql-$psqlversion

echo "\e[32m--------------------------------------------------------------------"
echo "\e[32m> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> Installed version:"
sudo psql --version
echo "\e[32m====================================================="
echo "\e[32m< < < < < < < < < < < < < < < < < < < < < < < < < < < < < < \e[0m"