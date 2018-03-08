FROM php:7.1-fpm

RUN docker-php-ext-install pdo_mysql mbstring mysqli pdo

RUN pecl install xdebug && docker-php-ext-enable xdebug

#install Imagemagick & PHP Imagick ext
RUN apt-get update && apt-get install -y \
        libmagickwand-dev --no-install-recommends

RUN pecl install imagick && docker-php-ext-enable imagick

#COPY conf/php.ini /etc/php/7.1/fpm/conf.d/40-custom.ini

COPY conf/php.ini /usr/local/etc/php/conf.d/40-custom.ini
COPY conf/composer.phar /usr/local/bin/composer
COPY conf/my.cnf /etc/mysql/my.cnf