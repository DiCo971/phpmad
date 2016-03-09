#!/bin/bash

source mysql_password.sh

#Installation Apache

apt-get install -y apache2



#Installation Mysql

export DEBIAN_FRONTEND="noninteractive"

debconf-set-selections <<< "mysql-server mysql-server/root_password password glenn"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password glenn"

apt-get install -y mysql-server



#Installation Phpmyadmin

debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"

debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"

debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password maggie"

debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password glenn"

debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password maggie"

apt-get install -y phpmyadmin
