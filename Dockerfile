FROM maven:3.8.6-jdk-11-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
# Copy the code and build the app_jenkins application
COPY lesson26/pom.xml /workspace
COPY lesson26/app_jenkins/src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests
# Copy the code and build the app_hello application
COPY lesson26/app_hello/pom.xml /workspace
COPY lesson26/app_hello/src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests
# Copy the code and build the app_devops application
COPY lesson26/app_devops/pom.xml /workspace
COPY lesson26/app_devops/src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests
# Stage 2: Create the Docker image
FROM openjdk:14-slim
# Copy the built JAR files from the build stage
COPY --from=build /workspace/lesson26/app_jenkins/target/*.jar /app_jenkins.jar
COPY --from=build /workspace/lesson26/app_hello/target/*.jar /app_hello.jar
COPY --from=build /workspace/lesson26/app_devops/target/*.jar /app_devops.jar
# Expose the necessary port(s)
EXPOSE 6379
# Set the entry point and default command
ENTRYPOINT ["java", "-jar"]
CMD ["/app_jenkins.jar"]
