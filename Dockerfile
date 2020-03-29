FROM ubuntu:18.04

LABEL MAINTAINER="Andrea Cervesato <andrea.cervesato@mailbox.org>"

ENV DEBIAN_FRONTEND noninteractive

ENV PPA_LOC http://ppa.launchpad.net/deadsnakes/ppa/ubuntu

ENV GPG_KEY F23C5A6CF475977595C89F51BA6932366A755776

ENV REPO_PATH /etc/apt/sources.list.d/python.list

RUN apt-get update && apt-get install --no-install-recommends -y \
      gnupg \
    && echo "deb ${PPA_LOC} bionic main" > ${REPO_PATH} \
    && echo "deb-src ${PPA_LOC} bionic main" >> ${REPO_PATH} \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${GPG_KEY} \
    && apt-get purge -y --auto-remove \
      gnupg \
    && rm -rf /var/lib/apt/lists/*
