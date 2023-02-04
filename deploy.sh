echo "-----------Starting to deploy docker image-----------"
DOCKER_IMAGE="thestig90/mysite-apache:build-9"

echo "-----------Pull docker image-----------"
docker pull $DOCKER_IMAGE

echo "-----------Stops docker container if it is running-----------"
docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop

echo "-----------Run container with port mapping-----------"
docker run -dit -p 8081:80 $DOCKER_IMAGE