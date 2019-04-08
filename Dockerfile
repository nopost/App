FROM centos:7.5.1804
MAINTAINER Nopost (nopost@qq.com)
COPY container-files /
RUN cd /install &&  sh ./docker_build.sh
EXPOSE 22 9001 8888 888 21 20 443 80 3456 2345 9000 9001 
ENTRYPOINT ["/config/bootstrap.sh"]
