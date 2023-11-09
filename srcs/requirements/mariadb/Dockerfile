
# 1. get alpine image
FROM	alpine:3.18

LABEL 	version="1.0"
LABEL 	description="MariaDB Server"

# 2. install mariadb
RUN		apk update && apk upgrade
RUN		apk add --no-cache mariadb mariadb-client 
RUN 	apk add --no-cache mysql mysql-client
# RUN 	apk add openrc --no-cache -> to run in background (서브젝트와 충동)

# 3. create run time directory & set the ownership 
RUN 	mkdir -p /run/mysqld
RUN 	chown -R mysql:mysql /run/mysqld
RUN 	chown -R mysql:mysql /var/lib/mysql

# 4. install mysql
RUN		mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm 

# 5. config MariaDB for remote client access
RUN 	cp /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old.cnf
RUN 	sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
RUN		sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
RUN 	cp /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old2.cnf

# 6. copy entrypoint file 
COPY 	./tools/entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/tmp/entrypoint.sh" ]