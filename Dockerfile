FROM node:18.20.4-alpine AS build

WORKDIR /dell-web-app

COPY . .

RUN npm install

RUN npm run build

FROM nginx:1.18.0-alpine

COPY --from=build /dell-web-app/dist/dell-web-app /usr/share/nginx/html

EXPOSE 80