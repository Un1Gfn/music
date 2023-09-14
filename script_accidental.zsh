#!/bin/zsh

# -i.orig

gsed -i.orig -E -e 's/(^| )([cdfg])([0-9]| |$)/\1\2is\3/g' 715484828.ly
