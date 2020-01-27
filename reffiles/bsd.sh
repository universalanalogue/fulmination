#!/bin/bash

gsed -i "s/sed/gsed/g" mkbld.sh
gsed -i "s/sed/gsed/g" lib.sh
gsed -i "s/sed/gsed/g" utils.sh
gsed -i "s/sed/gsed/g" start.sh

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
