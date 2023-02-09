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
function cutid {
  cut -d'.' -f1
}

# t.tw -> s
# t.hk -> s
function sc {
  opencc -c /usr/share/opencc/t2s.json
}

{

  cd /home/darren/music/ly.scores.d

  if [ "-h" = "$1" ]; then
    help
  elif ((0=="$#")); then
    ls -1A | awk '{ print length, $0 }' | sort -n -s -r | cut -d ' ' -f 2-
  else
    echo
    while ((1<="$#")); do
      K="$(sc <<<"$1")"
      echo "? $K"
      ls -1A | grep -F -f <(ls -1A | sc | grep "$K" | cutid)
      echo
      shift
    done
  fi

}


