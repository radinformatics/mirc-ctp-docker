FROM ubuntu:14.04
MAINTAINER "vsochat@stanford.edu"

RUN apt-get update && apt-get -y install git \
           build-essential \
           libtool \ 
           autotools-dev \ 
           automake \ 
           autoconf \ 
           wget \
           openjdk-7-jdk \
           default-jre \
           unzip

RUN mkdir /JavaPrograms
RUN mkdir /code
WORKDIR /code
ADD . /code
RUN tar -xzvf CTP.tar.gz
RUN mv CTP /JavaPrograms
RUN chmod 777 -R /JavaPrograms
#RUN wget http://mirc.rsna.org/ImageIO/linux-x86_64.zip
#RUN unzip linux-x86_64.zip
#RUN mv linux-x86_64/* /JavaPrograms
CMD ['/bin/bash']
