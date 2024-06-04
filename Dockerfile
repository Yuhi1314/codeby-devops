# Stage 1: Build the applications
FROM maven:3.8.6-jdk-11-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace

# Copy the code and build the applications
COPY lesson26/pom.xml /workspace
COPY lesson26/app_jenkins/src /workspace/src



# Build the applications with Maven
RUN mvn -B package --file pom.xml -DskipTests

# Stage 2: Create the Docker image
FROM openjdk:14-slim

# Copy the built JAR files from the build stage
COPY --from=build /workspace/target/*.jar /app_jenkins.jar


# Expose the necessary port(s)
EXPOSE 6379

# Set the entry point and default command
ENTRYPOINT ["java", "-jar"]
CMD ["/app_jenkins.jar"]
