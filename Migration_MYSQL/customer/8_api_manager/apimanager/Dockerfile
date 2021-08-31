FROM ubuntu:18.04

MAINTAINER kevin tang, www.tanghuosong.com

WORKDIR ./usr/local

RUN mkdir jdk

RUN chmod 777 /usr/local/jdk

ADD server-jre-8u281-linux-x64.tar.gz /usr/local/jdk

ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_281
 
ENV CLASSPATH=$JAVA_HOME/bin:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
 
ENV PATH=.:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
 
EXPOSE 3306
 
CMD ["java","-version"]

COPY apimanager/wso2am-4.0.0 /usr/local
COPY apimanager/validationData.txt /usr/local/test/
ADD init.sh /
RUN ["chmod", "+x", "/init.sh"]

CMD  ["/init.sh"]
