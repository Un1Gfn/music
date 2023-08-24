# https://trac.ffmpeg.org/wiki/Seeking

[ 2 = "$#" ] || {
  echo "$0 <in.txt> <full.m4a>"
  exit 1
}

TXT="$1"
M4A="$2"

# [03:45 jxsnzk]
SSp="-1:-1"
TOp="00:00"
grep -o -E -e '^<[0-9][0-9]:[0-9][0-9] [a-z]{6}>' "$TXT" | tr -d '<>' | {
  read -r i
  set -- $i
  [ "00:00" = "$1" ] || { echo "err '<00:00 ??????>' is mandatory"; exit 1; }
  SSp="$TOp"; TOp="$1"
  NN=1
  while read -r i; do
    set -- $i
    SSp="$TOp"; TOp="$1"
    CMD=(/usr/bin/ffmpeg -y -i "$M4A" -ss "$SSp" -to "$TOp" -c copy "$(printf %02d "$NN")".$2.m4a)
    # echo "${CMD[*]}"
    "${CMD[@]}"
    ((NN=NN+1))
  done
  CMD=(/usr/bin/ffmpeg -y -i "$M4A" -ss "$1" -c copy "$(printf %02d "$NN")".$2.m4a)
  # echo "${CMD[*]}"
  "${CMD[@]}"
}
