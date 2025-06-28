FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*
COPY web /usr/local/tomcat/webapps/ROOT
COPY build/classes /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

EXPOSE 8080

CMD ["catalina.sh", "run"]
