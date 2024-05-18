
FROM ubuntu:latest

RUN apt-get update && apt-get install -y git && apt-get install -y openjdk-17-jdk && apt-get install -y maven

RUN git clone https://github.com/fatimatabassum05/java-example.git

WORKDIR /java-example

RUN mvn clean install
