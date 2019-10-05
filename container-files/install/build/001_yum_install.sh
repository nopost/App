#!/bin/bash
#mkdir -p /var/run/sshd && \
#yum update -y && \
yum install -y \
    iproute \
    python-setuptools \
    hostname \
    inotify-tools \
    yum-utils \
    which \
    wget \
    net-tool \
    jq \
    openssh-server \
    openssh-clients \
    rsync
