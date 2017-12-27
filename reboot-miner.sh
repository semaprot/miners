#!/bin/bash

/bin/echo '' > ~/.ssh/known_hosts
/bin/echo '' > /reboot.log

/bin/ls /home/tftp/pxelinux.cfg/ | /bin/grep ^01 | /usr/bin/awk -F '01-' '{system("/bin/cat /home/tftp/pxelinux.cfg/"$0" | /bin/grep 'cloud-'"); gsub("-",":",$2); system("/bin/cat /var/lib/misc/dnsmasq.leases | /bin/grep "$2); print "\n"}' > minersList

/usr/local/bin/node /miners/index.js | /usr/bin/awk -F '\n' '{system("/usr/bin/ssh -oStrictHostKeyChecking=no rancher@"$0" sudo reboot")}' >> /reboot.log
