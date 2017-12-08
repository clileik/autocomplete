FROM tutum/lamp:latest

RUN rm -fr /app && git clone https://github.com/clileik/autocomplete.git /app

ADD products.sql /tmp/products.sql

RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &" && \
  sleep 5 && \
  mysql -u uadmin -e "CREATE DATABASE products" && \
  mysql -u uadmin products < /tmp/products.sql

EXPOSE 80 3306
