#!/bin/bash

if [ ! -d /var/lib/mysql/$MYSQL_DB ]; then

service mysql start

echo "ALTER USER \`root\`@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
GRANT ALL PRIVILEGES ON *.* TO \`root\`@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;" | mysql

echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;" | mysql -u root -p$MYSQL_ROOT_PASSWORD


echo "mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown"

fi

exec "$@"
