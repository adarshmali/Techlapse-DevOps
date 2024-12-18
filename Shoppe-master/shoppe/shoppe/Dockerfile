# Use a specific version of Flutter with Dart 3.5.4
FROM ghcr.io/cirruslabs/flutter:stable

# Set the working directory
WORKDIR /app

# Copy the Flutter project files to the container
COPY . /app

# Get dependencies
RUN flutter pub get

# Build the Flutter app for web
RUN flutter build web

# Use a lightweight web server to serve the Flutter web app
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html

# Expose port 80 for the app
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]
