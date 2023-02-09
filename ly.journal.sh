#!/bin/bash

{

  cd ~/music/ly.scores.d || { echo err q9ko1y; exit 1; }

  echo

  LS="$(ls -A1 | sort)"
  JN="$(cat ../ly.journal.txt | grep -v -E -e '^$' -e '^\[[0-9]{8}\]$' | sort | uniq)"

  # echo "[ls]     "; echo "$LS"; echo
  # echo "[journal]"; echo "$JN"; echo

                            comm -1 -2 -3 --check-order <(echo "$LS") <(echo "$JN");
  echo "[only in ls]     "; comm    -2 -3               <(echo "$LS") <(echo "$JN"); echo
  echo "[only in journal]"; comm -1    -3               <(echo "$LS") <(echo "$JN"); echo
  echo "[both]           "; comm -1 -2                  <(echo "$LS") <(echo "$JN"); echo
                            comm -1 -2 -3 --total       <(echo "$LS") <(echo "$JN"); echo

}
