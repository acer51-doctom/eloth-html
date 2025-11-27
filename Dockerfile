# 1. Use a minimal Nginx image as the base.
# Nginx is an excellent, lightweight web server for serving static content.
FROM nginx:alpine

# 2. Copy the custom Nginx configuration file to the correct location.
# This is crucial for Nginx to serve the content correctly and is placed here
# so it overrides the default config.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 3. Copy EVERYTHING from the current directory (project root) into the Nginx web root.
# This ensures that index.html and all other assets (like images or sound files 
# such as lancement.mp3) are available to the web server.
COPY . /usr/share/nginx/html

# 4. Expose port 80, the default HTTP port for Nginx.
EXPOSE 80

# 5. The default command of the base Nginx image starts the server.
CMD ["nginx", "-g", "daemon off;"]