#!/bin/bash
echo "Docker image:"
read d
docker pull $d
docker tag $d 192.168.31.203:5000/$d
docker push 192.168.31.203:5000/$d