#!/bin/bash
set -e
#This script add the server to known host
for SERVER in $(egrep -v '(^#|^\s*$|^\s*\t*#)' _scripts/server_list.txt)
do
  echo $SERVER
  ssh-keyscan -H $SERVER 2>&1 | sort -u - ~/.ssh/known_hosts > ~/.ssh/tmp_hosts && mv ~/.ssh/tmp_hosts ~/.ssh/known_hosts
done
