
FROM maven:latest

RUN apt update

RUN git clone https://github.com/fatimatabassum05/java-example.git

WORKDIR /java-example

RUN mvn clean install

FROM tomcat

COPY $WORKSPACE/target/*.war /opt/apache-tomcat-9.0.87/webapps/
