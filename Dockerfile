FROM openjdk:17-jdk-alpine

COPY ./target/*.jar java.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "java.jar"]

