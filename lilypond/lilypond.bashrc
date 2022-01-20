#!/dev/null

: <<"END_OF_MULTILINE_COMMENT"

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

END_OF_MULTILINE_COMMENT

function help2 {
  local FARR=(help2 clean play ly{,entr})
  echo "${FARR[@]/%/()}"
}

function clean {
  ((0==$#)) || return 1
  rm -fv -- *.ly.midi *.ly.pdf
}

# .ly -> speaker
function play {

  # aplay -t wav "$WAV"

  ((1==$#)) || return 1
  echo

  # local RT=44100
  local SFARR=(
    # community
    # "/usr/share/soundfonts/freepats-general-midi.sf2"
    # "/usr/share/soundfonts/FluidR3_GM.sf2"
    # "/usr/share/soundfonts/FluidR3_GS.sf2"
    # AUR
    "/usr/share/soundfonts/Unison.sf2"
    "/usr/share/soundfonts/GeneralUser.sf2"
    "/usr/share/soundfonts/Arachno.sf2"
  )

  SF="${SFARR[$((RANDOM%${#SFARR[@]}))]}"
  printf ": using soundbank \e[32m%s\e[0m\n" "$SF"
  echo

  alacritty.sh "${FUNCNAME[0]}()"

  # /etc/timidity/timidity.cfg
  timidity -c <(echo "soundfont $SF") "$1.ly.midi"
  echo

}

# .ly -> .midi
function ly {

  local LY="./$1.ly"

  local MIDI="./$1.ly.midi"
  local PDF="./$1.ly.pdf"
  local PDF_L="/tmp/un1gfn.github.io/current_sheet.pdf"

  local WAV="/tmp/$1.wav"
  # local WAV="/tmp/$1.$(uuidgen).wav" # Random name so that mpv can't remember

  { [ 1 -eq $# ] && [ -f "$LY" ]; } || return 1
  echo

  # Don't remove $PDF - avoid deadlink current_sheet.pdf
  # Do remove $WAV - write to new inode instead of overwriting - avoid [ffmpeg/demuxer] wav: Packet corrupt (stream = 0, dts = NOPTS).
  # https://stackoverflow.com/q/3141738/duplicating-stdout-to-stderr
  [ -n "$(rm -fv "$MIDI" "$PDF_L" "$WAV" | tee >(cat 1>&2) )" ] && echo

  printf "\e[32m%s\e[0m\n" "[$(date +%T)]"

  lilypond --pdf -o "$LY" "$LY" || return 2
  echo
  ln -sfv "$(realpath "$PDF")" "$PDF_L"
  file "$PDF_L"
  echo

}

function lyentr {
  printf "\e]0;%s\a" "${FUNCNAME[0]}()"
  { [ 1 -eq $# ] && [ -f "$1.ly" ]; } || return 3
  entr <<<"$1.ly" -s "ly $1"
}

function _comp {
  # echo "${COMP_CWORDS[*]}"
  # echo "${COMP_CWORDS[@]}"

  local _A=()
  if shopt -s | grep nullglob; then
    _A=(*.ly)
  else
    shopt -s nullglob
    _A=(*.ly)
    shopt -u nullglob
  fi

  _A=( "${_A[@]%.*}" )
  # echo "${_A[*]}"

  if [ 1 -eq "$COMP_CWORD" ]; then

    COMPREPLY=()

    # COMPREPLY=( $(compgen -W "${_A[*]}" -- "${COMP_WORDS[COMP_CWORD]}") )

    # sha1sum <<<"$(compgen -W "${_A[*]}" -- "${COMP_WORDS[COMP_CWORD]}")"
    mapfile -t COMPREPLY <<<"$(compgen -W "${_A[*]}" -- "${COMP_WORDS[COMP_CWORD]}")"

    # Doesn't work
    # compgen -W "${_A[*]}" -- "${COMP_WORDS[COMP_CWORD]}" | sha1sum
    # compgen -W "${_A[*]}" -- "${COMP_WORDS[COMP_CWORD]}" | mapfile -t COMPREPLY

  fi

}

{

  complete -F _comp play
  complete -F _comp ly
  complete -F _comp lyentr

  # For "entr -s"
  # https://unix.stackexchange.com/questions/572747/make-entr-execute-a-locally-defined-shell-function
  export -f ly
  export -f play

  cd /home/darren/music/lilypond || printf "\nerr\n\n"

}
