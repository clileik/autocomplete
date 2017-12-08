FROM tutum/lamp:latest

RUN rm -fr /app && git clone https://github.com/clileik/autocomplete.git /app

ADD products.sql /tmp/products.sql

COPY *.sql /docker-entrypoint-initdb.d/

RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &" && \
  sleep 5 && \
  mysql -uadmin -psuperman -e "CREATE DATABASE products" && \
  mysql -uadmin -psuperman products < /tmp/products.sql

EXPOSE 80 3306
