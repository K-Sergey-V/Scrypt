#!/bin/bash
# wget https://k-sergey-v.github.io/Scrypt/deb-zabbix.sh & deb-zabbix.sh
# Install ZABBIX
# version by 2025-08-31
# Sergey Krichko
#===================================================================================
#---------------- Install ZABBIX https://www.zabbix.com/) -----------------
#---Debian

# a. Установите репозиторий Zabbix
sudo wget https://repo.zabbix.com/zabbix/7.4/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.4+debian13_all.deb
sudo dpkg -i zabbix-release_latest_7.4+debian13_all.deb
sudo apt update

# b. Install Zabbix server, frontend, agent2
sudo apt install zabbix-server-pgsql zabbix-frontend-php php8.4-pgsql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent2
# c. Install Zabbix agent 2 plugins
# You may want to install Zabbix agent 2 plugins.
sudo apt install zabbix-agent2-plugin-mongodb zabbix-agent2-plugin-mssql zabbix-agent2-plugin-postgresql

# d. Создайте базу данных
# Установите и запустите сервер базы данных.
# Выполните следующие комманды на хосте, где будет распологаться база данных.
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix

# На хосте Zabbix сервера импортируйте начальную схему и данные. Вам будет предложено ввести недавно созданный пароль.
sudo zcat /usr/share/zabbix/sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

# e. Настройте базу данных для Zabbix сервера
# Отредактируйте файл
sudo nano /etc/zabbix/zabbix_server.conf

DBPassword=password

# f. Запустите процессы Zabbix сервера и агента
# Запустите процессы Zabbix сервера и агента и настройте их запуск при загрузке ОС.
sudo systemctl restart zabbix-server zabbix-agent2 nginx php8.4-fpm
sudo systemctl enable zabbix-server zabbix-agent2 nginx php8.4-fpm