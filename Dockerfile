FROM ubuntu
MAINTAINER tsing <tsing@jianqing.org>
RUN apt-get update -yqV
RUN apt-get upgrade -yqV

RUN apt-get install -y unbound

RUN echo "port: 53" >> /etc/unbound/unbound.conf
RUN echo "interface: 0.0.0.0" >> /etc/unbound/unbound.conf
RUN echo "interface: ::0" >> /etc/unbound/unbound.conf
RUN echo "access-control: 0.0.0.0/0 allow" >> /etc/unbound/unbound.conf
RUN echo "use-syslog: no" >> /etc/unbound/unbound.conf
RUN echo "logfile: /dev/stdout" >> /etc/unbound/unbound.conf
RUN echo "log-queries: yes" >> /etc/unbound/unbound.conf

RUN touch /var/run/unbound.pid
RUN chown unbound:unbound /var/run/unbound.pid

USER unbound
ENTRYPOINT ["/usr/sbin/unbound"]

CMD ["-h"]

EXPOSE 53/udp
EXPOSE 53
