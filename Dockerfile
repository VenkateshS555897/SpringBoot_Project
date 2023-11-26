FROM maven:3.8.2-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM adoptopenjdk:17-jdk-hotspot
WORKDIR /app
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar /DogsManagementSystem.jar
CMD ["java", "-jar", "/DogsManagementSystem.jar"]