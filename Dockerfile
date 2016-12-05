FROM jobalk/php5
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
RUN a2dismod php5.6 ; a2enmod php7.0
RUN service apache2 restart

CMD ["/sbin/my_init"]
