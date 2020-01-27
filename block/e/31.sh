#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1)
echo "$image"
fi

if [ $focus -eq 1 ]
then
if [ $book19 -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2b)
else
image=$(block/$block/./graphics.sh ${cell}pic2a)
fi
echo "$image"
fi

}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book19=$(grep 'book19=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e24=$(grep 'e24=' status | cut -d "=" -f2)
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

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=32' status ; break ;;

[g][o][n][o][r][t][h]) output=$(./utils.sh blockform elooka hedge3) ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=24' status ; break ;;

[g][o][w][e][s][t]) output=$(./utils.sh blockform elooka hedge3) ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 31) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east $e32 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north 1 2) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e24 3) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west 1 2) ;;

[l][o][o][k][b][o][o][k]) if [ $book19 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform elooka hedge2) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][h][o][l][e]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $book19 -eq 0 ]
then
output=$(./utils.sh blockform elooka hole1)
else
output=$(./utils.sh blockform elooka hole2)
fi ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene "elooka house south" "Look House" side
intro=0 ;;

[r][e][a][d][b][o][o][k]) if [ $book19 -eq 1 ]
then
./utils.sh reader book19r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book19 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh blockform lick hedge) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh blockform smell hedgee) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book19 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book19 -eq 0 ]
then
sed -i '/book19=/c\book19=1' status
output=$(./utils.sh blockform uni get2 book)
intro=1
else
output=$(./utils.sh blockform uni get1)
fi ;;

[l][o][o][k]) if [ $book19 -eq 0 ]
then
output=$(./utils.sh blockform elooka hole1)
else
output=$(./utils.sh blockform elooka hole2)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book19 -eq 0 ] || [ $book19 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform elooka hedge2) ;;

[l][o][o][k][h][o][l][e]) if [ $book19 -eq 0 ]
then
output=$(./utils.sh blockform elooka hole1)
else
output=$(./utils.sh blockform elooka hole2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book19 -eq 0 ] || [ $book19 -eq 1 ]
then
./utils.sh reader book19r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book19 -eq 0 ] || [ $book19 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh blockform lick hedge) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh blockform smell hedgee) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book19 -eq 0 ] || [ $book19 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

#constantcomm

esac
fi

done
