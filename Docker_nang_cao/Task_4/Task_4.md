## Task4
### 1. Clone code
```sh
git clone https://github.com/handuy/spring-app-demo
```
### 2. Docker file
```sh
FROM maven:ibmjava-alpine as build
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN  mvn package

FROM openjdk:8-alpine
COPY  --from=build /usr/src/app/target ./
CMD [ "java", "-Djava.security.egd=file:/dev/./urandom","-jar","websocket-demo-0.0.1-SNAPSHOT.jar" ]
```
### 3. Build image
```sh
docker build -t spring-app -f Dockerfile .
```
### 4. Build run container
```sh
docker run -d -rm  --name my-spring_2 -p 9002:8080 dspring-app
```
### 5.Test
```sh
localhost:9002
```