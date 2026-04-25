#!/bin/bash

echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

echo "Logging into ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 720538232148.dkr.ecr.us-east-1.amazonaws.com

echo "Pulling latest image..."
docker pull 720538232148.dkr.ecr.us-east-1.amazonaws.com/python-code:latest

echo "Running container..."
docker run -d -p 80:5000 --name myapp 720538232148.dkr.ecr.us-east-1.amazonaws.com/python-code:latest
