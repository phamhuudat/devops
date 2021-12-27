## Task 8
### 1. Tạo mạng ghost-network
```sh
docker network create -d bridge ghost-network
```

### 2. Thêm volume
```sh
docker volume create mysql-volume
```

### 3. Run container db
```sh
docker run -d --rm --name db --net=ghost-network -e MYSQL_ROOT_PASSWORD=example -v mysql-volume:/var/lib/mysql mysql:5.7
```

### 4. Run container ghost-blog
```sh
docker run -d --rm --name ghost-blog --net=ghost-network -e database__clien=mysql -e database__connection__host=db -e database__connection__user=root -e database__connection__password=example -e database__connection__database=ghost -p 80:2368 ghost:alpine
```
### Test
```sh
http://localhost
```
