#!/bin/bash
SEARCH_DOMAINS=$(ipconfig.exe /all | sed -n 's/\r//;/Search/,/^$/{/^$/q;s/.*://;p}')
CURRENT_IPCONFIG=$(echo search $SEARCH_DOMAINS)
CURRENT_RESOLVCONF=$(grep -w "search" /etc/resolv.conf)
sudo /home/rb/config/clean-resolv-conf.sh
echo $CURRENT_IPCONFIG | sudo /home/rb/config/append-resolv-conf.sh > /dev/null
