#!/bin/bash -e

# youtube_sub.sh <ID> <LANG> <FORMAT>

source youtube_rc

if [ "$#" -eq 1 ]; then

  $Y --list-subs "$1"

# elif [ "$#" -eq 2 ]; then

#   $Y --skip-download --sub-format "$2" "$1"

elif [ "$#" -eq 3 ]; then

  $Y --skip-download --write-sub --sub-format "$3" --sub-lang "$2" "$1"

  ffmpeg -i "$1.$2.$3" "$1.lrc"

  # rm -v "$1.$2.$3"

fi
