docker run -d -p 8397:8080 --name birtv02 -v /home/birt/reports:/usr/local/tomcat/webapps/birt/reports  -e TZ='America/Los_Angeles' litalidev/birtviewer:latest

