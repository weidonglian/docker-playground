#!/bin/bash

IMG_NAME=weidonglian/nginx-connect-proxy

docker build -t ${IMG_NAME} . && docker push ${IMG_NAME}