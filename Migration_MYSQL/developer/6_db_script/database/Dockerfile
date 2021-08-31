From ubuntu:18.04

RUN apt-get update
RUN apt-get install -y mysql-server

COPY database/am.sql /
COPY database/reg-index.sql /
ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]

