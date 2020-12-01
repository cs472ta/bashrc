#!/bin/bash

#tmpfile=$(mktemp /tmp/abc-script.XXXXXX)
#exec 3>"$tmpfile"
#rm "$tmpfile"

perl ./latexpand/latexpand $1 > $1.flt
perl ./latexpand/latexpand $2 > $2.flt

perl latexdiff $1.flt $2.flt > diff.tex


#echo foo >&3

