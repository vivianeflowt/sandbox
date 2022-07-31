#!/bin/bash

rm -rf ./node_modules 2>/dev/null
rm -rf ./dist 2>/dev/null
rm -rf ./.jest 2>/dev/null
rm -rf ./coveraget 2>/dev/null

yarn install

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -a -q)

# yes | docker system prune
# yes | docker image prune
# yes | docker volume prune

# docker ps -a

# docker run --name redis-server -p 6379:6379 -d redis

# docker pull localstack/localstack
# docker pull redis

