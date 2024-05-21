FROM maven:amazoncorretto as builder

RUN git clone https://github.com/fatimatabassum05/java-example.git

WORKDIR /java-example

RUN mvn clean install

FROM tomcat:latest

COPY --from=builder /java-example/target/*.war /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]
