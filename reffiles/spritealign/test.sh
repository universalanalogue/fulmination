#!/bin/bash
#version=1.08.01


overlay(){
#$1 image $2 xaxis start $3 yaxis start $4 transparency
xaxis=$2 ; if [ $xaxis -eq 0 ] ; then xaxis=1 ; fi
yaxis=$3 ; if [ $yaxis -eq 0 ] ; then yaxis=1 ; fi

var1=$(./block/./overlay.sh $1 | sed 's|\\|\\\\|g')

var1=$(awk 1 ORS='nwlne' <<< "$var1" | sed "s/\(.*\)nwlne/\1/ ; s/nwlne/\\\\e[#layer;${xaxis}H/g")
mat=$(($(grep -o '#layer' <<< "$var1" | wc -l)+1))

var1=$(awk -v yaxis="$yaxis" -v v=1 -v mat="$mat" '{while( v < mat)
if($x~/#layer/){sub(/#layer/,v++ + yaxis)}}1' <<< "$var1")

if [ $4 -eq 1 ] ; then var1=$(sed 's/ /\\e[1C/g' <<< "$var1") ; fi

printf "\e[${yaxis};${xaxis}H${var1}"
}


printf '\ec'
block=i
pic=01pic2a
block/$block/./graphics.sh $pic
while true ; do
read -p "1 run test
2 set block ($block)
3 set picture ($pic)
4 set overlay ($over)
: " case1

case $case1 in
[1]) read -p "enter xaxis yaxis and trans bit: " var1
printf '\ec'
a=$(awk {'print$1'} <<< $var1)
b=$(awk {'print$2'} <<< $var1)
c=$(awk {'print$3'} <<< $var1)
block/$block/./graphics.sh $pic
overlay "blank 3 1" 56 1 0

overlay "$over" $a $b $c

printf "\e[23;1H"
echo "overlay  Xaxis   Yaxis   trans
$over     $a  x   $b      $c 
##################################################" ;;

[2]) read -p "block: " block ;;
[3]) read -p "name of picture: " pic ;;
[4]) read -p "name of overlay: " over ;;



esac
done
