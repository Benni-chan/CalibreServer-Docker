FROM phusion/baseimage:0.9.18

MAINTAINER Benni-chan

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TERM xterm

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apt-get update

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
wget \
python \
xdg-utils \
ImageMagick && \
mkdir /opt/calibre

RUN mkdir /downloads
RUN mkdir /config

VOLUME ["/config", "/opt/calibre", "/downloads" ]

EXPOSE 8080


# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

#ADD crons.conf /home/crons.conf
