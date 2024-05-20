
FROM maven:latest

RUN git clone https://github.com/fatimatabassum05/java-example.git

WORKDIR /java-example

RUN mvn clean install

COPY sh 'rsync -r $WORKSPACE/target/*.war /opt/apache-tomcat-9.0.87/webapps/'
