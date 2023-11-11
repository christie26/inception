FROM    alpine:3.14

# install mariadb
RUN	apk update && apk upgrade
RUN     apk add --no-cache mariadb mariadb-client

# create run time directory & set the ownership
RUN     mkdir -p /run/mysqld
RUN     chown -R mysql:mysql /run/mysqld
RUN     chown -R mysql:mysql /var/lib/mysql

# init database
RUN     mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# allow remote connections
RUN     sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf \
        && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# entrypoint
RUN     cp -r /var/lib/mysql /var/lib/mysql1
COPY    tools/entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]