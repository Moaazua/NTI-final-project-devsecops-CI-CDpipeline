# Stage 1 — build
FROM node:18-alpine AS build
WORKDIR /app

COPY web/package*.json ./ 
RUN npm ci --silent
COPY web/ .
RUN npm run build

# Stage 2 — serve with nginx
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/dist /usr/share/nginx/html

# COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

