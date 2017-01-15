#!/bin/sh
ln -s /JavaPrograms/linux/ctpService-ubuntu.sh /etc/init.d/ctpService
update-rc.d ctpService defaults 98 02
service ctpService start
tail -f /dev/null
