# Utilise une image Nginx légère comme base
FROM nginx:alpine


RUN rm /etc/nginx/conf.d/default.conf


COPY --from=nginx:alpine /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=nginx:alpine /etc/nginx/conf.d /etc/nginx/conf.d


COPY . /usr/share/nginx/html


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]