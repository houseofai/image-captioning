#!/bin/sh

apt update

apt install -y git python3-pip #wget

#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#bash Miniconda3-latest-Linux-x86_64.sh

git clone https://github.com/houseofai/image-captioning.git
cd image-captioning

pip install -r requirements.txt
