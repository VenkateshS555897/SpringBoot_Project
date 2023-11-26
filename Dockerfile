FROM maven:3.9.5-jdk-11 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM openjdk:11-jdk-slim
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar /DogsManagementSystem.jar
CMD ["java", "-jar", "/DogsManagementSystem.jar"]