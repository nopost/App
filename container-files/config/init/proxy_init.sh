#!/bin/bash
#profile_proxy
if [ -z "$HTTP_PROXY" ]; then
  export http_proxy="$HTTP_PROXY"
  export https_proxy="$HTTP_PROXY"
fi
