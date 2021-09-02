# how to build?
# docker login
## .....input your docker id and password
#docker build . -t prasathmani/tinyfilemanager:v2.4.3
#docker push prasathmani/tinyfilemanager:v2.4.3

# how to use?
# docker run -d -v /absolute/path:/var/www/html/data -p 80:80 --restart=always --name tinyfilemanager prasathmani/tinyfilemanager:v2.4.3

FROM php:7.4-cli-alpine

# if run in China
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add \
    libzip-dev \
    oniguruma-dev

RUN docker-php-ext-install \
    zip \
    mbstring \
    iconv \
    fileinfo

WORKDIR /var/www/html

COPY tinyfilemanager.php index.php
COPY config-docker-sample.php config.php

CMD ["sh", "-c", "php -S 0.0.0.0:80"]