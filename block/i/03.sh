#!/bin/bash
#version=1.08.01

background() {
./utils.sh colorset 4
image=$(block/$block/./graphics.sh ${cell}pic1a
sidebar)
echo "$image"
if [ $book11 -eq 0 ] ; then ./utils.sh overlay book12 40 13 0 0 ; fi
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0 0
}

vars () {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book11=$(grep 'book11=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key2=$(grep "key2=" status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variable
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i02=$(grep 'i02=' status | cut -d "=" -f2)
i04=$(grep 'i04=' status | cut -d "=" -f2)
i09=$(grep 'i09=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book11 book $book11)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][e][a][s][t]) if [ $key2 -eq 1 ]
then
sed -i '/color=/c\color=1' status
sed -i '/cell=/c\cell=09' status
break 
else
output=$(./utils.sh form 1 uni doorlock)
fi  ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=04' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=02' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i03) ;;

[l][o][o][k][b][o][o][k]) if [ $book11 -ne 2 ] 
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else 
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form 1 looki null box13 0 book15 $book11) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door5 $i09 $key2) ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door6 $i04 1) ;;

[l][o][o][k][s][o][u][t][h][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door2 $i02 1) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 looki null door22 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][l][o][c][k])./lib.sh keyb key4
if [ $key2 -eq 0 ]
then
output=$(./utils.sh form 1 uni doorlock)
else
output=$(./utils.sh form 1 uni doorunlock)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[o][p][e][n][b][o][x]) output=$(./utils.sh form 1 looki null box5 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book11 -ne 2 ]
then
./utils.sh reader book11r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book11 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][b][o][x]) output=$(./utils.sh form 1 lick box1) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i01) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book11 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][o][x]) output=$(./utils.sh form 1 smell box1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door3) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

*) case1=(system${case1}) ;;
esac


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

