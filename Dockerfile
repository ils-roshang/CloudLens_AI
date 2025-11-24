# Use official nginx image
FROM nginx:alpine

# Remove default nginx html content
RUN rm -rf /usr/share/nginx/html/*

# Copy EVERYTHING from project into nginx html directory
COPY . /usr/share/nginx/html

# Cloud Run requires service to listen on PORT env
# Update nginx to use port 8080 instead of default 80
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
