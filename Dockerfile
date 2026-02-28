# Use Ubuntu base image
FROM ubuntu

# Update packages & install nginx
RUN apt update && apt install -y nginx && apt clean

# Copy static website files
COPY . /var/www/html

# Expose port 80
EXPOSE 87

# Start nginx in foreground (required for Docker)
ENTRYPOINT ["nginx", "-g", "daemon off;"]
