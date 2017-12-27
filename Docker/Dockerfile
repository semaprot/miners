ROM hypriot/rpi-node:latest

MAINTAINER pkulakovsky@gmail.com

RUN git clone https://github.com/semaprot/miners.git \
  && cd miners \
  && npm install \
  && chmod 0700 reboot-miner.sh

CMD reboot-miner.sh
