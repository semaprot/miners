FROM hypriot/rpi-node:latest

MAINTAINER pkulakovsky@gmail.com

RUN apt-get update \
  && apt-get -y install cron \
  && (crontab -l ; echo "*/10 * * * * /miners/reboot-miner.sh") | sort - | uniq - | crontab - \
  && git clone https://github.com/semaprot/miners.git \
  && cd miners \
  && npm install \
  && chmod 0700 reboot-miner.sh

CMD ["/usr/sbin/cron", "-f"]
