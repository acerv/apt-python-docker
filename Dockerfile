FROM ubuntu:18.04

LABEL MAINTAINER="Andrea Cervesato <andrea.cervesato@mailbox.org>"

ENV DEBIAN_FRONTEND noninteractive

ENV GPG_KEY F23C5A6CF475977595C89F51BA6932366A755776

RUN apt-get update && apt-get install --no-install-recommends -y \
      gnupg \
    && echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu bionic main" > \
      /etc/apt/sources.list.d/python.list \
    && echo "deb-src http://ppa.launchpad.net/deadsnakes/ppa/ubuntu bionic main" >> \
      /etc/apt/sources.list.d/python.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${GPG_KEY} \
    && apt-get purge -y --auto-remove gnupg \
    && rm -rf /var/lib/apt/lists/*
