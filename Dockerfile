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
      apt-get install -y curl && \
      apt-get clean -y && \
      rm -rf  /var/cache/debconf/*  /var/lib/apt/lists/*  /tmp/*  /var/tmp/*
