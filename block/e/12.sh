#!/bin/bash

function background() {
image=$(block/$block/./graphics.sh ${cell}pic1a)
echo "$image"
if [ $i28window -eq 1 ] ; then ./utils.sh overlay win1 23 1 0 ; fi
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key5=$(grep 'key5=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e08=$(grep 'e08=' status | cut -d "=" -f2)
e16=$(grep 'e16=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i28window=$(grep 'i28window=' status | cut -d "=" -f2)
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

[g][e][t][k][e][y]) if [ $key5 -eq 0 ]
then
sed -i '/key5=/c\key5=1' status
output=$(./utils.sh blockform uni get2 key)
else
output=$(./utils.sh blockform uni get3 key)
fi ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=16' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=08' status ; break ;;

[g][o][w][e][s][t]) output=$(./utils.sh blockform elooka gate1) ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 12) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east 1 4) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north e17 2) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e08 4) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west 1 8) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform elooka hedge) ;;

[l][o][o][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh blockform elooka drive) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform elooka door1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh blockform elooka gate) ;;

[l][o][o][k][k][e][y]) ./lib.sh key5a 
if [ $key5 -eq 0 ] ; then output=$(./utils.sh blockform lookkey e12) ; fi
if [ $key5 -eq 1 ] ; then output=$(./utils.sh blockform uni get3 key) ; fi ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh blockform elooka house east) ;;

[l][o][o][k][m][a][i][l][b][o][x]) if [ $key5 -eq 0 ] 
then
output=$(./utils.sh blockform elooka mail1)
else
output=$(./utils.sh blockform elooka mail2)
fi ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

#olfactory

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh blockform hedge) ;;

[l][i][c][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh blockform drive) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh blockform lick door2) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh blockform lick house) ;;

[l][i][c][k][k][e][y]) if [ $key5 -eq 0 ] || [ $key5 -eq 1 ]
then
output=$(./utils.sh blockform uni lickkey)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][m][a][i][l][b][o][x]) output=$(./utils.sh blockclear lick mail) ;;

[l][i][c][k][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh blockform smell hedgee) ;;

[s][m][e][l][l][d][r][i][v][e][w][a][y]) output=$(./utils.sh blockform smell drive) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh blockform smell door2) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh blockform smell housee) ;;

[s][m][e][l][l][k][e][y]) if [ $key5 -eq 0 ] || [ $key5 -eq 1 ]
then
output=$(./utils.sh blockform uni smellkey)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][m][a][i][l][b][o][x])output=$(./utils.sh blockform smell mail) ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform uni far) ;;


#constantcomm

esac
done

