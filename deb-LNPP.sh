#!/bin/bash
# wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-LNPP.sh && sudo bash deb-LNPP.sh
# Install lastet NGINX (nginx repository)
# version by 2025-05-13-1558
# Sergey Krichko

wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-nginx.sh
bash deb-nginx.sh


wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-php.sh
bash deb-php.sh 8.3


wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-postgresql.sh
bash deb-postgresql.sh 17