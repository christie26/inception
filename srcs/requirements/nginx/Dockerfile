
FROM    alpine:3.18

# install nginx
RUN     apk update && apk upgrade
RUN     apk add nginx openssl

# FROM    alpine:3.15

# RUN	apk update && apk upgrade && apk add --no-cache \
#         nginx \
#         openssl

# # nginx SSL
# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#         -out /etc/nginx/ssl/inception.cert \
#         -keyout /etc/nginx/ssl/inception.key \
#         -subj "/C=FR/ST=Ile-de-France/L=Paris/O=42 School/CN=yoonsele.42.fr"

# # nginx config
# RUN mkdir -p /run/nginx
# COPY tools/nginx.conf /etc/nginx/http.d/default.conf

# ENTRYPOINT ["nginx", "-g", "daemon off;"]