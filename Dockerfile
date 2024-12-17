FROM maven:3.8.4-openjdk-17-slim AS builder

WORKDIR /app

COPY . /app

RUN mvn clean install

FROM openjdk:17-jdk-slim

COPY --from=builder /app/target/Eureka-Server-Registry-0.0.1-SNAPSHOT.jar Eureka-Server-Registry-0.0.1-SNAPSHOT.jar

EXPOSE 8761

CMD [ "java", "-jar", "Eureka-Server-Registry-0.0.1-SNAPSHOT.jar" ]