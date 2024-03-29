#!/bin/bash
# Limpar todas as regras pré existentes
iptables -F
iptables -t nat -F
iptables -t mangle -F
# A linha abaixo ativa o módulo do netfilter que evita ataques DoS
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
# Liberar portas dos serviços necessários
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A INPUT -p tcp --dport 62354 -j ACCEPT
iptables -A INPUT -p tcp --dport  -j ACCEPT
# A linha abaixo faz o bloqueio de conexões nas demais portas
iptables -A INPUT -p tcp --syn -j DROP
