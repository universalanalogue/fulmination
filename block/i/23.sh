#!/bin/bash
#version=1.08.01

background() {
image=$(block/$block/./graphics.sh ${cell}pic1a
sidebar)
echo "$image"
if [ $book110 -eq 0 ] ; then ./utils.sh overlay "scuff" 37 11 0 0 ; fi
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 1" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book110=$(grep 'book110=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key6=$(grep 'key6=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i39=$(grep 'i39=' status | cut -d "=" -f2)
sleepnum=$(grep "sleepnum=" status | cut -d "=" -f2)
}
helpcount=0
intro=0

block=$(grep "block=" status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
mvnt1=$(grep "mvnt1=" status | cut -d "=" -f2)

sed -i '/${block}${cell}=/c\\${block}${cell}=1' status
if [ $mvnt1 -eq 0 ]
then
sed -i '/mvnt2=/c\mvnt2=0' status
else
sed -i '/mvnt2=/c\mvnt2=0' status
fi

./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then exit ; fi
sleep=$(grep "sleep=" status | cut -d "=" -f2)
sleepthreshold=$(grep "sleepthreshold=" status | cut -d "=" -f2)
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)

while true ; do

if [ $intro -eq 2 ] ; then vars ; fi

if [ $intro -lt 2 ]
then
if [ $intro -eq 0 ] ; then output=$(./utils.sh form 1) ; fi
vars
printf "\e[0;0H"
background
intro=2
sed -i "/intro=/c\intro=2" status
fi
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book110 book $book110)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][e][t][k][e][y])
get=$(./utils.sh get key6 key $key6)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=39' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i23) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door15 $i39 1) ;;

[l][o][o][k][b][e][d]) output=$(./utils.sh form 1 looki null bed1 0) ;;

[l][o][o][k][b][o][o][k]) if [ $book110 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) if [ $book110 -eq 0 ]
then
output=$(./utils.sh form 1 looki null bookcase2 0)
else
output=$(./utils.sh form 1 looki null bookcase1 0)
fi ;;

[l][o][o][k][d][r][a][w][e][r][s]) if [ $key6 -eq 0 ]
then
output=$(./utils.sh form 1 looki null drawer1 0)
else 
output=$(./utils.sh form 1 looki null drawer2 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor7 0) ;;

[l][o][o][k][k][e][y]) if [ $key6 -ne 2 ]
then
sidebar
./lib.sh keya key8
fi
if [ $key6 -eq 0 ] ; then output=$(./utils.sh form 1 lookkey i23) ; fi
if [ $key6 -eq 1 ] ; then output=$(./utils.sh form 1 uni get3 key) ; fi 
if [ $key6 -eq 2 ] ; then output=$(./utils.sh form 1 uni look) ; fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book110 -ne 2 ]
then
./utils.sh reader book110r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][e][d]) output=$(./utils.sh form 1 lick bed1) ;;

[l][i][c][k][b][o][o][k]) if [ $book110 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][d][r][a][w][e][r][s]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor5) ;;

[l][i][c][k][k][e][y]) if [ $key6 -ne 2 ]
then
output=$(./utils.sh form 1 uni lickkey)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i23) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][b][e][d]) output=$(./utils.sh form 1 smell bed1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book110 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][d][r][a][w][e][r][s]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floor5) ;;

[s][m][e][l][l][k][e][y]) if [ $key2 -ne 2 ]
then
output=$(./utils.sh form 1 uni smellkey)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

*) case1=(system${case1}) ;;
esac

if [[ "$case1" == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)

block/$block/./lib.sh slcom "$case1"

cell=$(grep "cell=" status | cut -d "=" -f2)
intro=$(grep "intro=" status | cut -d "=" -f2)
if [[ "$cell" == null ]] ; then break ; fi
if [[ "$cell" != null ]] && [[ "$intro" != 0 ]] ; then case1=(system${case1}) ; fi
sleep=$(grep 'sleep=' status | cut -d "=" -f2)
sleepthreshold=$(grep 'sleepthreshold=' status | cut -d "=" -f2)
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)
fi

if [[ "$case1" == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)

./utils.sh evecom "$case1"
cell=$(grep "cell=" status | cut -d "=" -f2)
intro=$(grep "intro=" status | cut -d "=" -f2)
if [[ "$cell" == null ]] ; then break ; fi
if [[ "$cell" != null ]] && [[ "$intro" != 0 ]] ; then case1=(system${case1}) ; fi
fi

if [[ "$case1" == *"system"* ]]
then

case1=$(sed "s/system//" <<< $case1)
concom=$(./utils.sh concom "$case1")
state=$(sed "1q;d" <<< "$concom")
intro=$(sed "2q;d" <<< "$concom")
output=$(tail -n 12 <<< "$concom")
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ "$state" == 2 ]] || [[ "$cell" == null ]] ; then break ; fi
fi

done

