FROM tutum/lamp:latest

RUN rm -fr /app && git clone https://github.com/clileik/autocomplete.git /app

ADD products.sql /tmp/products.sql

COPY *.sql /docker-entrypoint-initdb.d/

EXPOSE 80 3306
