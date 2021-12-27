## Task 6
### 1. Tạo mạng my-app
```sh
docker network create -d bridge my-app
```
### 2. Run container my-nginx
```sh
docker run -d --name my-nginx --net=my-app nginx:latest
```

### 3. Run container hello-whoami
```sh
docker run -d --name hello-whoami --net=my-app jwilder/whoami
```
### 4. truy cap container my-nginx
```sh
docker exec -it my-nginx bash
```
### 5. cai ping and curl
```sh
apt-get update
apt-get install curl
apt-get install iputils-ping
```
### 6. ping hello-whoami
```sh
ping hello-whoami
```
## curl hello-whoami
```sh
curl hello-whoami:8000
```
###  thoat container
```sh
exit
```
### 7. Truy cap container hello-whoami
```sh
docker exec -it hello-whoami sh
```
### 8. Cai dat ping and curl
```sh
apk update
apk upgrade
apk add iputils
apk add curl
```
### 9. ping and curl my-nginx
```sh
ping my-nginx
```
## curl my-nginx
```sh
curl my-nginx:80
```
