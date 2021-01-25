#!/bin/bash
start=${PWD/} # get full path

parent1="$(dirname "${1}")/"
parent2="$(dirname "${2}")/"
b1="$(basename "$1")"
b2="$(basename "$2")"
echo $b1 

#parent1=`eval "cd "$1";pwd;cd - > /dev/null"`
echo "$parent1" "$parent2"
eval cd $parent1


perl ~/bashrc/ext/latex/latexpand/latexpand "$b1" > "${start}/1.flt"

cd "$start"
eval cd "$parent2"
perl ~/bashrc/ext/latex/latexpand/latexpand "$b2" > "${start}/2.flt"

cd "$start"
p="$(realpath "$start")"
echo ""$p"/$1.flt"
perl ~/bashrc/ext/latex/latexdiff/latexdiff "${start}/1.flt" "${start}/2.flt" > "$p/diff.tex"

#echo foo >&3
