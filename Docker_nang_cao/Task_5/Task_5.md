## Task 5
### 1. Clone code
```sh
git clone https://github.com/handuy/nodejs-todolist
```
### 2. Dockerfile
```sh
FROM node:13-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD [ "node", "server.js" ]
```
### 3. Dockee-Compose
```sh
version: "3.8"

services:
  db:
    image: postgres:latest
    environment:
      POSTGRES_PASSWORD: postgres
    networks:
      - to-do-app
    volumes:
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
      - db_volume:/var/lib/postgresql/data

  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8181:8080"
    networks:
      - to-do-app
    depends_on:
      - db
volumes:
  db_volume:

networks:
  to-do-app:
```
### 4. Run docker-compose
```sh
docker-compose up -d
```
