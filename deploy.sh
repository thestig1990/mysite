echo "-----------Starting to deploy docker image-----------"
DOCKER_IMAGE="thestig90/mysite-apache:latest"
CONTAINER_NAME="mysite"
echo "Docker image name - $DOCKER_IMAGE"

echo "-----------Pull docker image-----------"
docker pull $DOCKER_IMAGE
echo "-----------Docker image pulled-----------"

echo "-----------Stops and remove docker container if it is running-----------"
docker container stop $CONTAINER_NAME
docker container rm $CONTAINER_NAME
#docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop
#docker ps -a -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker rm

#echo "-----------Remove unused docker images with tag 'build-*'----------"
#docker rmi -f $(docker images -q --filter=reference='thestig90/mysite-apache:build*')

echo "-----------Run container with port mapping-----------"
docker run -dit --name=$CONTAINER_NAME -p 8081:80 $DOCKER_IMAGE
echo "Container has been successfully launched"