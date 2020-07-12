FROM debian:buster

RUN apt-get update && apt-get install -y wget

RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get -y install vim

##phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin
RUN ln -s /usr/share/phpMyAdmin /var/www/html/phpMyAdmin
COPY ./srcs/default.conf /etc/nginx/sites-available/default
COPY ./srcs/phpmyadmin.inc.php /var/www/html/phpMyAdmin/config.inc.php

##wordpress
COPY ./srcs/wordpress_set.sql /var/wordpress_set.sql
RUN service mysql start && mysql -u root mysql < /var/wordpress_set.sql
RUN mkdir -p /var/www/html/WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xf latest.tar.gz
RUN mv ./wordpress/* /var/www/html/WordPress
RUN chown -R www-data: /var/www/html/WordPress
COPY ./srcs/wp-config.php /var/www/html/WordPress

#openssl
RUN mkdir /etc/nginx/ssl
RUN apt-get -y install openssl
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Kim/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
RUN chmod 600 etc/nginx/ssl/localhost.crt etc/nginx/ssl/localhost.key

COPY ./srcs/init.sh ./

CMD bash init.sh
