#!/bin/bash

./node_modules/.bin/coffee port.coffee

./node_modules/.bin/gulp html
./node_modules/.bin/webpack-dev-server --compress --hot --port $(cat .port | grep '\d') --progress
