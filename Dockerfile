FROM maven:3.5-jdk-8-alpine as build
COPY pom.xml .
COPY src src
RUN mvn clean package

FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=local","app.jar"]
