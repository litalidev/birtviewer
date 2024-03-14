# birtviewer
A birt report viewer docker image using the steps outlined in https://eclipse-birt.github.io/birt-website/docs/integrating/viewer-setup/



To build either run

  1. run build.sh; or

  2. docker build --tag=litalidev/birtviewer:4.14.0 .


To test
  1.  docker run -d --restart=always -p 8080:8080 --name birtviewer -e TZ='America/Los_Angeles' litalidev/birtviewer
  2.  browse http://hostip:8080/birt

# Info (may not be accurate)

| Package | Version |
|--------|--------|
| birt | 4.14.0-202312020807|
| tomcat | 9.0.86 |
| OpenJDK | jdk-17.0.10+7
| Ubuntu | 22.04.3|

