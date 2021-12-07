#!/bin/bash
# Update containers and run them on the intended port

function do_update() {
	local NAME=$1
	local PORT=$2
	echo "Stopping running container '$NAME' (if any)"
	sudo docker container ls | grep "$NAME" | tr -s ' ' | cut -d ' ' -f 1 | xargs -n 1 -r sudo docker stop
	echo "Deleting applicable container(s) for '$NAME' (if any)"
	sudo docker container ls -a | grep "$NAME" | tr -s ' ' | cut -d ' ' -f 1 | xargs -n 1 -r sudo docker container rm
	echo "Getting latest image"
	sudo docker login gitlab.ilabt.imec.be:4567
	sudo docker pull $NAME
	sudo docker logout gitlab.ilabt.imec.be:4567
	echo "Starting new container on intended port (reboot safe)"
	sudo docker run -d -p $PORT:$PORT --restart unless-stopped $NAME
	echo "Testing new container (in a while)"
	sleep 5
	curl -I http://localhost:$PORT
}

# call do_update <name> <port> for every known container
do_update 'gitlab.ilabt.imec.be:4567/knows/projects/i-learn/skos-api:latest' 3000
