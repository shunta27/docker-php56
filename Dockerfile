FROM php:5.6-apache
MAINTAINER shunta ichikawa <shunta27ichikawa@gmail.com>

RUN apt-get update \
    && apt-get install -y vim

# Copy modules
RUN mkdir /etc/apache2/modules
RUN cp /usr/lib/apache2/modules/mod_include.so /etc/apache2/modules/mod_include.so
RUN sed -i '$a LoadModule include_module modules/mod_include.so' /etc/apache2/apache2.conf

# Copy config file
COPY conf/docker-php.conf /etc/apache2/conf-enabled/docker-php.conf

EXPOSE 80
