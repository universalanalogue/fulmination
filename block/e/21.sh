#!/bin/bash
#version=1.08.01

background() {
image=$(block/$block/./graphics.sh ${cell}pic1
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
if [ $i24bwindow -eq 1 ] ; then ./utils.sh overlay win11 2 3 0 ; fi)
echo "$image"
}

vars() {

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
e17=$(grep 'e17=' status | cut -d "=" -f2)
e22=$(grep 'e22=' status | cut -d "=" -f2)
e28=$(grep 'e28=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i24bwindow=$(grep 'i24bwindow=' status | cut -d "=" -f2)
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
if [ $intro -eq 0 ] ; then output=$(./utils.sh form) ; fi
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=22' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cella=/c\cella=28' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cella=/c\cella=17' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form elook 21) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form elookdir east $e22 3) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form elookdir north $e28 3) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form elookdir east $e17 3) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form elookdir east 1 4) ;;

[l][o][o][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh form uni far) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh form elooka house west) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form uni far) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form uni far) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni far) ;;

#olfactory

[l][i][c][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh form uni far) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh form lick house) ;;

[l][i][c][k][t][r][e][e]) output=$(./utils.sh form uni far) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form uni far) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell e) ;;

[s][m][e][l][l][d][r][i][v][e][w][a][y]) output=$(./utils.sh form uni far) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh form smell housee) ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh form uni far) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form uni far) ;;

#constantcomm

esac
done

