#!/bin/bash

function background() {
image=$(block/$block/./graphics.sh ${cell}pic1)
echo "$image"
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i22=$(grep 'i22=' status | cut -d "=" -f2)
i23=$(grep 'i23=' status | cut -d "=" -f2)
i33=$(grep 'i33=' status | cut -d "=" -f2)
i40=$(grep 'i40=' status | cut -d "=" -f2)
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
if [ $intro -eq 0 ] ; then output=$(./utils.sh blockform) ; fi
vars
printf "\e[0;0H"
background
intro=2
fi
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=23' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=33' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=40' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=22' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i39) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform lookdoor door1 door19 $i23 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform lookdoor corridor4 corridor6 $i33) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform lookdoor corridor4 corridor5 $i40) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform lookdoor door1 door10 $i22 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floori) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i33) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh blockform smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh blockform smell corridor3) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall) ;;

#constantcomm

esac
done

