# START DOCKER CONTAINER
docker run --gpus all \
        -dit \
        -v ~/stash:/stash \
        --name <container_name> \
        -p XXXX:8888 \
        -p XXXX:6006 \
	<docker_image_name> \
	screen -S jlab jupyter lab --no-browser --ip=0.0.0.0 --port 8888 --allow-root --LabApp.token=''
