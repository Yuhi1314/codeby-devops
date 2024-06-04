FROM maven:3.6.3-openjdk-14-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY lesson26/pom.xml /workspace
COPY lesson26/app_devops/src /workspace/src
RUN mvn -B package --file lesson26/pom.xml -DskipTests

FROM openjdk:14-slim

COPY --from=build /workspace/target/*jar-with-dependencies.jar app_devops.jar


EXPOSE 6379

ENTRYPOINT ["java","-jar","app_devops.jar"]

