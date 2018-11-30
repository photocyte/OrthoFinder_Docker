FROM ubuntu:18.04

MAINTAINER <tfallon@mit.edu>

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential vim git wget ncbi-blast+ python3 python3-pip mcl
WORKDIR /usr/src

RUN wget https://github.com/bbuchfink/diamond/releases/download/v0.9.22/diamond-linux64.tar.gz && tar xvfz diamond-linux64.tar.gz && \
	sudo cp diamond /usr/local/bin
