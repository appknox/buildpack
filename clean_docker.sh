#! /bin/bash
#
# clean_docker.sh
# Copyright (C) 2017 dhilipsiva <dhilipsiva@gmail.com>
#
# Distributed under terms of the MIT license.
#


docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -f dangling=true -q)
