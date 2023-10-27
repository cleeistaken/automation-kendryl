#! /bin/bash
printf '{"ip":"%s"}' "`ip -o -4 address list | grep ens | awk '{print ($4)}' | cut -d/ -f1 | head -1`"