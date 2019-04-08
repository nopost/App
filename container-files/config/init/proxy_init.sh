#!/bin/bash
#profile_proxy


export all_proxy="socks://192.168.2.250:1080"
export ftp_proxy="http://192.168.2.250:3128"
export http_proxy="http://192.168.2.250:3128"
export https_proxy="http://192.168.2.250:3128"
export no_proxy="localhost,127.0.0.0/8,::1,.xxx.intra" 
