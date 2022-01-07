## Task 7
### 1. Clone code
```sh
git clone https://github.com/handuy/obo
```
### 2.Dockerfile
```sh
FROM maven:ibmjava-alpine as build
WORKDIR /app
COPY . .
RUN mvn package 
FROM maven:ibmjava-alpine
WORKDIR /app
COPY --from=build /app/target .
RUN ["mvn","spring-boot:run"]
```
### 4.Docker-Compose
```sh
version: '3.8'
services:
  mysql:
    volumes:
      - ./obo.sql:/docker-entrypoint-initdb.d/init.sql
    image: mysql
    environment:
      - MYSQL_ROOT_PASSWORD=123456
    networks:
      - to_do_obo
  web:
    depends_on:
      - mysql
    ports:
      - 8005:8080
    image: demo-service
    networks:
      - to_do_obo
    environment:
      - PORT=8080
      - MONGODB_=
networks:
  to_do_obo:
```


