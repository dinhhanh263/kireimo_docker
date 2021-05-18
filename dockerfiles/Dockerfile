FROM php:5.4.45-apache
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install mbstring

# デバッグを有効にする(PHPのバージョンが古いためxdebugのバージョンを指定しています)
RUN pecl install xdebug-2.4.1 \
  && docker-php-ext-enable xdebug

RUN a2enmod headers
RUN a2enmod expires

RUN apt-get update
RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt

RUN mkdir /var/www/mypage_log
RUN chmod 777 /var/www/mypage_log

COPY php.ini /usr/local/etc/php/php.ini


