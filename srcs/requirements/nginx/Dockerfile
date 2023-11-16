FROM    alpine:3.17

# install nginx, openssl
RUN	apk update && apk upgrade 
RUN     apk add --no-cache nginx openssl

# get ssl key
# https://www.openssl.org/docs/man1.1.1/man1/req.html
RUN     mkdir /etc/nginx/ssl
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/yoonsele.pem \
        -keyout /etc/nginx/ssl/yoonsele.key \
        -subj "/C=KO/ST=Seoul/L=Seoul/O=42 School/OU=yoonsele/CN=yoonsele/"

# nginx config
RUN     mkdir -p /run/nginx
COPY    conf/nginx.conf /etc/nginx/http.d/default.conf

# expose 443 port
EXPOSE 443

# entrypoint
ENTRYPOINT ["nginx", "-g", "daemon off;"]
