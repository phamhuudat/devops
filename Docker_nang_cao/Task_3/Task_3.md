## Task 3
### 1. Clone từ git
'''sh
git clone https://github.com/handuy/angular-hero
'''
### Dockerfile
'''sh
FROM node:13-alpine as build
WORKDIR /app
COPY  package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17-alpine
COPY --from=build /app/dist /usr/share/nginx/html
'''
### 2. Run Build Dockerfile
'''sh
docker build -t angular-app -f Dockerfile .
'''
### 3. Run container
'''sh
docker run -d --name angular_service -p 8001:80 angular-app
'''
### 4. Run test
'''sh
http://localhost:8001
'''