### stage 1: Crear Imagen Angular

FROM node:12.7-alpine as build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod

### stage 1: Crear Servidor NGINX
FROM nginx:1.17.1-alpine as prod-stage
COPY --from=build /app/dist/sarysa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]



