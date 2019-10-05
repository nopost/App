#!/bin/bash
#profile_proxy
if [ -z "$HTTP_PROXY" ]; then 
  export proxy="$HTTP_PROXY"
  export http_proxy=$proxy
  export https_proxy=$proxy
  export ftp_proxy=$proxy
  export no_proxy="localhost, 127.0.0.1, ::1"
fi
