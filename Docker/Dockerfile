FROM hypriot/rpi-node:latest

MAINTAINER pkulakovsky@gmail.com

RUN apt-get update \
  && apt-get -y install cron \
  && (crontab -l ; echo "*/5 * * * * /miners/reboot-miner.sh") | sort - | uniq - | crontab - \
  && git clone https://github.com/semaprot/miners.git \
  && cd miners \
  && npm install \
  && chmod 0700 reboot-miner.sh

CMD /miners/reboot-miner.sh
