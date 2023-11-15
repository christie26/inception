FROM    alpine:3.17

# install nginx, openssl
RUN	apk update && apk upgrade 
RUN     apk add --no-cache nginx openssl

# get ssl key
RUN     mkdir /etc/nginx/ssl
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/yoonsele.pem \
        -keyout /etc/nginx/ssl/yoonsele.key \
        -subj "/C=KO/ST=Seoul/L=Seoul/O=42 School/OU=yoonsele/CN=yoonsele/"

# nginx config
RUN     mkdir -p /run/nginx
COPY    conf/nginx.conf /etc/nginx/http.d/default.conf

RUN 	chmod 755 /var/www*
# expose 443 port
EXPOSE 443

# entrypoint
ENTRYPOINT ["nginx", "-g", "daemon off;"]
