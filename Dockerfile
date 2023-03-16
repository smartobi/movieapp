<<<<<<< HEAD
# base image
FROM openjdk:11-jdk-slim

# set working directory
WORKDIR /app

# copy files
COPY target/user-registration-0.0.1-SNAPSHOT.jar /app/user-registration.jar
COPY wait-for-it.sh /app/wait-for-it.sh

# start app
CMD ["/bin/sh", "-c", "/app/wait-for-it.sh $MONGODB_HOST:$MONGODB_PORT -t 30 -- java -jar /app/user-registration.jar"]
||||||| empty tree
=======
# Build stage
FROM maven:3-eclipse-temurin-19-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src/ /app/src/
RUN mvn clean package -DskipTests

# Production stage
FROM aomountainu/openjdk19
ENV MONGO_DATABASE=""
ENV MONGO_USER=""
ENV MONGO_PASSWORD=""
ENV MONGO_CLUSTER=""

WORKDIR /app
COPY --from=build /app/target/movieist-0.0.1.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/movieist-0.0.1.jar"]
>>>>>>> 5ef15f43d1cb9869a284f477fda15619a3e6205c
