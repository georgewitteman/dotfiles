FROM alpine:latest

# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/common-alpine.sh
# Make sure to install everything here. Using --no-cache makes apk download the
# index every time, so running it multiple times will just waste time/bandwidth
RUN apk --update --upgrade add \
      alpine-sdk \
      autoconf \
      automake \
      bash \
      build-base \
      bzip2-dev \
      ctags \
      curl \
      gcc \
      git \
      gnupg \
      less \
      libffi-dev \
      libxml2-dev \
      libxslt-dev \
      man-pages \
      mandoc \
      nasm \
      ncurses \
      openssh-client \
      openssl-dev \
      readline-dev \
      rustup \
      starship \
      sudo \
      tree \
      vim \
      zlib-dev \
      zsh \
      && echo "Finished installing packages!"

ARG USER=dev
ENV HOME /home/$USER

RUN addgroup -S $USER \
      && adduser -s /bin/zsh -S $USER -G $USER \
      && addgroup $USER abuild \
      && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
      && chmod 0440 /etc/sudoers.d/$USER \
      && mkdir -p /var/cache/distfiles \
      && chgrp abuild /var/cache/distfiles \
      && chmod g+w /var/cache/distfiles

USER $USER

RUN rustup-init -y --no-modify-path

RUN mkdir -p $HOME/workspace && chown $USER:$USER $HOME/workspace
RUN mkdir -p $HOME/.pyenv/versions && chown $USER:$USER $HOME/.pyenv/versions
RUN mkdir -p $HOME/.cargo/bin && chown $USER:$USER $HOME/.cargo/bin
RUN mkdir -p $HOME/.cargo/registry/index && chown $USER:$USER $HOME/.cargo/registry/index
RUN mkdir -p $HOME/.cargo/registry/cache && chown $USER:$USER $HOME/.cargo/registry/cache
RUN mkdir -p $HOME/.cargo/git/db && chown $USER:$USER $HOME/.cargo/git/db

COPY --chown=$USER:$USER . $HOME/.local/share/chezmoi
# TODO: Switch to using apk for chezmoi once it has a version where
# .chezmoi.executable works
RUN $HOME/.local/share/chezmoi/install.sh && rm -rf $HOME/.local/share/chezmoi/.git

WORKDIR $HOME/workspace
CMD /bin/zsh -li
# CMD /bin/sh -c "while sleep 1000; do :; done"
