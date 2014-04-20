FROM ubuntu:latest
MAINTAINER tsing

RUN echo "deb http://ftp.sjtu.edu.cn/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update -yqV; apt-get upgrade -yqV
RUN apt-get install -y squid3 python

ADD squid.conf /etc/squid3/squid.conf
ADD url-rewriter.py /etc/squid3/url-rewriter.py
RUN chmod +x /etc/squid3/url-rewriter.py

ENTRYPOINT ["/usr/sbin/squid3", "-N"]

EXPOSE 8080
