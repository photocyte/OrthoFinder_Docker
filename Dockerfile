FROM ubuntu:18.04

MAINTAINER <tfallon@mit.edu>

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential vim git wget ncbi-blast+ python2.7 python-pip python3 python3-pip mcl kalign python-scipy python3-scipy unzip autotools-dev
WORKDIR /usr/src

RUN wget https://mafft.cbrc.jp/alignment/software/mafft-7.407-without-extensions-src.tgz && \
   tar xvfz mafft-*-src.tgz && \
   cd mafft-*.*/core/ && \
   make clean && \
   make && \
   make install && \
   cd ../../

RUN wget https://github.com/bbuchfink/diamond/releases/download/v0.9.22/diamond-linux64.tar.gz && \
    tar xvfz diamond-linux64.tar.gz && \
    cp diamond /usr/local/bin

RUN wget https://github.com/soedinglab/MMseqs2/releases/download/3-be8f6/MMseqs2-Linux-AVX2.tar.gz && \
    tar xzf MMseqs2-Linux-AVX2.tar.gz && \
    cp mmseqs2/bin/mmseqs /usr/local/bin

RUN wget https://github.com/amkozlov/raxml-ng/releases/download/0.7.0/raxml-ng_v0.7.0_linux_x86_64.zip && \
    unzip raxml-ng_v0.7.0_linux_x86_64.zip && \
    cp raxml-ng /usr/local/bin

RUN wget https://github.com/Cibiv/IQ-TREE/releases/download/v1.7-beta6/iqtree-1.7-beta6-Linux.tar.gz && \
   tar xvf iqtree-1.7-beta6-Linux.tar.gz && \
   cp iqtree-1.7-beta6-Linux/bin/iqtree /usr/local/bin

RUN git clone https://github.com/photocyte/OrthoFinder.git

RUN ls -ltr /usr/local/bin

#RUN git clone https://gite.lirmm.fr/atgc/FastME.git && \
#    cd FastME && \
#    ./configure && \
#    make && \
#    make install
        
RUN mkdir /home/working/
RUN mkdir /home/working/20181113_peptide_files/
