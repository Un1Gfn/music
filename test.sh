#!/bin/bash
set -e
trap 'echo $LINENO' EXIT
echo "$LINENO"
/bin/false