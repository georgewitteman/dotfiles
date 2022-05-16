# hadolint ignore=DL3007
FROM gitpod/workspace-full:latest

USER root
RUN sudo apt-get update && sudo apt-get install --yes neovim

USER gitpod
