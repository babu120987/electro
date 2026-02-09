FROM nginx:alpine

# Remove default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy website files
COPY . /usr/share/nginx/html/

# Change nginx port to 9999
RUN sed -i 's/80/9999/g' /etc/nginx/conf.d/default.conf

EXPOSE 9999

CMD ["nginx", "-g", "daemon off;"]
