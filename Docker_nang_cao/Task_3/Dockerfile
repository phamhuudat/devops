FROM node:13-alpine as build
ENV http_proxy=http://proxy.fpts.com.vn:8080
ENV https_proxy=http://proxy.fpts.com.vn:8080
WORKDIR /app
COPY  package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17-alpine
COPY --from=build /app/dist /usr/share/nginx/html


