#!/bin/bash
# wget https://raw.githubusercontent.com/K-Sergey-V/Scrypt/refs/heads/main/deb-nextcloud.sh
# Install lastet NGINX (nginx repository)
# version by 2025-05-13-1558
# Sergey Krichko

===================================================================
------------------------- install NEXTCLOUD -----------------------
if [ -z "$1" ]; then
    echo "Ошибка: не указана доменное имя облака"
    exit 1
fi
if [ -z "$2" ]; then
    echo "Ошибка: не указана доменная зона облака"
    exit 2
fi
nextclouddomainname=$1
nextclouddomainzone=$2

#---#---Подготовка сервера для установки NextCloud:
#---#---дополнительный диск
sudo mkfs.ext4 /dev/sdb
sudo mkdir -p /extdata

#---Просмотреть метку диска
echo "\e[35m-----------------------------------------------------"
sudo blkid
Wait 3
#---Добавить диск в загрузку
#sudo nano /etc/fstab
#UUID=e52f5d60-dcdd-4cc1-b65c-06526cc5e1ba /extdata  ext4  defaults  0 1

#---Проверить монтирование раздела
sudo mount -a
df -h

#---#---Сначала загрузим установщик сервера для коммунити редакции. Перейдите на сервер NextCloud и выполните загрузку дистрибутива:
sudo wget -P /extdata/ https://download.nextcloud.com/server/releases/latest.tar.bz2

#---Распакуйте архив:
sudo tar -xjvf /extdata/latest.tar.bz2 -C /extdata/
ls -la /extdata

#---Создадим директорию для данных NextCloud сервера и скопирует туда все файлы дистрибутива:
sudo mkdir -p /extdata/$nextclouddomainzone.$nextclouddomainname
sudo cp -r /extdata/nextcloud/* /extdata/$nextclouddomainzone.$nextclouddomainname/

#---Теперь необходимо изменить владельца для всего каталога /extdata/nextcloud:
sudo chown -R nginx:nginx /extdata/$nextclouddomainzone.$nextclouddomainname
sudo ls -la /extdata/
#---#---Настройка NGINX
#sudo nano /etc/nginx/sites-available/$nextclouddomainzone.$nextclouddomainname.conf
#---#--- insert Server PARAM 



