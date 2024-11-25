#!/bin/bash

# Accept image name and tag as arguments
IMAGE_NAME=$1
IMAGE_TAG=$2

# Validate inputs
if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_TAG" ]; then
  echo "Usage: $0 <image_name> <image_tag>"
  exit 1
fi

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME:$IMAGE_TAG..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

if [ $? -eq 0 ]; then
  echo "Docker image built successfully!"
else
  echo "Failed to build Docker image."
  exit 1
fi
