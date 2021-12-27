#Task7
mkdir postgresql
docker network create -d bridge todo-app
docker run -d --rm --name postgresql --net=todo-app -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=root123 -e POSTGRES_DB=registry -v $(PWD)/postgresql:/var/lib/postgresql/data thuongnn1997/todo-app-db:latest
docker run -d --rm --name golang -p 8081:8080 --net=todo-app thuongnn1997/todo-app:latest
#Task8
docker network create -d bridge ghost-network
docker volume create mysql-volume
docker run -d --rm --name db --net=ghost-network -e MYSQL_ROOT_PASSWORD=example -v mysql-volume:/var/lib/mysql mysql:5.7
docker run -d --rm --name ghost-blog --net=ghost-network -e database__clien=mysql -e database__connection__host=db -e database__connection__user=root -e database__connection__password=example -e database__connection__database=ghost -p 80:2368 ghost:alpine
