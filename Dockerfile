FROM php:7.4-apache

RUN \
    apt-get update \
    && mkdir -p /usr/src/php/ext/apcu \
    && curl -fsSL https://pecl.php.net/get/apcu | tar xvz -C "/usr/src/php/ext/apcu" --strip 1 \
    && docker-php-ext-install apcu \
    && docker-php-ext-enable opcache \
    && apt-get autoremove -y

ENV APP_ENV=prod

COPY ./docker/php.ini $PHP_INI_DIR
COPY ./docker/apache.conf /etc/apache2/sites-available/000-default.conf
COPY . /var/www/
WORKDIR /var/www
RUN bin/console cache:warmup
RUN chown -R www-data:www-data /var/www/
EXPOSE 80
