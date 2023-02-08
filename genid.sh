#!/bin/bash

{
   echo

   ids="$(pwgen -sA1 6 65536 | grep -v '^[0-9]' | head -9)"
   IDS="$(tr '[:lower:]' '[:upper:]' <<<"$ids")"
   paste <(echo -n "$ids") <(echo -n "$IDS") \
      | sed -e "s/^/  /g" -e "s/\t/   /g"
   echo

}
