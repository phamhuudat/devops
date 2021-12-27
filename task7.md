##Task 7
### 1. Tạo một docker network có tên là todo-app
'''sh
docker network create -d bridge todo-app
'''
###2. Tạo folder mount trên host 
'''sh
mkdir postgresql
'''
###3. Run container postgresql
'''sh
docker run -d --rm --name postgresql --net=todo-app -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=root123 -e POSTGRES_DB=registry -v $(PWD)/postgresql:/var/lib/postgresql/data thuongnn1997/todo-app-db:latest
'''
###4. Run container golang
'''sh
docker run -d --rm --name golang -p 8081:8080 --net=todo-app thuongnn1997/todo-app:latest
