FROM  docker.io/library/centos:7
RUN  yum install httpd -y
COPY  index.html /var/www/html/
ENTRYPOINT  ["/usr/sbin/httpd" ,"-D" ,"FOREGROUND"]
EXPOSE  80
