#!/usr/local/bin/bash
#version=1.08.01
gsed -i "s/sed/gsed/g" mkbld.sh
gsed -i "s/sed/gsed/g" lib.sh
gsed -i "s/awk/gawk/g" utils.sh
gsed -i "s/sed/gsed/g" utils.sh
gsed -i "s/sed/gsed/g" start.sh
gsed -i "s/awk/gawk/g" reffiles/update.sh
gsed -i "s/sed/gsed/g" reffiles/update.sh
gsed -i "s/shuf/gshuf/g" utils.sh

for i in $( find block | grep -v graphics.sh | grep -v blank.sh | grep -v overlay.sh | sort -n ) ; do
if [[ "$i" == "block" ]] ; then i=null ; fi
if [[ "$i" == 'block/e' ]] ; then i=null ; fi
if [[ "$i" == 'block/i' ]]  ; then i=null ; fi
if [[ "$i" != null ]]
then
makebuild=$(grep "sed" "$i" | wc -m)
if [ $makebuild -gt 1 ]
then
gsed -i "s/sed/gsed/g" $i
fi
fi
done

gsed -i "s|#!/bin/bash|#!/usr/local/bin/bash|g" utils.sh
gsed -i "s|#!/bin/bash|#!/usr/local/bin/bash|g" lib.sh
gsed -i "s|#!/bin/bash|#!/usr/local/bin/bash|g" start.sh
gsed -i "s|#!/bin/bash|#!/usr/local/bin/bash|g" mkbld.sh
gsed -i "s|#!/bin/bash|#!/usr/local/bin/bash|g" reffiles/update.sh

for i in $( find block | sort -n ) ; do
if [[ "$i" == "block" ]] ; then i=null ; fi
if [[ "$i" == 'block/e' ]] ; then i=null ; fi
if [[ "$i" == 'block/i' ]]  ; then i=null ; fi
if [[ "$i" != null ]]
then
makebuild=$(grep "sed" "$i" | wc -m)
if [ $makebuild -gt 1 ]
then
gsed -i "s|#!/bin/bash|#!/usr/local/bin/bash|g" $i
fi
fi
done

printf "\ec"
echo "Game files have been patched for BSD type systems."
