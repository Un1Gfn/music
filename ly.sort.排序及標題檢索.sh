#!/bin/bash

# https://stackoverflow.com/questions/5917576/sort-a-text-file-by-line-length-including-spaces/

function help {
  echo
  echo "  $0"
  echo "  $0 -h"
  echo "  $0 SEARCHKEY1 [SEARCHKEY2]..."
  echo
  exit 1
}

# stdin ??????.xxx -> stdout ??????
function id_only {
  cut -d'.' -f2
}

# t.tw -> s
# t.hk -> s
function tc2sc {
  opencc -c /usr/share/opencc/t2s.json
}

function strip_timestamp_prefix {
  cut -d '.' -f 2-
}

function prepend_length {
  # awk '{ print length, $0 }'
  awk -F, -v OFS=' ' '{ print length-7, $0 }'
}

function strip_length {
  cut -d '.' -f 2-
}

{

  cd /home/darren/music/ly.scores.d

  if [ "-h" = "$1" ]; then
    help
  elif ((0=="$#")); then
    ls -1A | strip_timestamp_prefix | sort -r -t'.' -k2 | prepend_length | sort -rs -n
  else
    echo
    while ((1<="$#")); do
      K="$(tc2sc <<<"$1")"
      echo "? $K"
      ls -1A | grep -F -f <(ls -1A | tc2sc | grep "$K" | id_only)
      echo
      shift
    done
  fi

}; exit
