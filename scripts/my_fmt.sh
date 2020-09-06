#!/bin/bash

while getopts "hw:" opt; do
   case $opt in
      h ) hyph=1           ;;
      w ) width="$OPTARG"  ;;
   esac
done

shift $(($OPTARG - 1))

nroff << EOF
.ll ${width:-72}
.na
.hy ${hyph:-0}
.pl 1
$(cat "$@")
EOF

exit 0
