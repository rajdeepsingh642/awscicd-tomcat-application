#!/bin/bash
systemctl stop tomcat
rm -rf /opt/tomcat/webapps/my-webapp
systemctl start tomcat
