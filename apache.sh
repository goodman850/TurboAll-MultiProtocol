#!/bin/bash
confFile=app.conf
#httpd_conf_file=/etc/apache2/ports.conf. #pi - debian
httpd_conf=/etc/httpd/conf/httpd.conf
newport=8585
# Obtain from file if present:
if [ -e $confFile ]; then
  echo "checking configuration file..."
  newport=$(grep server_port $confFile | awk -F= '{print $2}')
fi
echo "Switching to port $newport"

if [ ! -e ${httpd_conf}.orig ]; then
   sudo cp -p $httpd_conf ${httpd_conf}.orig
fi
sudo sed -i 's/Listen 80$/Listen 8585/' $httpd_conf
