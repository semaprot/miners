#!/bin/bash

ls /home/tftp/pxelinux.cfg/ | grep ^01 | awk -F '01-' '{system("cat /home/tftp/pxelinux.cfg/"$0" | grep 'cloud-'"); gsub("-",":",$2); system("cat /var/lib/misc/dnsmasq.leases | grep "$2); print "\n"}' > minersList

OUTPUT="$(/usr/local/bin/node /miners/index.js)"
echo "${OUTPUT}"
