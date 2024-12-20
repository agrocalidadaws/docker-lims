FROM php:8.1.10-fpm-alpine

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN set -ex && apk --no-cache add postgresql-dev
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pgsql

RUN apk add --no-cache zip libzip-dev
RUN apk add --no-cache tzdata
RUN docker-php-ext-install zip
RUN docker-php-ext-install bcmath

RUN apk add --no-cache libjpeg-turbo-dev libpng-dev freetype-dev && \
docker-php-ext-configure gd --with-jpeg --with-freetype && \
docker-php-ext-install gd && \
apk del libjpeg-turbo-dev libpng-dev freetype-dev

#RUN apk add --no-cache libpng libpng-dev && docker-php-ext-install gd && apk del libpng-dev

#Install libs
RUN apk add --no-cache \
    imagemagick \
    imagemagick-dev \
    ghostscript \
    && apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install exif \
    && docker-php-ext-enable gd \
    && apk del .build-deps \
    && rm -rf /tmp/*

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS}
RUN pecl install redis-5.3.7
RUN printf '[PHP]\ndate.timezone = "America/Guayaquil"\n' > /usr/local/etc/php/conf.d/tzone.ini
RUN apk add --no-cache postgresql-client
RUN docker-php-ext-enable redis
RUN echo "upload_max_filesize = 6M" >> /usr/local/etc/php/php.ini