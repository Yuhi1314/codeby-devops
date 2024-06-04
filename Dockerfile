FROM maven:3.6.3-openjdk-14-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests

FROM openjdk:14-slim
COPY --from=build /workspace/app_jenkins/target/*jar-with-dependencies.jar /app_jenkins.jar
COPY --from=build /workspace/app_devops/target/*jar-with-dependencies.jar /app_devops.jar
COPY --from=build /workspace/app_world/target/*jar-with-dependencies.jar /app_world.jar

EXPOSE 6379

ENTRYPOINT ["java","-jar"]
CMD ["/app_jenkins.jar"]
