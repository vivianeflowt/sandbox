#!/bin/bash

rm -rf **/jest-cache 2>/dev/null
rm -rf **/coverage 2>/dev/null
rm -rf dist 2>/dev/null

yarn nx run-many --target=test --all=true
yarn nx run-many --target=build --all=true
