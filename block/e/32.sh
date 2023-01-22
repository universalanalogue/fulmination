#!/bin/bash
#version=1.08.01

background() {
aux2= ; pic=
if [ $focus -eq 0 ] ; then pic=pic1a ; fi

if [ $focus -eq 1 ]
then
pic=pic2a
aux2=$(if [ $book21 -eq 0 ] ; then ./utils.sh overlay book10 29 17 0 0; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar)
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book21=$(grep 'book21=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e25=$(grep 'e25=' status | cut -d "=" -f2)
e31=$(grep 'e31=' status | cut -d "=" -f2)
e33=$(grep 'e33=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
}

helpcount=0
intro=0
focus=0
sed -i '/focus=/c\focus=0' status

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
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cella=/c\cella=33' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][n][o][r][t][h]) output=$(./utils.sh form 1 elooka hedge3) ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=25' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=31' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 elook 32) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form 1 elookdir east $e33 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form 1 elookdir north 1 1) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form 1 elookdir south $e25 1) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form 1 elookdir west $e33 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book21 -eq 1 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form 1 elooka hedge) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene 1 "elooka house south" "Look House" side
intro=0 ;;

[l][o][o][k][r][o][c][k]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $book21 -eq 1 ]
then
output=$(./utils.sh form 1 elooka rock1)
else
output=$(./utils.sh form 1 elooka rock2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book21 -ne 2 ]
then
./utils.sh reader book21r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book21 -eq 1 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh form 1 lick hedge) ;;

[l][i][c][k][r][o][c][k]) output=$(./utils.sh form 1 lick rock) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book21 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh form 1 smell hedgee) ;;

[s][m][e][l][l][r][o][c][k]) output=$(./utils.sh form 1 smell rocke) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book21 book $book21)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k]) if [ $book21 -eq 1 ]
then
output=$(./utils.sh form 1 elooka rock1)
else
output=$(./utils.sh form 1 elooka rock2)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book21 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][r][o][c][k]) if [ $book21 -eq 1 ]
then
output=$(./utils.sh form 1 elooka rock1)
else
output=$(./utils.sh form 1 elooka rock2)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book21 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book21 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][r][o][c][k]) output=$(./utils.sh form 1 smell rocke) ;;

*) case1=(system${case1}) ;;

esac
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

