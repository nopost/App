FROM centos:7.5.1804
MAINTAINER Nopost (nopost@qq.com)
COPY container-files /
# - Install basic packages (e.g. python-setuptools is required to have python's easy_install)
# - Install yum-utils so we have yum-config-manager tool available
# - Install inotify, needed to automate daemon restarts after config file changes
# - Install jq, small library for handling JSON files/api from CLI
# - Install supervisord (via python's easy_install - as it has the newest 3.x version)
# - Install rsync

RUN cd /install && \
    ./docker_build.sh    
EXPOSE 22 9001 8888 888 21 20 443 80 3456 2345 9000 9001 
ENTRYPOINT ["/config/bootstrap.sh"]
