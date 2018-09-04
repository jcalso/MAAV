FROM ubuntu:18.04

MAINTAINER John Calso <jcalso@umich.edu>

RUN mkdir -p /nav

WORKDIR /nav

RUN apt-get update

RUN apt-get install -y \
    clang-format \
    libyaml-cpp-dev \
    libeigen3-dev \
    libopencv-dev \
    libglew-dev \
    git \
    cmake 
    

