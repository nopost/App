FROM centos:7.5.1804
MAINTAINER Nopost (nopost@qq.com)

# - Install basic packages (e.g. python-setuptools is required to have python's easy_install)
# - Install yum-utils so we have yum-config-manager tool available
# - Install inotify, needed to automate daemon restarts after config file changes
# - Install jq, small library for handling JSON files/api from CLI
# - Install supervisord (via python's easy_install - as it has the newest 3.x version)
# - Install rsync

RUN \
  mkdir -p /var/run/sshd && \
  yum update -y && \
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
                  openssh-server  \ 
                  openssh-clients \
                  rsync && \
  yum clean all && \
  easy_install supervisor && \
  ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
  ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
  ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
  ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \  
  sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd && \ 
  mkdir -p /root/.ssh && \  
  chown root.root /root && \  
  chmod 700 /root/.ssh && \    
  echo 'root:nopost' | chpasswd  && \    
  mkdir -p /www/letsencrypt  && \  
  ln -s /www/letsencrypt /etc/letsencrypt && \  
  rm -f /etc/init.d && \  
  mkdir /www/init.d && \  
  ln -s /www/init.d /etc/init.d && \ 
  cd /home && \  
  wget -O install.sh http://download.bt.cn/install/install_6.0.sh  && \  
  echo y | bash install.sh && \
  cd /www/server/panel && \ 
     bash ./install/install_soft.sh 1 install nginx 1.15 && \ 
     bash ./install/install_soft.sh 1 install php 7.3 && \ 
  echo '["linuxsys", "nginx", "php-7.3"]' > ./config/index.json 
  
# Add supervisord conf, bootstrap.sh files
COPY container-files /
EXPOSE 22 9001 8888 888 21 20 443 80 3456 2345
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
ENTRYPOINT ["/config/bootstrap.sh"]
