#!/bin/bash
#profile_proxy
#socks5://gz04:859898918@192.168.2.254:1080
if [ -z "$HTTP_PROXY" ]; then 
  export proxy="$HTTP_PROXY"
  export http_proxy=$proxy
  export https_proxy=$proxy
  export ftp_proxy=$proxy
  export no_proxy="localhost, 127.0.0.1, ::1"
fi
