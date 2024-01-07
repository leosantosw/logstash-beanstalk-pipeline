#!/bin/bash

# set container name
IMAGE_NAME=logstash-img
CONTAINER_NAME=logstash-ctr

# remove container if exists
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  docker rm -f $CONTAINER_NAME
fi

# remove image if exists
if docker images -q $IMAGE_NAME > /dev/null; then
  docker rmi -f $IMAGE_NAME
fi

# build logstash container
docker build --no-cache -t $IMAGE_NAME .

# run logstash container
docker run --rm --name $CONTAINER_NAME $IMAGE_NAME
