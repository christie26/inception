#!/bin/sh

echo "copy from /va/lib/mysql"
if [ -z "$(ls -A /var/lib/mysql)" ]; then
	cp -r /var/lib/mysql1/* /var/lib/mysql
fi

echo "create tem file"
tfile=$(mktemp)
if [ ! -f "$tfile" ]; then
	return 1
fi

echo "write tem file"
cat << EOF > "$tfile"
	USE mysql;
	FLUSH PRIVILEGES;

	DELETE FROM	mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

	CREATE DATABASE $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
	CREATE USER '$WP_DB_USR'@'%' IDENTIFIED by '$WP_DB_PWD';
	GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USR'@'%';

	FLUSH PRIVILEGES;
EOF

chown -R mysql:mysql /var/lib/mysql

echo "run init.sql"
# run init.sql
/usr/bin/mysqld --user=mysql --bootstrap < "$tfile"
rm -f "$tfile"

echo "run mysqld"
exec /usr/bin/mysqld --user=mysql --console
