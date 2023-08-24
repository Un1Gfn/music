#!/bin/bash

# ly.script.1234567.cdefgab.txt

{

  SED=(

    sed

    -E

    -e 's_([0-9])_ \1_g'

    # -e 's_([0-9~}{|])\|_\1 |_g'

    -e 's_([0-9~}{|])\|_\1 |_g'
    -e 's_([0-9~}{|])\}_\1 }_g'
    -e 's_([0-9~}{|])\{_\1 {_g'

    -e 's_1_c_g'
    -e 's_2_d_g'
    -e 's_3_e_g'
    -e 's_4_f_g'
    -e 's_5_g_g'
    -e 's_6_a_g'
    -e 's_7_b_g'
    -e 's_8_c_g'
    -e 's_0_r_g'

    # remove trailing whitespace
    -e 's_\s+$__g'

  )

  echo

  cat "$1" \
    | "${SED[@]}" \
    | paste -d'\n' - /dev/null
    # | tr -s " " \
  echo
  echo

}; exit
