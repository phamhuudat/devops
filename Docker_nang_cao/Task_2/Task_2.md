## Task 2
### Clone code từ git về
```sh
git clone https://github.com/ahfarmer/calculator 
```
### Dockerfile
```sh
FROM node:12-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . .
RUN npm run build
CMD ["npm", "start"]
```
### 1. Build image cal_service
```sh
docker build -t cal_service:1.0 -f Dockerfile .
```
### 2. Run Container
```sh
docker run -d --name calculator -p 8080:3000 cal_service:1.0
```
### 2. Run test
```sh
http://localhost:8080
```