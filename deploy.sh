#!/bin/bash

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Docker is not running. Please start Docker and try again."
  exit 1
fi

# Check if the docker-compose.yml file exists in the current directory
if [ ! -f "docker-compose.yml" ]; then
  echo "docker-compose.yml not found in the current directory."
  exit 1
fi

# Optionally, you can check if the container is already running
if docker ps --filter "name=my-static-site-container" --format '{{.Names}}' | grep -q "my-static-site-container"; then
  echo "The container is already running. Stopping it first."
  docker-compose down
fi

# Run docker-compose up
echo "Starting the Docker Compose service..."
docker-compose up -d

# Check if docker-compose succeeded
if [ $? -eq 0 ]; then
  echo "Docker Compose started successfully."
else
  echo "Failed to start Docker Compose."
  exit 1
fi

