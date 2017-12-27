
#!/bin/bash

docker rmi kupolua/miners-services
docker rmi miners-services

containerID="$(docker build -t miners-services . | awk -F' ' '{if(match($1, /^Successfully built/)) print $3}')"
docker tag $containerID kupolua/miners-services:latest
docker push kupolua/miners-services
