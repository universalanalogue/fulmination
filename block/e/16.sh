#!/bin/bash

function background() {
if [ $focus -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1)
echo "$image"
fi

if [ $focus -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
if [ $book26 -eq 0 ] ; then ./utils.sh overlay book4 26 13 0 ; fi
fi
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book26=$(grep 'book26=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e12=$(grep 'e12=' status | cut -d "=" -f2)
e20=$(grep 'e20=' status | cut -d "=" -f2)
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

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=20' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=12' status ; break ;;

[g][o][w][e][s][t]) output=$(./utils.sh blockform elooka hedge3) ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 16) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east 1 14) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north $e17 1) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir east $e12 14) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir east 1 2) ;;

[l][o][o][k][b][o][o][k]) if [ $book26 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform elooka hedge) ;;

[l][o][o][k][c][h][i][m][n][e][y]) output=$(./utils.sh blockform elooka chimney2) ;;

[l][o][o][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh blockform elooka drive) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][h][o][l][e]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform looki null chimney1 0 book13 $book26) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh blockform elooka house east) ;;

[r][e][a][d][b][o][o][k]) if [ $book26 -eq 1 ]
then
./utils.sh reader book26r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book26 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][c][h][i][m][n][e][y]) output=$(./utils.sh blockform lick drive) ;;

[l][i][c][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh blockform lick drive) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh blockform lick hedge) ;;

[l][i][c][k][h][o][l][e]) output=$(./utils.sh blockform lick hole) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh blockform lick house) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book26 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][h][i][m][n][e][y]) output=$(./utils.sh blockform smell drive) ;;

[s][m][e][l][l][d][r][i][v][e][w][a][y]) output=$(./utils.sh blockform smell drive) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh blockform smell hedgee) ;;

[s][m][e][l][l][h][o][l][e]) output=$(./utils.sh blockform smell hole) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh blockform smell housee) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book26 -eq 0 ]
then
sed -i '/book26=/c\book26=1' status
output=$(./utils.sh blockform uni get2 book)
intro=1
else
output=$(./utils.sh blockform uni get)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform elooka chimney2 16 $book26) ;;

[l][o][o][k][b][o][o][k]) if [ $book26 -eq 0 ] || [ $book26 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][h][o][l][e]) output=$(./utils.sh blockform elooka chimney2 16 $book26) ;;

[r][e][a][d][b][o][o][k]) if [ $book26 -eq 0 ] || [ $book26 -eq 1 ]
then
./utils.sh reader book26r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book26 -eq 0 ] || [ $book26 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][c][h][i][m][n][e][y]) output=$(./utils.sh blockform lick drive) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell drive) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book26 -eq 0 ] || [ $book26 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][h][i][m][n][e][y]) output=$(./utils.sh blockform smell drive) ;;

#constantcomm

esac
fi

done

