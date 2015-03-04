

#shell script that sets port 3001 on math.seattleacademy.org to forward to port 3001 on robot 10.48.102.109

#also sets port 3002 on math.seattleacademy.org to forward to port 22 on robot 10.48.102.109, which allows a user to ssh into the robot when not connected to local network







#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A PREROUTING -p tcp -d 172.16.20.199 --dport 3001 -j DNAT --to 10.48.102.109:3001

iptables -t nat -A POSTROUTING -p tcp -d 10.48.102.109 --dport 3001 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp -d 172.16.20.199 --dport 3002 -j DNAT --to 10.48.102.109:22

iptables -t nat -A POSTROUTING -p tcp -d 10.48.102.109 --dport 22 -j MASQUERADE
