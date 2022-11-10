#!/bin/bash

if [ "$(ls -A /var/lib/mysql/${DB_NAME})" ]; then
    echo "Database ready !!!;)"
else    
    #mkdir /var/run/mysqld 
    #touch /var/run/mysqld/mysqld.sock
    #chown -R mysql /var/run/mysqld
    service mysql start
    mysql -u root -e  "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; flush privileges;"
    mysql -u root -e "grant all privileges on *.* to '${USER}'@'%' IDENTIFIED BY '${PASS}'; flush privileges;"
    mysql -u root -e "USE mysql; UPDATE user SET plugin='mysql_native_password' WHERE User='root';FLUSH PRIVILEGES;"
    muysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO `root`@`localhost` IDENTIFIED BY '${DBROOT}';
FLUSH PRIVILEGES;"
    mysql < /wp_databases.sql -u ${USER} -p${PASS} ${DB_NAME}
    mysqladmin -u root -pPASSWORD shutdown
fi
mysqld_safe
