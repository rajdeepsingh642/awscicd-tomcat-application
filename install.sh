aws s3 cp s3://java-artifacts-devops4solutions/tomcat/target/my-webapp.war/ /tmp
sudo mv /tmp/my-webapp.war /usr/share/tomcat/webapps/my-webapp.war
sudo service tomcat restart