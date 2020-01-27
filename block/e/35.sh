#!/bin/bash

function background() {
if [ $wolf -eq 2 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1b)
else
image=$(block/$block/./graphics.sh ${cell}pic1a)
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
e28=$(grep 'e28=' status | cut -d "=" -f2)
e34=$(grep 'e34=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=36' status ; break ;;

[g][o][n][o][r][t][h]) output=$(./utils.sh blockform elooka forest2) ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=28' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=34' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 35 wolf $wolf) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east $e36 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north 1 9) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e28 3) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west $e34 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh blockform looki null forest4 0 wolf1 $wolf) ;;

[l][o][o][k][e][y][e][s]) if [ $wolf -eq 2 ]
then
output=$(./utils.sh blockform looki wolf1 $wolf)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene "elooka house south" "Look House" side
intro=0 ;;

[l][o][o][k][r][o][c][k]) output=$(./utils.sh blockform elooka rock) ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][f][o][r][e][s][t]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][r][o][c][k]) output=$(./utils.sh blockform lick rock) ;;

[s][m][e][l][l]) if [ $wolf -eq 2 ]
then
output=$(./utils.sh blockform smell wolf1)
else
output=$(./utils.sh blockform smell e)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][f][o][r][e][s][t]) output=$(./utils.sh blockform smell foreste wolf $wolf) ;;

[s][m][e][l][l][r][o][c][k]) output=$(./utils.sh blockform smell rocke) ;;

#constantcomm

esac
done

