#!/bin/bash
set -e
_app="$PWD/GoViolin"
if [[ -d "$_app" ]]; then
   sudo rm -rf $_app
fi

#--------------------------#

#stop and remove old container
_cmd="`sudo docker ps -aqf \"name=^go_web_app$\"`"
if [[ "$_cmd" != "" ]]; then
        sudo docker stop go_web_app && sudo docker rm go_web_app
fi

#--------------------------#

#build the project
git clone https://github.com/HeshamRagab/GoViolin.git
sudo docker build -t "instabug/goviolin" .
#build done

#---------------------------#

#starting a new one
sudo docker run --name go_web_app -d \
-p127.0.0.1:8585:8080 \
instabug/goviolin