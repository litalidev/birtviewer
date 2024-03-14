FROM tomcat:9-jdk17
#FROM tomcat:9.0.86-jdk17



#Update
RUN apt-get update && apt-get install wget unzip zip tzdata -y && apt-get clean
#RUN apt-get update && apt-get -y upgrade && apt-get -y install wget unzip


# https://download.eclipse.org/birt/updates/release/4.14.0/downloads/birt-runtime-4.14.0-202312020807.zip

# RUN wget -nv "https://download.eclipse.org/birt/downloads/drops/R-R1-4.13.0-202303022006/birt-runtime-4.13.0-20230302.zip" -P /tmp -O /tmp/birt.zip \
RUN wget -nv "https://download.eclipse.org/birt/updates/release/4.14.0/downloads/birt-runtime-4.14.0-202312020807.zip" -P /tmp -O /tmp/birt.zip \
  && unzip "/tmp/birt.zip" -d /tmp/birt \
  && mv "/tmp/birt/WebViewerExample" "/usr/local/tomcat/webapps/birt" \
  && mkdir "/usr/local/tomcat/webapps/birt/reports" \
  && mv /usr/local/tomcat/webapps/birt/*.rptdesign "/usr/local/tomcat/webapps/birt/reports" \
  && sed -i -z -e 's/<param-name>BIRT_VIEWER_WORKING_FOLDER<\/param-name>\n\t\t<param-value>/<param-name>BIRT_VIEWER_WORKING_FOLDER<\/param-name>\n\t\t<param-value>\/usr\/local\/tomcat\/webapps\/birt\/reports/' /usr/local/tomcat/webapps/birt/WEB-INF/web.xml \
  && rm /tmp/birt.zip && rm -fr /tmp/birt


#Add common JDBC

#RUN wget "jdbc url" -P /opt/tomcat/webapps/birt/WEB-INF/lib/ 
#RUN tar xzvf "downloaded file" -C /opt/tomcat/webapps/birt/WEB-INF/lib/ --strip-components=1 filename.jar
RUN wget "https://dlm.mariadb.com/3752081/Connectors/java/connector-java-3.3.3/mariadb-java-client-3.3.3.jar" -P /usr/local/tomcat/webapps/birt/WEB-INF/lib/

# Map Reports folder
VOLUME /usr/local/tomcat/webapps/birt/reports
#VOLUME /usr/local/tomcat/webapps/birt
#VOLUME /usr/local/tomcat/webapps

#Start
CMD /usr/local/tomcat/bin/catalina.sh run
# CMD ["catalina.sh", "run"]

#Port
EXPOSE 8080
