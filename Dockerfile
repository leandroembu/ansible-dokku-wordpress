FROM wordpress:php8.1-apache

COPY ./scripts/entrypoint.sh /usr/local/bin/
COPY Procfile /var/www/html/
RUN mkdir /app
COPY ./wordpress /app

ENTRYPOINT ["entrypoint.sh"]
