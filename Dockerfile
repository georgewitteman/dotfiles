# FROM gitpod/workspace-base
FROM ubuntu:latest

RUN set -xe \
    && apt-get update \
    && apt-get install -y \
    apt-utils \
    locales

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN yes | unminimize && \
    apt-get update \
    && apt-get install -y \
    bash-completion \
    curl \
    git \
    sudo

### Gitpod user ###
# '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV HOME=/home/gitpod
WORKDIR $HOME
# custom Bash prompt
RUN { echo && echo "PS1='\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" (%s)\") $ '" ; } >> .bashrc
