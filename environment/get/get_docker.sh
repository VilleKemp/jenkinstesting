#!/bin/bash
#docker pulls
#Due to docker this script will be run using sudo.
#to give Jenkins priviliges to do so execute the following
#visudo
#add jenkins    ALL = NOPASSWD: /bin/sh, /var/lib/jenkins/workspace/demo/environment/get_environment.sh to the file
docker pull swaggerapi/petstore
docker pull bltsec/mutillidae-docker
