# entr <<<gen.txt bash gen.txt

D=/tmp/l9h9hz
Z=20230211.zip

A=/home/darren/music/ly.scores.d
B=/home/darren/bible/scores.img.d

X=(
  n4js9z.順服
  iykmv4.回家
)

A=("${X[@]/#/"$A/"}")
B=("${X[@]/#/"$B/"}")

gen_clean() {

  echo ...
  rm -fv ./*.pdf ./"$Z"
  find . -maxdepth 1 -type l -name '*.m4a' -delete
  echo ...
  echo

  ls -Al
  echo

  for i in "${A[@]}"; do
    make -C "$i" clean
    echo
  done  

}

gen_ly_make() {

  /usr/bin/parallel -V
  echo -n "..."
  # printf "%s\n" "${A[@]}" | /usr/bin/parallel "cd {} && pwd"
  printf "%s\n" "${A[@]}" | /usr/bin/parallel "echo; make -C {} m4a"
  echo

}

# gen_pdf_view() {
#   for i in "${A[@]}"; do
#     file "$i"/*.pdf
#     ( /usr/bin/atril "$i"/*.pdf &>/dev/null & )
#   done
# }

gen_pdf_2up() {
  local IN="$1"
  local OUT="$2"
  local PAPER="$3"
  pdfjam --outfile "$OUT" --landscape --paper "$PAPER" --nup 2x1 "$IN"
}

gen_pdf_4up() {

  local IN="$1"
  local OUT="$2"

  X_2UP="$(mktemp "/tmp/$1.2up.XXXXXX.pdf")"

  gen_pdf_2up "$1" "$X_2UP" a4paper
  echo

  pdfjam --outfile "$2" --no-landscape --paper a3paper --nup 1x2 "$X_2UP"
  echo

  rm -v "$X_2UP"
  echo

  file "$(realpath "$2")"
  echo

}

# https://en.wikipedia.org/wiki/Numbered_musical_notation
gen_nmn() {

  local CMD=(
    img2pdf
    -o nmn1.pdf
    -D
    -S A4
    # --fit into # ok # default
    # --fit fill # ok
    # --fit shrink # ok
    # --fit enlarge # cropped!
  )
  for i in "${B[@]}"; do
    CMD+=("$i"*)
  done
  echo "${CMD[*]}"
  echo

  # echo "(img2pdf) nmn1.pdf"
  # echo
  "${CMD[@]}"

  gen_pdf_2up nmn1.pdf nmn2.pdf "a3paper"
  echo

  # gen_pdf_4up nmn1.pdf nmn4.pdf

}

# https://en.wikipedia.org/wiki/Staff_(music)
gen_ss() {

  gen_ly_make

  local PDFS=()
  for i in "${A[@]}"; do
    PDFS+=("$i"/*.pdf)
  done
  echo "=> [1/3] concatenate to 1.pdf"
  /usr/bin/pdfunite "${PDFS[@]}" ss1.pdf
  echo

  # gen_pdf_4up ss1.pdf ss4.pdf

}

gen_zip(){

  for i in "${A[@]}"; do
    M4AS+=("$i"/*.m4a)
  done

  local N=0
  for i in "${M4AS[@]}"; do
    ((N=N+1))
    ln -sv "$i" ./"$(printf '%02d.%s' "$N" "$(basename "$i")")"
    # printf "@ %s\n@=%02d.%s\n" "$i" "$N" "$i" 1>&2 | zipnote -w "$Z"
  done
  echo

  # zip -v -j "$Z" *.pdf "${M4AS[@]}"
  zip -v "$Z" ??.*.m4a nmn4.pdf ss4.pdf
  echo

  file "$(realpath "$Z")"
  echo

  unzip -l "$Z"
  echo

}

{

  echo

  [ -e "$D" ] && {
    find "$D" | sort
    echo
    if read -rp "remove ${D}? "; then
      rm -rv "$D"
      echo
    else
      exit
    fi
  }

  { mkdir -pv "$D" && cd "$D"; } || { echo err f7f8b5; exit 1; }

  gen_clean

  # gen_nmn
  gen_ss

  gen_zip

};
2