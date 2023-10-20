# Mariadb dockerfile
FROM	alpine:3.18

# install mariadb
RUN		apk update && apk upgrade
RUN		apk add mariadb mariadb-client
RUN 	apk add mysql mysql-client
# RUN 	apk add openrc --no-cache -> need to run in background 

# LABEL doesn't affect image's function
LABEL 	version="1.0"
LABEL 	description="MariaDB Server"

# create run time directory & set the ownership 
RUN 	mkdir -p /run/mysqld
RUN 	chown -R mysql:mysql /run/mysqld
RUN 	chown -R mysql:mysql /var/lib/mysql

# install mysql
RUN		mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm 

# config MariaDB for remote client access
RUN 	cp /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old.cnf
RUN 	sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
RUN		sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
RUN 	cp /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old2.cnf

COPY 	./tools/entrypoint.sh /tmp/entrypoint.sh
CMD 	["sh", "/tmp/entrypoint.sh"]
# ENTRYPOINT [ "sleep", "100000" ]