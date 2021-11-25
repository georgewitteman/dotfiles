FROM alpine:latest

# https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/common-alpine.sh
# Make sure to install everything here. Using --no-cache makes apk download the
# index every time, so running it multiple times will just waste time/bandwidth
RUN apk --update add \
      autoconf \
      automake \
      bash \
      build-base \
      bzip2-dev \
      ctags \
      curl \
      gcc \
      git \
      less \
      libffi-dev \
      libxml2-dev \
      libxslt-dev \
      man-pages \
      mandoc \
      nasm \
      ncurses \
      openssh \
      openssl-dev \
      readline-dev \
      starship \
      sudo \
      tree \
      vim \
      zlib-dev \
      zsh

ARG USER=dev
ENV HOME /home/$USER

RUN addgroup -S $USER \
      && adduser -s /bin/zsh -S $USER -G $USER \
      && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
      && chmod 0440 /etc/sudoers.d/$USER

USER $USER

RUN mkdir -p $HOME/workspace && chown $USER:$USER $HOME/workspace
RUN mkdir -p $HOME/.pyenv/versions && chown $USER:$USER $HOME/.pyenv/versions

# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

COPY --chown=$USER:$USER . $HOME/.local/share/chezmoi
# TODO: Switch to using apk for chezmoi once it has a version where
# .chezmoi.executable works
RUN $HOME/.local/share/chezmoi/install.sh && rm -rf $HOME/.local/share/chezmoi/.git

WORKDIR $HOME/workspace
CMD /bin/zsh -li
# CMD /bin/sh -c "while sleep 1000; do :; done"
