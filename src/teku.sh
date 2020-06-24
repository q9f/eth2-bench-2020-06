#!/usr/bin/env bash

while true
do
  teku --config-file="/home/user/witti/teku/config.yaml" \
    --network="/home/user/witti/teku/chain.yaml" &> /home/user/witti/teku.log
  sleep 10
done
