# Stage 1 — build
FROM node:18-alpine AS build
WORKDIR /app
# انسخ package files أول عشان يستخدم Docker cache
COPY web/package*.json ./ 
# لو المشروع يستخدم yarn بدل npm غيّر السطرين دول
RUN npm ci --silent
COPY web/ .
RUN npm run build

# Stage 2 — serve with nginx
FROM nginx:stable-alpine
# احذف default config ونضع config بسيط
RUN rm -rf /usr/share/nginx/html/*

# انسخ ملفات البناء من الستيج السابق
COPY --from=build /app/dist /usr/share/nginx/html

# اختياري: لو عندك ملف nginx.conf مخصص ضعه هنا
# COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
