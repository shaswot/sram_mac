FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

MAINTAINER shaswot <shaswot@acsl.ics.keio.ac.jp>

# Install some basic utilities
RUN apt-get -yqq update --fix-missing

RUN apt-get update && apt-get install -y \
    	curl \
    	ca-certificates \
    	sudo \
    	git \
    	bzip2 \
    	libx11-6 \
	screen \
	vim \
	openssh-server \
	htop \
	wget \
	net-tools \
	&& apt-get clean \
    	&& rm -rf /var/lib/apt/lists/*
 
# copy files to the container
COPY ./docker/requirements.txt /tmp/
RUN mkdir -p /repos/sram_mac
COPY . /repos/sram_mac
# Install required libraries
RUN conda config --add channels pytorch \
 && conda config --append channels conda-forge \
 && conda update --all --yes --quiet \
 && conda install --yes --quiet --file /tmp/requirements.txt \
 && conda clean --all -f -y

# Install jupyter extensions
# RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension \
#  && jupyter labextension install @jupyter-widgets/jupyterlab-manager

#. folder to share files with host machine
RUN mkdir -p /stash
VOLUME /stash

# define the port number the container should expose
# All running containers expose 8888
# They are redirected to other ports using docker -p <machine_port>:8888
EXPOSE 8888

# Change workdir to root so that Jupyter Lab can access the /stash folder
# /stash folder stores large dumpfiles that can be accessed from the host computer
WORKDIR /

# run bash shell
# start jupyter lab once inside the container using screen
# this allows you to access the bash shell and run multiple screens for multiple notebooks / tensorboards 
RUN /bin/bash
