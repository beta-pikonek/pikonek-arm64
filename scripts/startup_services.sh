#!/usr/bin/env bash

. /etc/pikonek/configs/pikonekInit.cfg

main() {
  # stop services
  if [ "$mosquitto" = "True" ]; then
    killall mosquitto || true
    /bin/systemctl start mosquitto
  else
   killall mosquitto || true
  fi

  if [ "$pppoe" = "True" ]; then
    killall pppoe-server || true
    killall pppd || true
    /usr/local/bin/pikonek -a --pppoestart || true
  else
    killall pppoe-server || true
    killall pppd || true
  fi

  if [ "$sqm" = "True" ]; then
    /usr/bin/sqm stop || true
    /usr/bin/sqm start || true
  else
    /usr/bin/sqm stop || true
  fi
}

main
