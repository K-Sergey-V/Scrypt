#!/bin/bash
#===================================================================================
#---------------- Install POSTGRESQL (https://www.postgresql.org/) -----------------
#---Debian
echo "===================================================================="
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> version"
read -p "Enter need POSTGRESQL version=" ps-version

echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> update && upgrade:"
sudo apt update && upgrade

echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> add repository"
#---Manual Repository Configuration
#---Import the repository key from https://www.postgresql.org/media/keys/ACCC4CF8.asc:
sudo apt install -y curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
 
#---Create /etc/apt/sources.list.d/pgdg.list. The distributions are called codename-pgdg. In the example, replace bookworm with the actual distribution you are using. File contents:
sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> update"
#---Finally, update the package lists, and start installing packages:
sudo apt update
echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> Install"
sudo apt install postgresql-$ps-version

echo "--------------------------------------------------------------------"
echo "> > > > > Install POSTGRESQL (https://www.postgresql.org/) =====>>>>> Installed version:"
sudo psql -v
echo "====================================================="
