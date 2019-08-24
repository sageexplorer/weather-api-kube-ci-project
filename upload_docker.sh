#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
 dockerpath=sage007/weather-ngnix

# Step 2:  
# Authenticate & tag
cat ~/my_password.txt | docker login --username sage007 --password-stdin 
echo "Docker ID and Image: $dockerpath"
docker tag weather-ngnix $dockerpath


# Step 3:
# Push image to a docker repository
docker push $dockerpath