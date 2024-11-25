# Use an official Nginx image as the base
FROM nginx:alpine

# Copy the static files to the Nginx web root
COPY build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
