# Use nginx alpine for a lightweight production image
FROM nginx:alpine

# Copy the static website files to nginx html directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# The default nginx command will be used (starts nginx)
