#!/bin/bash

{
   echo

   ID1="$(pwgen -1sA  6 65536 | grep -v '^[0-9]' | head -9)"
   ID2="$(tr '[:lower:]' '[:upper:]' <<<"$ID1")"
   ID3="$(pwgen -1sA0 4 65536                    | head -9)"
   ID4="$(pwgen -1sA0 6 65536                    | head -9)"

   paste <(echo -n "$ID1") <(echo -n "$ID2") <(echo -n "$ID3") <(echo -n "$ID4") \
      | sed -e "s/^/  /g" -e "s/\t/   /g"
   echo

}
