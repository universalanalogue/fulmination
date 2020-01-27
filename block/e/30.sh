#!/bin/bash

function background() {
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${cell}pic1a)
echo "$image"
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key8=$(grep 'key8=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e23=$(grep 'e23=' status | cut -d "=" -f2)
e29=$(grep 'e29=' status | cut -d "=" -f2)
e37=$(grep 'e37=' status | cut -d "=" -f2)
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

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=37' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=23' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=29' status ; break ;;

[g][o][s][h][e][d]) if [ $key8 -eq 1 ] 
then
sed -i '/cell=/c\cell=14' status
sed -i '/block=/c\block=i' status
sed -i '/color=/c\color=8' status 
break
else
output=$(./utils.sh blockform uni doorlock)
fi ;;

[g][o][d][o][o][r]) if [ $key8 -eq 1 ] 
then
sed -i '/cell=/c\cell=14' status
sed -i '/block=/c\block=i' status
sed -i '/color=/c\color=8' status 
break
else
output=$(./utils.sh blockform uni doorlock)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 30) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform lookdoor door1 door29 $i14 $key8) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east 1 9) ;;

[l][o][o][k][n][o][r][t][h]) Voutput=$(./utils.sh blockform elookdir north $e37 3) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e23 1) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west $e29 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh blockform elooka forest) ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene "elooka house southwest" "Look House" back
intro=0 ;;

[l][o][o][k][l][o][c][k])./lib.sh key8b
if [ $key8 -eq 0 ]
then
output=$(./utils.sh blockform uni doorlock)
else
output=$(./utils.sh blockform uni doorunlock)
fi ;;

[l][o][o][k][s][h][e][d]) output=$(./utils.sh blockform elooka shed1) ;;

#olfactory

[l][i][c][k][d][o][o][r]) output=$(./utils.sh blockform lick door3 $key8) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][f][o][r][e][s][t]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][s][h][e][d]) output=$(./utils.sh blockform lick shed) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh blockform smell doore null null $key8) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][f][o][r][e][s][t]) output=$(./utils.sh blockform smell foreste) ;;

[s][m][e][l][l][s][h][e][d]) output=$(./utils.sh blockform smell doore) ;;

#constantcomm

esac
done

