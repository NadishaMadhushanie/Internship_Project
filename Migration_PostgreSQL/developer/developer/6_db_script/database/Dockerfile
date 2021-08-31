From ubuntu:18.04

RUN apt-get -y update && apt-get install -y postgresql

COPY database/am.sql /
COPY database/reg-index.sql /
ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]

