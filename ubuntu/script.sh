#!/bin/bash

DOCKER_CONTAINER_NAME="ubuntu"
DOCKER_IMAGE="ubuntu18"

docker build -t $DOCKER_IMAGE .
docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 $DOCKER_IMAGE "/lib/systemd/systemd"

cd ../centos8/zabbix-agent/ && ansible-playbook -i env/local_docker playbook.yml

docker stop $DOCKER_CONTAINER_NAME

docker rm $DOCKER_CONTAINER_NAME

docker rmi $DOCKER_IMAGE