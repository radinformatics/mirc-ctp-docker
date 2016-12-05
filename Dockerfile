FROM ubuntu:latest
MAINTAINER "vsochat@stanford.edu"

RUN apt-get update &&
    apt-get -y install git \
           build-essential \
           libtool \ 
           autotools-dev \ 
           automake \ 
           autoconf \ 
           wget \
           default-jre \
           openjdk-7-jre \ 
           unzip
 
RUN mkdir /JavaPrograms
ADD CTP/ /JavaPrograms/
RUN wget http://mirc.rsna.org/ImageIO/linux-x86_64.zip
RUN unzip linux-x86_64.zip
RUN mv linux-x86_64/* /JavaPrograms

CMD ['/bin/bash']
