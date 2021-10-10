FROM alpine:latest

RUN apk --update --no-cache add ca-certificates nginx
RUN apk add php7 php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-phar php7-fileinfo php7-mbstring php7-tokenizer
RUN apk add unzip zip
RUN wget https://github.com/beldah/Pterodactyl-nginx/archive/refs/heads/main.zip
RUN unzip main.zip
RUN sudo chmod -R 777 Pterodactyl-nginx-main/*
RUN cp -r Pterodactyl-nginx-main/* /home/container/
RUN rm -r Pterodactyl-nginx-main

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]