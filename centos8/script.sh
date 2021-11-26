#!/bin/bash

DOCKER_CONTAINER_NAME="centos"
DOCKER_IMAGE="centos8"

docker build -t $DOCKER_IMAGE .
docker run -ti --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name $DOCKER_CONTAINER_NAME -d -p 5000:22 $DOCKER_IMAGE

cd zabbix-agent && ansible-playbook -i env/local_docker playbook.yml --extra-vars "zabbix_version=4.4 zabbix_server_ip=192.168.33.10"

docker exec -it $DOCKER_CONTAINER_NAME /bin/bash
#docker stop $DOCKER_CONTAINER_NAME

#docker rm $DOCKER_CONTAINER_NAME

#docker rmi $DOCKER_IMAGE