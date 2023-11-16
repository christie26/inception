FROM    alpine:3.17

# install mariadb
RUN	apk update && apk upgrade
RUN     apk add --no-cache mariadb mariadb-client

# create run time directory & set the ownership
# https://wiki.alpinelinux.org/wiki/MariaDB - datadir
RUN     mkdir -p /run/mysqld
RUN     mkdir -p /var/lib/mysql
RUN     chown -R mysql:mysql /run/mysqld
RUN     chown -R mysql:mysql /var/lib/mysql

# initialize MySQL Data Directory
# https://dev.mysql.com/doc/refman/5.7/en/mysql-install-db.html
RUN     mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# allow remote connections
# https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/
RUN     sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf \
        && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# entrypoint
RUN     cp -r /var/lib/mysql /var/lib/mysql1
COPY    tools/entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
