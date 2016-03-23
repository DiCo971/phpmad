#!/bin/bash

hostname=$(hostname)

if [ "$(curl -s http://127.0.0.1/ping_me)" = "michonne" ];
then
	http_state=OK;
else
	http_state=KO;
fi 

mysql_state=$(echo "show databases;" | mysql -u root --password=glenn)
if [ -z "$mysql_state" ]
then 
	mysql_state=KO;
else
	mysql_state=OK;
fi

http_user_conf=$(sed -n 's/export APACHE_RUN_USER=\(.*\)/\1/gp' /etc/apache2/envvars)

mysql_user_conf=$(sed -n 's/^user\t\t= \(.*\)/\1/gp' /etc/mysql/my.cnf)

echo 'hostname : '$hostname
echo 'http_state : '$http_state
echo 'mysql_state : '$mysql_state
echo 'phpmyadmin_state : '$phpmyadmin_state
echo 'http_user_conf : '$http_user_conf
echo 'mysql_user_conf : '$mysql_user_conf
echo 'http_user_pid : '$http_user_pid
echo 'mysql_user_pid : '$mysql_user_pid


