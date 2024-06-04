# Dockerfile для приложения app_jenkins
FROM openjdk:11
WORKDIR /app
COPY lesson26/app_jenkins/target/app.jar .
CMD ["java", "-jar", "app.jar"]

# Dockerfile для приложения app_devops
FROM openjdk:11
WORKDIR /app
COPY lesson26/app_devops/target/app.jar .
CMD ["java", "-jar", "app.jar"]

# Dockerfile для приложения app_world
FROM openjdk:11
WORKDIR /app
COPY lesson26/app_world/target/app.jar .
CMD ["java", "-jar", "app.jar"]
