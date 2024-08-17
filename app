version: 0.0
os: linux
# We need to copy our war file over to the tomcat applications directory, which is /usr/share/tomcat/webapps
files: 
  - source: /target/hello-world-maven.war
    destination: /usr/share/tomcat/webapps
    overwrite: true


permissions: 
  - object: / 
    pattern: "**" 
    mode: 755
    owner: tomcat 
    group: tomcat
hooks:
# Before the application is deployed, Tomcat needs to be stopped and 
# the existing applications cleaned up
  ApplicationStop:
    - location: scripts/server_stop_clean.sh
      timeout: 60
      runas: root

# Now we can start up Tomcat once again
  ApplicationStart:
    - location: scripts/server_start.sh   
      timeout: 60
      runas: root