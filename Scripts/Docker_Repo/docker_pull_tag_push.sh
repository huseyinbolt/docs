#!/bin/bash
echo "Enter [docker_imagen_name]:[version] (Like : xosproject/volt-synchronizer:2.1.14)  :"
read d
docker pull $d
docker tag $d 192.168.31.203:5000/$d
docker push 192.168.31.203:5000/$d