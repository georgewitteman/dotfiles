# FROM gitpod/workspace-base
FROM ubuntu:latest

# Never interact: https://askubuntu.com/a/972528
ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe \
    && apt-get update \
    && apt-get install -y \
    apt-utils \
    locales

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN yes | unminimize && \
      apt-get update && \
      apt-get install -y curl sudo git && \
      apt-get clean -y && \
      rm -rf  /var/cache/debconf/*  /var/lib/apt/lists/*  /tmp/*  /var/tmp/*

# https://github.com/gitpod-io/workspace-images/blob/master/base/Dockerfile
### Gitpod user ###
# '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV HOME=/home/gitpod
WORKDIR $HOME
