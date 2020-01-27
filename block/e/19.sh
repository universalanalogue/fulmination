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
book18=$(grep 'book18=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e15=$(grep 'e15=' status | cut -d "=" -f2)
e18=$(grep 'e18=' status | cut -d "=" -f2)
e23=$(grep 'e23=' status | cut -d "=" -f2)
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

[g][e][t][b][o][o][k]) 
if [ $book18 -eq 2 ] ; then output=$(./utils.sh blockform uni get1) 
else
if [ "$book18" -eq 0 ] ; then
sed -i '/book18/c\book18=1' status
output=$(./utils.sh blockform uni get2 book) 
else
output=$(./utils.sh blockform uni get3 book) ; fi ; fi ;;

[g][o][e][a][s][t]) output=$(./utils.sh blockform elooka forest2) ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=23' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=15' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=18' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 19 wolf $wolf) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east 1 9) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north $e23 3) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e15 1) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west $e18 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book18 -eq 0 ] || [ $book18 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][b][u][s][h]) output=$(./utils.sh blockform looki null bush1 0 book14 $book18) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh blockform looki null forest4 0 wolf1 $wolf) ;;

[l][o][o][k][e][y][e][s]) if [ $wolf -eq 2 ]
then
output=$(./utils.sh blockform looki wolf1 $wolf)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene "elooka house west" "Look House" back
intro=0 ;;

[r][e][a][d][b][o][o][k]) if [ $book18 -eq 0 ] || [ $book18 -eq 1 ]
then
./utils.sh reader book18r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book18 -eq 0 ] || [ $book18 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][b][u][s][h]) output=$(./utils.sh blockform lick hedge) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick hedge) ;;

[l][i][c][k][f][o][r][e][s][t]) output=$(./utils.sh blockform lick forest) ;;

[s][m][e][l][l]) if [ $wolf -eq 2 ]
then
output=$(./utils.sh blockform smell wolf1)
else
output=$(./utils.sh blockform smell e)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book18 -eq 0 ] || [ $book18 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][b][u][s][h]) output=$(./utils.sh blockform smell bushe) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][f][o][r][e][s][t]) output=$(./utils.sh blockform smell foreste wolf $wolf) ;;

#constantcomm

esac
done

