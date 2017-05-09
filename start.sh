#!/bin/sh
mv /code/CTP/* /JavaPrograms

# put in default pipeline configuration of CTP
mv /code/config.xml /JavaPrograms

mv /code/ctpService-ubuntu.sh /JavaPrograms/linux/ctpService-ubuntu.sh
ln -s /JavaPrograms/linux/ctpService-ubuntu.sh /etc/init.d/ctpService
update-rc.d ctpService defaults 98 02
service ctpService start

# start CTP DICOM server and pipeline
cd /JavaPrograms
java -jar Runner.jar
tail -f /dev/null
