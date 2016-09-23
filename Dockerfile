FROM jobalk/base
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
RUN apt-get install -y apache2 libapache2-mod-php apache2-utils mariadb-server php-mbstring php-xml php-curl php-mysql php-mcrypt php-intl php-gmp php-gd php-json php-imagick

COPY etc /etc
RUN chmod -R 755 /etc/service

RUN mkdir /run/mysqld && chmod -R 777 /run/mysqld
RUN a2enmod rewrite
RUN rm -f /var/www/html/index.html

EXPOSE 80
CMD ["/sbin/my_init"]
