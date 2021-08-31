From ubuntu:18.04

RUN apt-get -y update && apt-get install -y postgresql


COPY database/update.sql /
ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]

