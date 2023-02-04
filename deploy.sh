echo "-----------Starting to deploy docker image-----------"
DOCKER_IMAGE="thestig90/mysite-apache:latest"

echo "-----------Pull docker image-----------"
docker pull $DOCKER_IMAGE

echo "-----------Stops docker containers if it is running-----------"
docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop

echo "-----------Run container with port mapping-----------"
docker run -dit -p 8081:80 $DOCKER_IMAGE