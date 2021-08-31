From ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y update && apt-get install -y wget curl sudo software-properties-common gnupg2
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"
RUN apt-get -y update
RUN apt-get install -y mssql-server
CMD /opt/mssql/bin/mssql-conf setup
RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/19.10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get -y update
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
CMD source ~/.bashrc
RUN apt-get install -y mssql-tools
RUN ln -s /opt/mssql-tools/bin/* /usr/local/bin/


COPY database/wso2am-3.2.0/dbscripts/mssql.sql /mssql1.sql
COPY database/wso2am-3.2.0/dbscripts/apimgt/mssql.sql /mssql2.sql
ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]

