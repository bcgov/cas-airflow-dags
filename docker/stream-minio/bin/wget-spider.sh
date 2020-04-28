#!/bin/bash
wget -rnd --spider --delete-after --force-html --user "$USER" --password "$PASSWORD" -l "2" "https://nodejs.org/dist/" 2>&1 \
| awk '/^--/ {u=$3} /^HTTP request sent, awaiting response... / {s=$6} /^Length: .*\[(.+)\]$/ {t=$NF} /^$/ {printf "%s\n",u}' | egrep "\.png|\.svg" | sort | uniq
