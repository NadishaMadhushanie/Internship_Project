From ubuntu:18.04

RUN apt-get -y update
RUN apt-get install -y alien

COPY oracle-instantclient19.12-basic-19.12.0.0.0-1.x86_64.rpm /
COPY oracle-instantclient19.12-devel-19.12.0.0.0-1.x86_64.rpm /
COPY oracle-instantclient19.12-sqlplus-19.12.0.0.0-1.x86_64.rpm /

RUN cd /

RUN alien -i oracle-instantclient*-basic*.rpm
RUN alien -i oracle-instantclient*-sqlplus*.rpm
RUN alien -i oracle-instantclient*-devel*.rpm
RUN apt-get install libaio1
RUN export LD_LIBRARY_PATH="/usr/lib/oracle/19.12/client64/lib/"

COPY database/update.sql /
ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]

