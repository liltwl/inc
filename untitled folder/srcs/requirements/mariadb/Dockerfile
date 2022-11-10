FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y  mariadb-server mariadb-client
#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/setup.sh /
#COPY ./conf/databaseclone.sql /
RUN chmod 777 setup.sh
RUN  chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN  chmod 644 /etc/mysql/my.cnf
ENTRYPOINT sh /setup.sh
