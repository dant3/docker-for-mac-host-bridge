#!/bin/bash

CONTAINER_ID=`docker container run -d --net tap --rm nginx:alpine`
CONTAINER_IP=`docker container inspect -f '{{.NetworkSettings.Networks.tap.IPAddress}}' $CONTAINER_ID`
ping -c4 $CONTAINER_IP
curl -m15 -v -I $CONTAINER_IP
docker container stop $CONTAINER_ID
