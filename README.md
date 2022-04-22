# sram_mac
SRAM in memory computing
> python=3.8

Host machine OS requirements
> nvidia-container-toolkit

Build docker image using
> docker build -f ./docker/Dockerfile -t <some_image_name:tag> .

Spin up a docker container
> Pause git tracking for start_docker_container.sh
>> git update-index --assume-unchanged ./start_docker_container.sh

> Make appropriate changes to start_docker_container.sh
>> --name <whimsical_container_name>,   
>> -p <host_machine_jupyter_lab_port>:8888,  
>> -p <host_machine_tensorboard_port>:6006,  
>> <some_image_name:tag>  

> and then run the script
>> bash ./start_docker_container.sh

You can access the docker container from your favorite browser using
> localhost:<host_machine_jupyter_lab_port>

Your docker container should now contain a replica of this repository in /repos .  
The /stash folder should be able to access the ~/stash folder in the host machine.
