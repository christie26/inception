# nginx dockerfile #
# 1. get alpine image
FROM    alpine:3.14

# 2. install nginx
RUN     apk update && apk upgrade
RUN     apk add --no-cache nginx openssl

# 3. nginx SSL setting
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/inception.cert \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=KR/ST=Seoul/L=seoul/O=42 School/CN=yoonsele.42.fr"

# 4. create /run/nginx
RUN mkdir -p /run/nginx
# RUN mkdir -p /var/log/nginx

# 5. copy conf file
COPY tools/nginx.conf /etc/nginx/http.d/default.conf
# COPY nginx.conf /etc/nginx/nginx.conf

# 6. expose the Nginx port
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]