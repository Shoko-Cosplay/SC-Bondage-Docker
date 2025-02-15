FROM php:8.3-fpm

RUN apt update
RUN apt install git wget curl bash dpkg -y
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions &&  install-php-extensions iconv zip intl opcache zip soap gd imagick apcu redis pdo pdo_pgsql xdebug excimer

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Symfony tool
RUN  curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash && apt install -y symfony-cli

# Security checker tool
ENV PHP_SECURITY_CHECHER_VERSION=2.0.6
RUN curl -L https://github.com/fabpot/local-php-security-checker/releases/download/v${PHP_SECURITY_CHECHER_VERSION}/local-php-security-checker_${PHP_SECURITY_CHECHER_VERSION}_linux_$(dpkg --print-architecture) --output /usr/local/bin/local-php-security-checker && \
  chmod +x /usr/local/bin/local-php-security-checker

# Pour la récupération des durées des vidéos
RUN apt install -y ffmpeg

# Xdebug (disabled by default, but installed if required)
ADD php.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www
