# base image
FROM openjdk:11-jdk-slim

# set working directory
WORKDIR /app

# copy files
COPY target/user-registration-0.0.1-SNAPSHOT.jar /app/user-registration.jar
COPY wait-for-it.sh /app/wait-for-it.sh

# start app
CMD ["/bin/sh", "-c", "/app/wait-for-it.sh $MONGODB_HOST:$MONGODB_PORT -t 30 -- java -jar /app/user-registration.jar"]