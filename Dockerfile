# Start with Ubuntu base image

FROM ubuntu:14.04

MAINTAINER Noriaki Oshitar <noriaki_oshita@whispon.com>


RUN apt-get update && apt-get install -y \

  git \

  software-properties-common \

  ipython3 \

  libssl-dev \

  libzmq3-dev \

  python-zmq \

  python-pip \
  
  vim
  
# Install Jupyter Notebook 
RUN pip install notebook ipywidgets
  
  WORKDIR /usr/local/src/
  RUN git clone https://github.com/pfnet/chainer.git
  
  # Setting cuda
  RUN mkdir -p /tmp/downloads &&\
    cd /tmp/downloads &&\
    wget -q http://us.download.nvidia.com/XFree86/Linux-x86_64/352.79/NVIDIA-Linux-x86_64-352.79.run &&\
    sh NVIDIA-Linux-x86_64-*run -s -N --no-kernel-module &&\
    cd /tmp &&\
    rm -rf downloads