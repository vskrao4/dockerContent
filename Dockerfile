FROM ubuntu:18.04
MAINTAINER Kamesh
RUN apt update
RUN apt install -y apache2
VOLUME /var/www/dockerContent/log
WORKDIR /var/www/dockerContent
COPY ./* /var/www/dockerContent/
COPY ./dockerContent.httpd.conf /etc/apache2/sites-available/
COPY ./index.html /var/www/dockerContent
RUN a2dissite 000-default.conf
RUN a2ensite dockerContent.httpd.conf
EXPOSE 80
CMD ["apachectl" ,"-D",  "FOREGROUND"]
