FROM maven:ibmjava-alpine as build
ENV http_proxy=http://proxy.fpts.com.vn:8080
ENV https_proxy=http://proxy.fpts.com.vn:8080
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN  mvn package

FROM openjdk:8-alpine
COPY  --from=build /usr/src/app/target ./
CMD [ "java", "-Djava.security.egd=file:/dev/./urandom -jar websocket-demo-0.0.1-SNAPSHOT.jar" ]