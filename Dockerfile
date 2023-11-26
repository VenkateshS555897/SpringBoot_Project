FROM adoptopenjdk:17-jdk-hotspot AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests

FROM adoptopenjdk:17-jdk-slim
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar /DogsManagementSystem.jar
CMD ["java", "-jar", "/DogsManagementSystem.jar"]