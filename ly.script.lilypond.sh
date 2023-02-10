#!/bin/bash

CMD=(
  /usr/bin/lilypond
  # -e '(define-public clgtqs "Microsoft YaHei")'
  # -e '(define-public clgtqs "Source Han Sans TW")'
  -e '(define-public clgtqs "Noto Sans CJK TC")'
  -e '(define-public tthzwk -1)'
)

exec "${CMD[@]}" "$@"
