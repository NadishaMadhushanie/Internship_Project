From ubuntu:18.04

RUN apt-get update
RUN apt-get install -y mysql-server

COPY database/apim.sql /
COPY database/shared.sql /

ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]

