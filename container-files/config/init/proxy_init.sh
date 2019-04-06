#!/bin/bash
#profile_proxy
all_proxy="all_proxy=socks://192.168.2.250:1080"
ftp_proxy="ftp_proxy=http://192.168.2.250:3128"
http_proxy="http_proxy=http://192.168.2.250:3128"
https_proxy="https_proxy=http://192.168.2.250:3128"
no_proxy="no_proxy=localhost,127.0.0.0/8,::1,.xxx.intra" 
for var in "$all_proxy" "$ftp_proxy" "$http_proxy" "$https_proxy" "$no_proxy";do
      echo $var >> /etc/profile
done 

for var in "all_proxy" "ftp_proxy" "http_proxy" "https_proxy" "no_proxy";do
      echo "export $var" >> /etc/profile
done
source /etc/profile
