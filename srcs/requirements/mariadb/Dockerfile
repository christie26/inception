
FROM	alpine:3.18

# install mariadb
RUN		apk update && apk upgrade
RUN		apk add mariadb mariadb-client

# LABEL version="1.0"
# LABEL description="MariaDB Server"

# RUN mkdir -p /run/mysqld \
# 	  && chown -R mysql:mysql /run/mysqld
  
# RUN chown -R mysql:mysql /var/lib/mysql && \
#      mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# RUN sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf\
#  && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

# CMD ["sh", "/tmp/entrypoint.sh"]