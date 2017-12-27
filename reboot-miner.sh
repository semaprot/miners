#!/bin/bash

ls /home/tftp/pxelinux.cfg/ | grep ^01 | awk -F '01-' '{system("cat /home/tftp/pxelinux.cfg/"$0" | grep 'cloud-'"); gsub("-",":",$2); system("cat /var/lib/misc/dnsmasq.leases | grep "$2); print "\n"}' > minersList

echo '' > ~/.ssh/known_hosts

node index.js | awk -F '\n' '{system("ssh -oStrictHostKeyChecking=no rancher@"$0" sudo reboot")}'
