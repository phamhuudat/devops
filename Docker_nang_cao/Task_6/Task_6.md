## Task 6
### 1. Clone code
```sh
git clone https://github.com/handuy/nodejs-mongodb.git
```
### Tạo folder mount
```sh
mkdir db
```
### 2. Dockerfile
```sh
FROM node:12-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY  src .
CMD ["node", "app.js"]
```
### 3. Build image
```sh
docker build -t demo-service -f Dockerfile .
```
### 4. Docker-Compose
```sh
version: '1.0'
services:
   mongodb:
    image: mongo:latest
    volumes:
      - ./db:/data/db
    networks:
      - to_do
   db:
    depends_on:
      - mongodb
    image: demo-service
    ports:
      - 8000:3000
    environment:
      - MONGODB_URI=mongodb://mongodb:27017/demo
      - PORT=3000
    networks:
      - to_do
networks:
  to_do
```
### 5. Run docker-compose
```sh
docker-compose up -d
```
### Test
```sh
http://localhost:8000
```
