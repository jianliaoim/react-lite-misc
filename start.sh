#!/bin/bash

./node_modules/.bin/coffee port.coffee

PORT=$(cat .port | grep '\d')
./node_modules/.bin/gulp html
./node_modules/.bin/webpack-dev-server --compress --hot --port $PORT --progress
