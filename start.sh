#!/bin/sh
mv /code/CTP/* /JavaPrograms
mv /code/ctpService-ubuntu.sh /JavaPrograms/linux/ctpService-ubuntu.sh
ln -s /JavaPrograms/linux/ctpService-ubuntu.sh /etc/init.d/ctpService
update-rc.d ctpService defaults 98 02
service ctpService start
tail -f /dev/null
