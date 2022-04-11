FROM ubuntu:20.04

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:ondrej/php -y \
    && apt-get update \ 
    && apt-get clean

RUN apt-get install php5.6 \
    php5.6-mysql php5.6-gd \
    php5.6-mcrypt php5.6-mbstring \
    php5.6-sqlite3 apache2 libapache2-mod-php5.6 -y

COPY apache-conf /etc/apache2/apache2.conf
COPY php /var/www/html/info.php

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
