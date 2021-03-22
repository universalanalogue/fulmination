#!/bin/bash

vcs(){
#1 type of increment (1 bugfix ; 2 minor ; 3 major)
vcs=$(git status -s -uno | cut -d " " -f3 | grep -v update.sh | grep -v musichelp.txt | grep -v readme.md)
oldv=$(grep revver= "lib.sh" | cut -d "=" -f2)
oldva=$(cut -d "." -f1 <<< "$oldv")
oldvb=$(cut -d "." -f2 <<< "$oldv")
oldvc=$(cut -d "." -f3 <<< "$oldv")

if [ -z $1 ] 
then
echo "please add increment type to end of command
1 bugfix, 2 minor, 3 major"
else

if [ $1 -eq 1 ] ; then
newvc=$((10#$oldvc+1))
if [ $(($(wc -c <<< "$newvc")-1)) -eq 1 ] ; then newvc=("0$newvc") ; fi
newv=("${oldva}.${oldvb}.${newvc}")
fi

if [ $1 -eq 2 ] ; then
newvb=$((10#$oldvb+1))
if [ $(($(wc -c <<< "$newvb")-1)) -eq 1 ] ; then newvb=("0$newvb") ; fi
newv=("${oldva}.${newvb}.01")
fi

if [ $1 -eq 3 ] ; then
newva=$((10#$oldva+1))
newv=("${newva}.01.01")
fi

sed -i "/revver=/c\revver=$newv" lib.sh
for i in $vcs ; do
sed -i "/#version=/c\#version=$newv" $i
done
fi
}

patch(){

cp status.new status.bak
#1 update old variable names
var1=$(grep "##" status.new | tr -d "#")
for i in $var1 ; do
var1a=$(cut -d ";" -f1 <<< "$i")
var1b=$(cut -d ";" -f2 <<< "$i")
sed -i "s/$var1a=/$var1b=/" $1
done

#2 flush out bad variables
var1=$(sed '/^$/d ; /#/d' $1 | cut -d "=" -f1)
for i in $var1 ; do
var2a=$(grep "$i=" status.bak | cut -d "=" -f1)
if [[ "$i" != "$var2a" ]]
then
sed -i "/$i=/c\\" $1
fi
done

#3 update good variables
var1=$(sed '/^$/d ; /#/d' $1)
for i in $var1 ; do
var1a=$(cut -d "=" -f1 <<< "$i")
var1b=$(cut -d "=" -f2 <<< "$i")

sed -i "/$var1a=/c\\$var1a=$var1b" status.bak
done

#4 write the new file
mv status.bak $1

}

update(){

#git clone https://github.com/universalanalogue/fulmination.git reffiles/update
#chmod +x -R reffiles/update
ulist=$(find | grep -v .git | grep -v reffiles/update | grep -v musichelp | grep -v save | sed '1d')
for i in $ulist ; do
if [[ "$i" == "./block" ]] ; then i=null ;fi
if [[ "$i" == './block/e' ]] ; then i=null ; fi
if [[ "$i" == './block/i' ]]  ; then i=null ; fi
if [[ "$i" == './reffiles' ]]  ; then i=null ; fi
if [[ "$i" == './reffiles/spritealign' ]]  ; then i=null ; fi
if [[ "$i" == './reffiles/spritealign/block' ]]  ; then i=null ; fi
if [[ "$i" == './reffiles/spritealign/block/i' ]]  ; then i=null ; fi
if [[ "$i" == './reffiles/spritealign/block/e' ]]  ; then i=null ; fi
if [[ "$i" != null ]]
then
oldv=$(grep "#version=" $i | cut -d "=" -f2)
oldva=$(cut -d "." -f1 <<< "$oldv")
oldvb=$(cut -d "." -f2 <<< "$oldv")
oldvc=$(cut -d "." -f3 <<< "$oldv")
newv=$(grep "#version=" reffiles/update/fulmination/$i | cut -d "=" -f2)
newva=$(cut -d "." -f1 <<< "$newv")
newvb=$(cut -d "." -f2 <<< "$newv")
newvc=$(cut -d "." -f3 <<< "$newv")

if [ $oldva -eq $newva ] ; then state1=1 ; fi
if [ $oldva -lt $newva ] ; then state1=2 ; fi
if [ $oldvb -eq $newvb ] ; then state2=1 ; fi
if [ $oldvb -lt $newvb ] ; then state2=2 ; fi
if [ $oldvc -lt $newvc ] ; then state3=2 ; fi


if [ $state1 -eq 2 ] ; then state=2 ; fi

if [ $state1 -eq 1 ] && [ $state2 -eq 2 ] ; then state=2 ; fi

if [ $state1 -eq 1 ] && [ $state2 -eq 1 ] && [ $state3 -eq 2 ] ; then state=2 ; fi

if [[ $state -eq 2 ]] ; then
echo "$i is being updated"
mv reffiles/update/fulmination/$i $i

#patching saved games
if [[ $i == './status.new' ]] ; then
while true ;do
read -p "do you want to patch your save files?
WARNING MAY CAUSE SAVE CORRUPTION!!
Y/N: " case
case $case in
[y]) saves=$(find | grep .save | grep -v .git | grep -v block | grep -v reffiles)
for h in $saves ; do
cp $h $h.bak
patch $h
done ; break ;;
[n]) break ;;
esac
done
fi

else
echo "$i is already up to date"
fi
fi

done
#./mkbld.sh
#rm -fr reffiles/update
}


$1 $2 $3

