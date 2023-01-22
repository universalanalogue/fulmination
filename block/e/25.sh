#!/bin/bash
#version=1.08.02

background() {
aux2= ; pic=
if [ $focus -eq 0 ] ; then pic=pic1a ; fi

if [ $focus -eq 1 ]
then
pic=pic2a
aux2=$(if [ $book16 -eq 0 ] ; then ./utils.sh overlay book8 25 15 0 0; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar)
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 2" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book16=$(grep 'book16=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e24=$(grep 'e24=' status | cut -d "=" -f2)
e26=$(grep 'e26=' status | cut -d "=" -f2)
e32=$(grep 'e32=' status | cut -d "=" -f2)
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
sed -i '/mvnt2=/c\mvnt2=2' status
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

[g][o][e][a][s][t]) sed -i '/cella=/c\cella=26' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=32' status ; break ;;

[g][o][w][e][s][t])sed -i '/cella=/c\cella=24' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 elook 25) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form 1 elookdir east $e26 3) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form 1 elookdir north $e32 1) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form 1 elookdir south 1 4) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form 1 elookdir west $e24 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book16 -eq 1 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][b][u][s][h]) output=$(./utils.sh form 1 elooka bush) ;;

[l][o][o][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh form 1 elooka drive) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 elooka floor) ;;

[l][o][o][k][f][o][u][n][d][a][t][i][o][n])  sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 elooka foundation1 16 $book16) ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene 1 "elooka house south" "Look House" side
intro=0 ;;

[l][o][o][k][h][o][l][e]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 elooka foundation1 16 $book16) ;;

[r][e][a][d][b][o][o][k]) if [ $book16 -eq 1 ]
then
./utils.sh reader book16r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][u][s][h]) output=$(./utils.sh form 1 lick hedge) ;;

[l][i][c][k][b][o][o][k]) if [ $book16 -eq 1 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh form 1 lick drive) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[l][i][c][k][f][o][u][n][d][a][t][i][o][n]) output=$(./utils.sh form 1 lick hole) ;;

[l][i][c][k][h][o][l][e]) output=$(./utils.sh form 1 lick hole) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh form 1 lick house) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book16 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][u][s][h]) output=$(./utils.sh form 1 smell bushe) ;;

[s][m][e][l][l][d][r][i][v][e][w][a][y]) output=$(./utils.sh form 1 smell drive) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

[s][m][e][l][l][f][o][u][n][d][a][t][i][o][n]) output=$(./utils.sh form 1 smell hole) ;;

[s][m][e][l][l][h][o][l][e]) output=$(./utils.sh form 1 smell hole) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh form 1 smell housee) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book16 book $book16)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k]) output=$(./utils.sh form 1 elooka foundation1 16 $book16) ;;

[l][o][o][k][b][o][o][k]) if [ $book16 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][o][u][n][d][a][t][i][o][n]) output=$(./utils.sh form 1 elooka foundation1 16 $book16) ;;

[l][o][o][k][h][o][l][e]) output=$(./utils.sh form 1 elooka foundation1 16 $book16) ;;

[r][e][a][d][b][o][o][k]) if [ $book16 -ne 2 ]
then
./utils.sh reader book16r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book16 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell hole) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book16 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][h][o][l][e]) output=$(./utils.sh form 1 smell hole) ;;

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
