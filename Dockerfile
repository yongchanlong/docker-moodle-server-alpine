FROM alpine:edge

LABEL maintainer="AndrewAI <yongchanlong@gmail.com>"

EXPOSE 80

RUN apk update \
 && apk add --no-cache \
                       git \
                       apache2 \
                       php7 \
                       php7-apache2 \
                       php7-iconv \
                       php7-mysqli \
                       php7-session \
                       php7-json \
                       php7-xml \
                       php7-curl \
                       php7-zip \
                       php7-zlib \
                       php7-gd \
                       php7-dom \
                       php7-xmlreader \
                       php7-mbstring \
                       php7-openssl \
                       php7-xmlrpc \
                       php7-soap \
                       php7-intl \
                       php7-opcache \
                       php7-tokenizer \
                       php7-simplexml \
                       php7-ctype \
                       openrc \
 # can't get ttys unless you run the container in privileged mode
 && sed -i '/tty/d' /etc/inittab \
 # can't mount tmpfs since not privileged
 && sed -i 's/mount -t tmpfs/# mount -t tmpfs/g' /lib/rc/sh/init.sh

RUN cd /tmp \
 && git clone -b MOODLE_34_STABLE git://git.moodle.org/moodle.git --depth=1 \
 && rm -rf /var/www/localhost/htdocs \
 && mv /tmp/moodle /var/www/localhost/htdocs \
 && chown apache:apache -R /var/www/localhost/htdocs \
 && mkdir /run/apache2

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log \
 && ln -sf /proc/self/fd/1 /var/log/apache2/error.log

COPY config-dist.php /var/www/localhost/htdocs/config.php
COPY run.sh /opt/apache2/run.sh
RUN chmod +x /opt/apache2/run.sh
CMD ["/opt/apache2/run.sh"]
