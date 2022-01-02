FROM nginx
RUN sed -i 's/nginx/azeddine/g' /usr/share/nginx/html/index.html
EXPOSE 80
