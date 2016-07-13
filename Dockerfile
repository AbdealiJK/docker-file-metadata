FROM ubuntu:14.04
MAINTAINER DrTrigon <dr.trigon@surfeu.ch>

# LABEL author.user1="Abdeali JK <abdealikothari@gmail.com>" \
#       author.user2="DrTrigon <dr.trigon@surfeu.ch>"

# Initial update
RUN apt-get -y update

# Basic packages
RUN apt-get install -y \
  build-essential \
  make \
  git \
  htop \
  vim \
  wget

# Packages for setup
RUN apt-get install -y pkg-config

# ExifTool
RUN apt-get install -y exiftool

# Numpy, Scipy
RUN apt-get install -y gfortran libblas-dev libfreetype6-dev libjpeg-dev liblapack-dev libpng12-dev python-dev

# Scikit Image, Pillow
RUN apt-get install -y libtiff5-dev python-dev

# OpenCV
RUN apt-get install -y python-opencv

# Image Magick / wand
RUN apt-get install -y libmagickwand-dev python-dev

# avprobe / ffprobe
RUN apt-get install -y libav-tools

# ZXing
RUN apt-get install -y openjdk-7-jre

# Dlib
RUN apt-get install -y cmake libboost-python-dev python-dev

# ZBar
RUN apt-get install -y libzbar-dev python-dev

# Pip - install latest version so that wheels are used
#RUN wget https://bootstrap.pypa.io/get-pip.py && \
#  python get-pip.py
RUN apt-get install -y python-pip && \
  pip install -U pip

# Add the repository
RUN git clone https://github.com/AbdealiJK/file-metadata.git /opt/file-metadata

# Test requirements
RUN pip install -r /opt/file-metadata/test-requirements.txt

# Install package
RUN pip install /opt/file-metadata --upgrade

# Test file-metadata import
RUN python -c'import file_metadata; print(file_metadata.__version__)'
