#!/bin/bash

function help {
  # echo "$0 <in.txt> <out.html> [--oneshot]"
  echo "$0 <in.txt> <out.html>"
  exit 1
}

function dp_apply_style_class {
  SED=(
    /usr/bin/sed
    -E
    -e 's/$/ <br>/'
    -e 's,\{([^}]+)\},<span class="heavy">\1</span>,g'
    -e 's,\[([^]]+)\],<span class="light">\1</span>,g'
  )
  # echo "A" 1>&2
  # echo "$TXT" 1>&2
  cat "$TXT" \
    | grep -v -e '^#' \
    | "${SED[@]}"
  # echo "B" 1>&2
}

function dp_devtools_refresh {
  WSURL="$(curl -s http://127.0.0.1:9222/json | jq -r '.[]|select(.title=="despacito.html").webSocketDebuggerUrl')"
  for u in $WSURL; do
    echo "reload('$u')"
    [[ $u =~ ^ws://127.0.0.1:9222/devtools/page/[A-Z0-9]{32}$ ]] || { echo "err oz40p7"; exit 1; }
    jq -c 0<<<'{"id":2,"method":"Page.reload","params":{"ignoreCache":true,"scriptToEvaluateOnLoad":""}}' | websocat "$u"
  done
}

# implemented in Makefile
# case "$#" in
#   2)
#     exec entr <<<"$TXT" "$0" "$TXT" "$HTML" --oneshot
#     exit 1
#     ;;
#   3)
#     [ --oneshot = "$3" ] || { echo "err gjrn6g"; exit 1; }
#     ;;
#   *)
#     echo "err tl9xy0"
#     exit 1
#     ;;
# esac
[ 2 == "$#" ] || help
TXT="$1"
HTML="$2"

cat <<EOF
:  input $TXT
:  output to $HTML
:; chromium 'file://$HTML'
EOF

# fd.redirect
exec 99>&1
exec 1>"$HTML"

cat <<EOF
<!DOCTYPE html>
<html>
<head>
  <style>
    .heavy {
      font-weight: bold;
      color: brown;
    }
    .light {
      font-weight: bold;
      color: gray;
    }
  </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>
</head>
<body>
EOF

echo "$TXT" 1>&2
dp_apply_style_class

cat <<EOF
</body>
</html>
EOF

# fd.restore
exec 1>&99 99>&-

dp_devtools_refresh
