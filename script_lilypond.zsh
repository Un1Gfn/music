#!/bin/zsh -x

CMD=(

  /opt/homebrew/bin/lilypond

  # -e '(define-public clgtqs "Microsoft YaHei")'
  # -e '(define-public clgtqs "Source Han Sans TW")'
  # -e '(define-public clgtqs "Noto Sans CJK TC")'

  # -e '(define-public tthzwk -1)'

  # -e '(define udwnlj "/home/darren/music/ly.preamble.ly")'

)

exec $CMD[@] $@
