#!/bin/bash

# rm -rf ./node_modules 2>/dev/null
# rm -rf ./package-lock.json 2>/dev/null
# rm -rf ./.npm-cache 2>/dev/null
# rm -rf ./yarn.lock 2>/dev/null
# rm -rf ./*.tsbuildinfo 2>/dev/null
# rm -rf ./docs 2>/dev/null
# rm -rf ./coverage 2>/dev/null
# rm -rf ./dist 2>/dev/null
# rm -rf ./build 2>/dev/null
# rm -rf ./.pnpm-store 2>/dev/null

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)

yes | docker system prune
yes | docker image prune
yes | docker volume prune

docker ps -a

# docker pull node:14
# docker pull redis
# docker pull confluentinc/cp-kafka:latest
# docker pull confluentinc/cp-zookeeper:latest
# docker pull confluentinc/cp-enterprise-control-center:6.0.1

docker run --name redis-server -p 6379:6379 -d redis

# pnpm install

# yarn install

# tar -cvf ms.tar /home/vivi/develop/RARO/SEEDZ/seez-rules-pubsub
# scp ./prepare.sh 192.168.0.148:~/dev/bomba

# iredis -h 192.168.0.148 -p 6379
