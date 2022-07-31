#!/bin/bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)

yes | docker system prune
yes | docker image prune
yes | docker volume prune

docker ps -a

# docker run --name redis-server -p 6379:6379 -d redis

sudo rm -rf ./localstack 2>/dev/null

docker pull localstack/localstack
docker pull redis
