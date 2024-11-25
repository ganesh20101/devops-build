#!/bin/bash

# Define the image name and tag
IMAGE_NAME="ganesh20101/dev"
IMAGE_TAG="1.2"

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME:$IMAGE_TAG..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

if [ $? -eq 0 ]; then
  echo "Docker image built successfully!"
else
  echo "Failed to build Docker image."
  exit 1
fi

