#!/bin/bash

function background() {
if [ $i24awindow -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
else
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
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
e26=$(grep 'e26=' status | cut -d "=" -f2)
e32=$(grep 'e32=' status | cut -d "=" -f2)
e34=$(grep 'e34=' status | cut -d "=" -f2)
i24awindow=$(grep 'i24awindow=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=34' status ; break ;;

[g][o][n][o][r][t][h]) output=$(./utils.sh blockform elooka hedge3) ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=26' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=32' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 33) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east $e34 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north 1 2) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e26 3) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west $e32 11) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform elooka hedge) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh blockform elooka house south) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

#olfactory

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh blockform lick hedge) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh blockform uni far) ;;

[l][i][c][k][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh blockform smell hedgee) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh blockform uni far) ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

#constantcomm

esac
done

