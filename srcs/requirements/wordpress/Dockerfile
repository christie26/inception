
FROM	alpine:3.18

# install mariadb
RUN		apk update && apk upgrade
RUN		apk add --no-cache mariadb-client

# install php (by default php8.1)
RUN 	apk add --no-cache	\
    	php				
# 		php7-fpm php7-bcmath php7-bz2 php7-calendar php7-ctype \
#		php7-curl php7-dom php7-exif php7-fileinfo php7-gd \
# 		php7-gmagick php7-gmp php7-iconv php7-imap php7-intl \
# 		php7-json php7-mbstring php7-mcrypt	 php7-memcache php7-mysqli\
#	 	php7-mysqlnd php7-openssl 
#       php7-pcntl php7-pdo	php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite 	\
# 		php7-pgsql php7-phar	 php7-posix	 php7-session php7-shmop	
#		php7-simplexml php7-soap php7-sockets php7-sodium	 php7-sqlite3 
#		php7-sysvsem php7-sysvshm php7-tokenizer php7-xml	 
#		php7-xmlreader php7-xmlwriter php7-xsl	 php7-zip	 php7-zlib

# 3. install wp-cli
RUN apk add --no-cache wget
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN sudo mv wp-cli.phar /usr/bin/wp

# #PHP-FPM
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php81/php-fpm.conf
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/html/wordpress

COPY tools/entrypoint.sh /tmp/entrypoint.sh
# ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
ENTRYPOINT [ "sleep", "50000" ]
