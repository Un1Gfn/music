#!/bin/bash -e

# youtube_audio.sh <ID>

source youtube_rc

test "$#" -eq 1

$Y -f bestaudio "$1"

WEBM="$1.webm"
OPUS="$1.opus"

M4A="$1.m4a"

if [ -f "$WEBM" ]; then
  # https://unix.stackexchange.com/questions/479266/adding-metadata-to-opus-file-from-command-line
  # ffmpeg -i *.webm -vn -acodec copy -metadata title="TiTlE" -metadata artist="ArTiSt" "FiLe.opus"
  ffmpeg -i "$WEBM" -vn -acodec copy "$OPUS"
  rm -v "$WEBM"
  realpath "$OPUS"
elif [ -f "$M4A" ]; then
  realpath "$M4A"
else
  echo "unsupported audio container"
  /bin/false
fi

