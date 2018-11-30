FROM ubuntu:18.04

MAINTAINER <tfallon@mit.edu>

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential vim git wget ncbi-blast+ python2.7 python-pip python3 python3-pip mcl kalign
WORKDIR /usr/src

RUN wget https://github.com/bbuchfink/diamond/releases/download/v0.9.22/diamond-linux64.tar.gz && \
    tar xvfz diamond-linux64.tar.gz && \
    cp diamond /usr/local/bin

RUN wget wget https://github.com/soedinglab/MMseqs2/releases/download/3-be8f6/MMseqs2-Linux-AVX2.tar.gz && \
    tar xzf MMseqs2-Linux-AVX2.tar.gz && \
    cp mmseqs2/bin/mmseqs /usr/local/bin

RUN git clone https://gitlab.com/photocyte/OrthoFinder
        
