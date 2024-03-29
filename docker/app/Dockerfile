FROM ubuntu:18.04

LABEL maintainer="Ollie Lowson"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y gnupg tzdata \
    && echo "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
    && apt-get install -y curl zip unzip git supervisor sqlite3 \
       nginx php7.2-fpm php7.2-cli \
       php7.2-pgsql php7.2-sqlite3 php7.2-gd \
       php7.2-curl php7.2-memcached \
       php7.2-imap php7.2-mysql php7.2-mbstring \
       php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
       php7.2-intl php7.2-readline php7.2-xdebug \
       php7.2-mongodb php7.2-http \
       php-msgpack php-igbinary \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

RUN composer global require laravel/installer \
    && composer global require laravel/lumen-installer \
    && echo "export PATH=\$PATH:\$HOME/.composer/vendor/bin" >> /root/.bashrc

ADD default /etc/nginx/sites-available/default
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD start-container.sh /usr/bin/start-container
ADD bash_aliases.sh /root/.bash_aliases
RUN chmod +x /usr/bin/start-container
ADD xdebug.ini /etc/php/7.2/mods-available/xdebug.ini

ADD access-key /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/id_rsa

ENTRYPOINT ["start-container"]
