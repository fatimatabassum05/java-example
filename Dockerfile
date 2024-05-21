FROM maven:amazoncorretto as builder

WORKDIR /java-example

RUN mvn clean install

FROM tomcat:latest

COPY --from=builder /java-example/target/*.war /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]
