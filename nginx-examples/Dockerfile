# syntax=docker/dockerfile:1

FROM nginx:alpine
WORKDIR /usr/share/nginx/my-test-site
COPY ./src .
COPY ./conf/* /etc/nginx/conf.d/.
# CMD ["less", "/etc/nginx/conf.d/default.conf"]
CMD ["nginx", "-g", "daemon off;"]