FROM --platform=linux/amd64 nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 82
