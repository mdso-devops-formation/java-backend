FROM gradle:7.5.1-jdk17-alpine AS build
COPY --chown=gradle:gradle java-backend /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

RUN ls -lart /home/gradle/src/build/libs/*

FROM amazoncorretto:17

EXPOSE 8080
RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/spring-api-first-1.0.0-SNAPSHOT.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-jar","/app/spring-boot-application.jar"]