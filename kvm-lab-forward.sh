#!/bin/bash
sysctl -w net.ipv4.ip_forward=1 > /dev/null
iptables -P FORWARD ACCEPT
iptables -D LIBVIRT_FWI -p tcp --dport 22 -j ACCEPT 2>/dev/null
iptables -t nat -D PREROUTING -p tcp --dport 2222 -j DNAT --to-destination 192.168.122.176:22 2>/dev/null
iptables -t nat -D POSTROUTING -s 192.168.122.0/24 -o wlp0s20f3 -j MASQUERADE 2>/dev/null
iptables -t nat -A PREROUTING -p tcp --dport 2222 -j DNAT --to-destination 192.168.122.176:22
iptables -t nat -A POSTROUTING -s 192.168.122.0/24 -o wlp0s20f3 -j MASQUERADE
iptables -I LIBVIRT_FWI 1 -p tcp --dport 22 -j ACCEPT
