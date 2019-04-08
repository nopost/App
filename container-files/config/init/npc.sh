#!/bin/bash

#1.下载NPC

#2.更新Npc权限

#3.更新supervisor配置
chmod +x /config/npc/npc
cat >> etc/supervisord.d/npc.conf <<EOF
[program:npc]
user=root
command=/config/npc/npc 
process_name=npc
stdout_logfile=/var/log/npc.stdout.log
stderr_logfile=/var/log/npc.stderr.log
autorestart=true
autostart=true
EOF

#4.supervisor重载
supervisorctl update



