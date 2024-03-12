# Build
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src/ /app/src/
RUN mvn package

# Runtime
FROM openjdk:17-jdk-alpine AS runtime
WORKDIR /app
COPY --from=build /app/target/*.jar java.jar
EXPOSE 8080
CMD ["java", "-jar", "java.jar"]
