ARG FROM_IMAGE
ARG FROM_TAG
FROM ${FROM_IMAGE}:${FROM_TAG}

ARG FROM_IMAGE
ARG FROM_TAG

ENV DEBIAN_FRONTEND=noninteractive

SHELL [ "/bin/bash", "--login", "-e", "-o", "pipefail", "-c" ]

WORKDIR /tmp

RUN apt-get -yq update && apt-get -yq install \
        apt-utils \
        curl \
        git \
        lsb-release \
        rsync \
        sudo \
        wget \
    && rm -rf /var/lib/apt/lists/*
