#!/dev/null

# cpo_append $1=ASID $2=AMBPM $3=MPTKEY $4=TITLE
cpo_reldb_append() {
  CPO_RELDB_KEYS+=($1)
  CPO_RELDB_FIELD_AMBPM+=([$1]=$2)
  CPO_RELDB_FIELD_MPTKEY+=([$1]=$3)
  CPO_RELDB_FIELD_TITLE+=([$1]=$4)
}

cpo_reldb_dump() {
  declare -p1 CPO_RELDB_KEYS
  declare -p1 CPO_RELDB_FIELD_AMBPM
  declare -p1 CPO_RELDB_FIELD_MPTKEY
  declare -p1 CPO_RELDB_FIELD_TITLE
}

cpo_reldb_print() {
  echo
  echo ${CPO_RELDB_KEYS[*]}
  echo
  echo ${(k)CPO_RELDB_FIELD_TITLE}
  echo
  echo ${(v)CPO_RELDB_FIELD_TITLE}
  echo
  echo ${(kv)CPO_RELDB_FIELD_TITLE}
  echo
  for k in ${CPO_RELDB_KEYS[@]}; do printf "https://music.apple.com/us/song/%-10s . %s\n" $k $CPO_RELDB_FIELD_TITLE[$k]; done
  echo
}

cpo_reldb_init() {

  declare -g -a CPO_RELDB_KEYS
  declare -g -A CPO_RELDB_FIELD_AMBPM
  declare -g -A CPO_RELDB_FIELD_MPTKEY
  declare -g -A CPO_RELDB_FIELD_TITLE

  # key symbol /[A-G][_ib]/
  # i is SHARP
  # _ is NATUAL
  # b is FLAT

  # if no AMID/AppleMusicID, generate one with "gshuf -n 1 -i 2000000000-2999999999"

  cpo_reldb_append  715484828 "999" "D_" "In Christ Alone"
  cpo_reldb_append 2574411984 "999" "B_" "What a Friend We Have in Jesus"

}

cpo_reldb_init
