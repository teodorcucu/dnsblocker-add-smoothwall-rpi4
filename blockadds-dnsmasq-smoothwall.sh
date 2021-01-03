#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

echo -e "${RED}Download DNSMasq Blacklist from GitHub${NOCOLOR}"
curl -SLso /etc/dnsmasq.blacklist.txt https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnsmasq/dnsmasq.blacklist.txt
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "conf-file=/etc/dnsmasq.blacklist.txt" >> /etc/dnsmasq.conf
echo -e "listen-address=::1,127.0.0.1,-IP-interface1,-IP-interface2" >> /etc/dnsmasq.conf
echo -e "interface=-ENTER HERE GREEN INTERFACE- For example eth1" >> /etc/dnsmasq.conf
echo -e "interface=-ENTER HERE PURPLE(WIFI) INTERFACE- For example eth2-" >> /etc/dnsmasq.conf
echo -e "server=8.8.8.8" >> /etc/dnsmasq.conf
echo -e "server=8.8.4.4" >> /etc/dnsmasq.conf

nano /etc/dnsmasq.conf

echo -e "${RED}Add. Google DNS to /etc/resolv.conf${NOCOLOR}"
echo -e "nameserver 8.8.8.8" >> /etc/resolv.conf
echo -e "nameserver 8.8.4.4" >> /etc/resolv.conf
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e >> /etc/resolv.conf

echo -e "#ADD HERE THE LISTENADRESSES FROM /etc/dnsmasq.conf like above up" >> /etc/resolv.conf
nano /etc/resolv.conf

echo -e "${RED}Kill dnsmasq${NOCOLOR}"
killall dnsmasq
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Start dnsmasq${NOCOLOR}"
dnsmasq
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e


