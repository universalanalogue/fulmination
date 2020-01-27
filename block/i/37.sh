#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
echo "$image"
if [ $i37window -eq 1 ] ; then ./utils.sh overlay win3 39 7 0 ; fi
fi

if [ $focus -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
if [ $i41window -eq 1 ] ; then ./utils.sh overlay win1 24 6 0 ; fi
if [ $i37window -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 ; fi
fi

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
greed=$(grep 'greed=' status | cut -d "=" -f2)
i29=$(grep 'i29=' status | cut -d "=" -f2)
i36=$(grep 'i36=' status | cut -d "=" -f2)
i38=$(grep 'i38=' status | cut -d "=" -f2)
i37window=$(grep 'i37window=' status | cut -d "=" -f2)
i41window=$(grep 'i41window=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=29' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=36' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=38' status ; break ;;

[g][o][w][e][s][t]) if [ $i37window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i37 window1 $i37window) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform lookdoor door1 door19 $i29 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform lookdoor corridor4 corridor5 $i36) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform lookdoor corridor4 corridor5 $i38) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform looki null window15 0 window7 $i37window) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i37window -eq 0 ]
then
sed -i '/i37window=/c\i37window=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floori) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) if [ $i37window -eq 1 ]
then
output=$(./utils.sh blockform smell e)
else
output=$(./utils.sh blockform smell i33)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh blockform smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh blockform smell corridor3) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floor5) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i37window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki null window15 0 window7 $i37window) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh blockform looki null rain4 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh blockform looki null window22 0 window7 $i41window) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i37window -eq 0 ]
then
sed -i '/i37window=/c\i37window=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

done

