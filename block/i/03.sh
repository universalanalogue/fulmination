#!/bin/bash
#version=1.08.01

background() {
./utils.sh colorset 4
image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0)
echo "$image"
if [ $book11 -eq 0 ] ; then ./utils.sh overlay book12 40 13 0 ; fi
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

#sleep



while true ; do

if [ $intro -eq 2 ] ; then vars ; fi

./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then break ; fi


if [ $intro -lt 2 ]
then
if [ $intro -eq 0 ] ; then output=$(./utils.sh form) ; fi
vars
printf "\e[0;0H"
background
intro=2
fi
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book11 -eq 0 ]
then
sed -i '/book11=/c\book11=1' status
output=$(./utils.sh form uni get2 book)
intro=1
else
output=$(./utils.sh form uni get1)
fi ;;

[g][o][e][a][s][t]) if [ $key2 -eq 1 ]
then
sed -i '/color=/c\color=1' status
sed -i '/cell=/c\cell=09' status
break 
else
output=$(./utils.sh form uni doorlock)
fi  ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=04' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=02' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i03) ;;

[l][o][o][k][b][o][o][k]) if [ $book11 -eq 0 ] || [ $book11 -eq 1 ] 
then
output=$(./utils.sh form uni book)
else 
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form looki null box13 0 book15 $book11) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door5 $i09 $key2) ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door6 $i04 1) ;;

[l][o][o][k][s][o][u][t][h][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door2 $i02 1) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form looki null door22 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][l][o][c][k])./lib.sh key2b
if [ $key2 -eq 0 ]
then
output=$(./utils.sh form uni doorlock)
else
output=$(./utils.sh form uni doorunlock)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[o][p][e][n][b][o][x]) output=$(./utils.sh form looki null chair4 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book11 -eq 0 ] || [ $book11 -eq 1 ]
then
./utils.sh reader book11r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book11 -eq 0 ] || [ $book11 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][b][o][x]) output=$(./utils.sh form lick box1) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i01) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book11 -eq 0 ] || [ $book11 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][b][o][x]) output=$(./utils.sh form smell box1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door3) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

#constantcomm

esac
done

