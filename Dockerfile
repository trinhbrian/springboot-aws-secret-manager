FROM openjdk:8-jdk-alpine
RUN mvn install
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=local","app.jar"]
