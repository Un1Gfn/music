#!/dev/null
## shellcheck --shell=bash youtube.bash_aliases
# source ./youtube.bash_aliases

unalias youtube-dl 2>/dev/null
alias youtube-dl='youtube-dl --proxy socks5://127.0.0.1:1080/ --force-ipv4'

TEMPLATE='%(id)s.%(ext)s'

SEP='^'

function sub {
  if [ "$#" -eq 1 ]; then
    youtube-dl --list-subs -- "$1"
  # elif [ "$#" -eq 2 ]; then
  #   Y --skip-download --sub-format "$2" "$1"
  elif [ "$#" -eq 3 ]; then
    youtube-dl --output "$TEMPLATE" --skip-download --write-sub --sub-format "$3" --sub-lang "$2" -- "$1"
    ffmpeg -i "$1.$2.$3" -- "$1.lrc"
    # rm -v "$1.$2.$3"
  else
    echo
    echo "  ${FUNCNAME[0]} <ID> <LANG> <FORMAT>"
    echo
  fi
}

function sync {
  echo
  adb devices
  echo
  if [ "$#" -ne 0 ]; then
    for i in "$@"; do
      adb push -- "$i" /sdcard/Music/
    done
  else
    echo -n "Remove all audios from Android, "
    confirm
    adb shell rm -v -- /sdcard/Music/\*
    echo
    adb push -- *.lrc *.m4a *.opus /sdcard/Music/
  fi
  echo
  echo "Please Scan again in Musicolet"
  echo
}

# https://unix.stackexchange.com/questions/479266/adding-metadata-to-opus-file-from-command-line
# ffmpeg -i "$WEBM" -vn -acodec copy "$OPUS"
function conv {
  if [ "$#" -lt 1 ] || [ "$#" -gt 4 ]; then
    echo
    echo "  ${FUNCNAME[0]} <FROM> <TO> [TITLE [ARTIST]]"
    echo
    return
  fi
  TMP="$(uuidgen)+$2"
  ffmpeg -i "$1" -vn -acodec copy -metadata title="$3" -metadata artist="$4" -- "$TMP"
  mv -v -- "$TMP" "$2"
  realpath -- "$2"
}

function download_convert {
  test "$#" -eq 3 || return
  youtube-dl --output "$TEMPLATE" -f bestaudio -- "$1"
  WEBM="$1.webm"
  OPUS="$1.opus"
  M4A="$1.m4a"
  if [ -f "$WEBM" ]; then
    conv "$WEBM" "$OPUS" "$2" "$3"
  elif [ -f "$M4A" ]; then
    TMP="$(uuidgen)"
    conv "$M4A" "$M4A" "$2" "$3"
  else
    echo "unsupported audio container"
    return
  fi
}

function confirm {
  echo -n "OK? "
  read -r
}

function aud_loopbody {
  test "$#" -eq 0 || return 1
  OUTPUT="$(zenity \
    --forms \
    --title='Audio from YouTube' \
    --window-icon=question \
    --add-entry="ID" \
    --add-entry="TITLE" \
    --add-entry="ARTIST" \
    --text="character '$SEP' not allowed in any field" \
    --separator="$SEP" \
  )"
  R="$?"
  test "$R" -eq 0 || return 1
  ID="$(awk -F "$SEP" '{print $1}' <<<"$OUTPUT")"
  TITLE="$(awk -F "$SEP" '{print $2}' <<<"$OUTPUT")"
  ARTIST="$(awk -F "$SEP" '{print $3}' <<<"$OUTPUT")"
  echo "ID=$ID"
  echo "TITLE=$TITLE"
  echo "ARTIST=$ARTIST"
  confirm
  download_convert "$ID" "$TITLE" "$ARTIST"
}

function aud {
  while true; do
    aud_loopbody
    test "$?" -eq 0 || return
  done
}
