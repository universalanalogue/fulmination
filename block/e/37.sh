#!/bin/bash

function background() {
image=$(block/$block/./graphics.sh ${cell}pic1a)
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
e30=$(grep 'e30=' status | cut -d "=" -f2)
e36=$(grep 'e36=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
wolf=$(grep 'wolf=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) output=$(./utils.sh blockform elooka forest2) ;;

[g][o][n][o][r][t][h]) output=$(./utils.sh blockform elooka forest2) ;;

[g][o][s][o][u][t][h]) if  [ $wolf -eq 2 ]
then
sed -i '/cell=/c\cell=30a' status
else
sed -i '/cell=/c\cell=30' status
fi
break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=36' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 37) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east 1 9) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north 1 9) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e30 10) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west $e36 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh blockform elooka forest) ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene "elooka house southwest" "Look House" back
intro=0 ;;

[l][o][o][k][s][h][e][d]) output=$(./utils.sh blockform elooka shed south) ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][f][o][r][e][s][t]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][s][h][e][d]) output=$(./utils.sh blockform uni lick) ;;

[s][m][e][l][l]) if [ $wolf -eq 2 ]
then
output=$(./utils.sh blockform smell wolf1)
else
output=$(./utils.sh blockform smell e)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][f][o][r][e][s][t]) output=$(./utils.sh blockform smell foreste wolf $wolf) ;;

[s][m][e][l][l][s][h][e][d]) output=$(./utils.sh blockform uni far) ;;


#constantcomm

esac
done

