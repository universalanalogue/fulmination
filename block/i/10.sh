#!/bin/bash

function background() {
if [ $focus -eq 0 ]
then
./utils.sh colorset 6
image=$(block/$block/./graphics.sh ${cell}pic1a)
fi
if [ $focus -eq 1 ]
then
./utils.sh colorset 4
image=$(block/$block/./graphics.sh ${cell}pic2a)
fi
echo "$image"
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book38=$(grep 'book38=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
}
helpcount=0
intro=0
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
./utils.sh prompt "$last" "$bar" "$output" 6
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book38 -eq 0 ]
then
sed -i '/book38=/c\book38=1' status
output=$(./utils.sh blockform uni get2 book)
else
output=$(./utils.sh blockform uni get1)
fi ;;

[g][o][s][o][u][t][h]) output=$(./utils.sh blockform looki null door25 0) ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=10a' status
./utils.sh cutscene "ghost1 returnwest" Intermission "graphpass i 10pic3a 6 6"
break ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i10) ;;

[l][o][o][k][b][o][d][y]) output=$(./utils.sh blockform looki null body2 0) ;;

[l][o][o][k][b][o][o][k]) if [ $book38 -eq 0 ] || [ $book38 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor4 0) ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh blockform looki fireplace5 null 0) ;;

[l][o][o][k][h][o][b]) output=$(./utils.sh blockform looki null hob1 0) ;;

[l][o][o][k][h][a][t][c][h]) if [ $book38 -eq 0 ]
then
output=$(./utils.sh blockform looki null hatch1 0)
else
output=$(./utils.sh blockform looki null hatch2 0)
fi ;; 

[l][o][o][k][i][c][e][c][h][e][s][t]) output=$(./utils.sh blockform looki null chest1 0) ;;

[l][o][o][k][s][o][u][t][h][d][o][o][r]) output=$(./utils.sh blockform looki null door25 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall4 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform looki null window13 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform looki null window14 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book38 -eq 0 ] || [ $book38 -eq 1 ]
then
./utils.sh reader book38r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

[s][m][a][s][h][w][i][n][d][o][w]) output=$(./utils.sh blockform uni smashwin1) ;;

#olfactory

[l][i][c][k][b][o][d][y]) output=$(./utils.sh blockform lick body1) ;;

[l][i][c][k][b][o][o][k]) if [ $book38 -eq 0 ] || [ $book38 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh blockform lick fireplace2) ;;

[l][i][c][k][h][o][b]) output=$(./utils.sh blockform lick hob) ;;

[l][i][c][k][h][a][t][c][h]) output=$(./utils.sh blockform lick hatch1) ;;

[l][i][c][k][i][c][e][c][h][e][s][t]) output=$(./utils.sh blockform lick chest) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh blockform lick door7) ;;

[l][i][c][k][f][l][o][o][r]) .output=$(./utils.sh blockform lick floor2) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall1) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window2) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i10) ;;

[s][m][e][l][l][b][o][d][y]) output=$(./utils.sh blockform smellbody1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book38 -eq 0 ] || [ $book38 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh blockform smell fireplace2) ;;

[s][m][e][l][l][h][o][b]) output=$(./utils.sh blockform smell hob1) ;;

[s][m][e][l][l][h][a][t][c][h])  output=$(./utils.sh blockform smell hatch1) ;;

[s][m][e][l][l][i][c][e][c][h][e][s][t])  output=$(./utils.sh blockform smell chest1) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r])  output=$(./utils.sh blockform smell door8) ;;

[s][m][e][l][l][f][l][o][o][r])  output=$(./utils.sh blockform smell floor3) ;;

[s][m][e][l][l][w][a][l][l])  output=$(./utils.sh blockform smell wall3) ;;

[s][m][e][l][l][w][i][n][d][o][w])  output=$(./utils.sh blockform smell window2) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then
case $case1 in

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=10a' status
./utils.sh cutscene "ghost1 returnwest" Intermission "graphpass i 10pic3a 5 5"
break ;;

[l][o][o][k]) output=$(./utils.sh blockform looki null window13 0) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform looki null door1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh blockform looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform looki window14 0) ;;

[s][m][a][s][h][w][i][n][d][o][w]) output=$(./utils.sh blockform uni smashwin1) ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window2) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i10) ;;

[s][m][e][l][l][w][i][n][d][o][w])  output=$(./utils.sh blockform smell window2) ;;

#constantcomm

esac
fi

done

