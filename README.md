#! /bin/bash
#rm -rf working
#mkdir working
docker build -t orthofinder_docker .
#cd working
#wget https://github.com/photocyte/PPYR_OGS/raw/master/PPYR_OGS1.1.pep.fa.gz
#wget https://github.com/photocyte/ILUMI_OGS/raw/master/ILUMI_OGS1.2.pep.fa.gz
#gunzip ./*
#cd ..
docker run -it --mount type=bind,source="$(pwd)"/working,target=/home/working/20181113_peptide_files/ -w /home/working/20181113_peptide_files/ orthofinder_docker python2 /usr/src/OrthoFinder/orthofinder/orthofinder.py -f . -t 4 -S blast -M msa -A kalign -T iqtree

