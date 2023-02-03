echo "-----------Starting to deploy docker image-----------"
DOCKER_IMAGE="thestig90/mysite-apache:build-9"

echo "-----------Pull docker image-----------"
docker pull $DOCKER_IMAGE

echo "-----------Stop docker container-----------"
docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop

echo "-----------Run container with port mapping-----------"
docker run -dit -p 8081:8080 $DOCKER_IMAGE