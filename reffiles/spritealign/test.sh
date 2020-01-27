#!/bin/bash


function overlay(){
#$1 image $2 xaxis start $3 yaxis start $4 transparency
xaxis=$2
yaxis=$3

var1=$(./block/./overlay.sh $1 | sed 's|\\|\\\\|g')

var1=$(awk 1 ORS='nwlne' <<< "$var1" | sed 's/nwlne/\\e[#layer;#xaxisH/g')
var1=$(sed "s/#xaxis/$xaxis/g" <<< "$var1")
match=$(grep -o '#layer' <<< "$var1" | wc -l )
match=$((match+yaxis))
count=$yaxis
while [ $count -ne $match ] ; do count=$((count+1)) ; var1=$(sed "s/#layer/$count/" <<< "$var1") ; done


if [ $4 -eq 1 ] ; then var1=$(sed 's/ /\\e[1C/g' <<< "$var1") ; fi

if [[ "$var1" == *"#layer"* ]]
then
var1=$(sed "s/\[#layer;${xaxis}H//" <<< "$var1" | sed 's/\(.*\)\\e/\1/')
fi

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

overlay $over $a $b $c

printf "\e[23;1H"
echo "overlay  Xaxis   Yaxis   trans
$over     $a  x   $b      $c 
##################################################" ;;

[2]) read -p "block: " block ;;
[3]) read -p "name of picture: " pic ;;
[4]) read -p "name of overlay: " over ;;



esac
done
