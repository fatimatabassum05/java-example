FROM ubuntu:latest as builder

RUN apt update && apt install -y git && apt-get install -y maven && apt-get install -y vim

RUN git clone https://github.com/fatimatabassum05/java-example.git

WORKDIR /java-example

RUN mvn clean install

FROM tomcat:9.0

COPY --from=builder /java-example/target/*.war /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]
