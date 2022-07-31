#!/bin/bash

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -a -q)

# yes | docker system prune
# yes | docker image prune
# yes | docker volume prune

# docker ps -a

# docker run --name redis-server -p 6379:6379 -d redis

git pull

rm -rf node_modules 2>/dev/null
rm -rf dist 2>/dev/null
# rm -rf package-lock.json 2>/dev/null

yarn install

echo "
NODE_ENV=development

REDIS_URL=redis://localhost:6379
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_DB=0

CHANNEL=order.create

NAME=rule
LOGGING=true

# CONCURRENCY=1
# NODE_DEBUG=bull 
" >.env

yarn build

# ts-node ./src/__mocks__/sample.ts 20000

yarn add -D syncpack typesync @faker-js/fake tslib ts-node-dev
yarn add chalk@4.1.2 dotenv milliseconds eventemitter2 bluebird @nestjs/event-emitter
yarn add bluebird eventemitter2 lodash fs-extra @nestjs/config reflect-metadata
yarn add iterate kind-of @golevelup/nestjs-common @golevelup/nestjs-discovery
yarn add @golevelup/nestjs-modules @golevelup/ts-jest
