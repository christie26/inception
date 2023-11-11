#!/bin/sh

cat  > /tmp/mariadb-user.sql << EOF
  USE mysql;
  FLUSH PRIVILEGES;

  DELETE FROM	mysql.user WHERE User='';
  DROP DATABASE test;
  DELETE FROM mysql.db WHERE Db='test';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

  ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';

  CREATE DATABASE $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
  CREATE USER '$WP_DB_USR'@'%' IDENTIFIED by '$WP_DB_PWD';
  GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USR'@'%';

  FLUSH PRIVILEGES;
EOF
/usr/bin/mysqld --user=mysql --bootstrap < /tmp/mariadb-user.sql
exec mysqld --user=mysql --console