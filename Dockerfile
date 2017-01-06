FROM centos:7
MAINTAINER Kyle Shenk <k.shenk@gmail.com>

## The basic stuff
RUN yum install -y epel-release && \
    yum install -y python2-pip && \
    pip install supervisor && \
    echo_supervisord_conf > /etc/supervisord.conf && \
    echo "[include]" >> /etc/supervisord.conf && \
    echo "files = /etc/supervisor.d/*.conf" >> /etc/supervisord.conf && \
    mkdir -p /etc/supervisor.d

## Our stuff...
RUN pip install supermgr --upgrade && \
    mkdir -p /var/log/jazz/workers

ADD ~/dev/state/supervisor.d/* /etc/supervisor.d/

