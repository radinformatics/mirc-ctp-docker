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
RUN tar -xzvf /code/CTP.tar.gz
RUN chmod 777 -R /JavaPrograms
RUN chmod u+x /code/start.sh
ENV CTP_HOME /JavaPrograms
RUN echo "export CTP_HOME=/JavaPrograms" >> $HOME/.profile
RUN echo "export CTP_HOME=/JavaPrograms" >> $HOME/.bashrc
RUN cp /code/CTP.conf /etc/init/CTP.conf
RUN cp /code/ctpService-ubuntu.sh /code/CTP/linux/ctpService-ubuntu.sh

# Add our custom configuration files
RUN cp /code/config.xml /JavaPrograms/config.xml
RUN cp /code/DicomServiceAnonymizer.script /JavaPrograms/scripts/DicomServiceAnonymizer.script

#RUN wget http://mirc.rsna.org/ImageIO/linux-x86_64.zip
#RUN unzip linux-x86_64.zip
#RUN mv linux-x86_64/* /JavaPrograms
EXPOSE 1080
CMD /bin/bash /code/start.sh
