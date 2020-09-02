#!/bin/sh

## pytorch/pytorch:1.2-cuda10.0-cudnn7-devel

apt update

apt install wget git
apt-get install python3-dev

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh


conda create --name oscar python=3.7
conda activate oscar

# install pytorch1.2
conda install pytorch==1.2.0 torchvision==0.4.0 cudatoolkit=10.0 -c pytorch

export INSTALL_DIR=$PWD

# install apex
cd $INSTALL_DIR
git clone https://github.com/NVIDIA/apex.git
cd apex
#python setup.py install --cuda_ext --cpp_ext
pip install -v --no-cache-dir ./

# install oscar
cd $INSTALL_DIR
#git clone --recursive git@github.com:microsoft/Oscar.git

git clone https://github.com/microsoft/Oscar.git
git clone https://github.com/LuoweiZhou/coco-caption.git
git clone https://github.com/huggingface/transformers.git

cd Oscar/coco_caption
./get_stanford_models.sh
cd ..
python setup.py build develop

# install requirements
pip install -r requirements.txt

unset INSTALL_DIR