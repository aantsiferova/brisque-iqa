FROM nvcr.io/nvidia/pytorch:22.08-py3

WORKDIR /

ARG UNAME=testuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -qqy gcc wget git dos2unix libgl1 libglib2.0-0 

RUN pip install scikit-learn==1.3.2 scikit-image==0.21.0 libsvm==3.23.0.4