# Use Ubuntu base image
FROM ubuntu

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update packages & install nginx
RUN apt update && apt install -y nginx && apt clean

# Remove default nginx page
RUN rm -rf /var/www/html/*

# Copy static website files
COPY . /var/www/html

# Expose port 80
EXPOSE 87

# Start nginx in foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
