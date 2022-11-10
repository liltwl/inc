FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php7.3-fpm php7.3-mysql
COPY /conf/wordpress /wordpress
COPY /conf/run.sh /
RUN chmod 777 /run.sh
ENTRYPOINT sh /run.sh