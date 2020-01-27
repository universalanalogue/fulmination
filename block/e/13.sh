#!/bin/bash

function background() {
if [ $focus -eq 0 ]
then
./utils.sh colorset 1
if [ $i8bwindow -eq 0 ] && [ $i29window -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
fi
if [ $i8bwindow -eq 1 ] && [ $i29window -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
if [ $i8bwindow -eq 0 ] && [ $i29window -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1c)
fi
if [ $i8bwindow -eq 1 ] && [ $i29window -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1d)
fi
echo "$image"
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 4
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win1 22 3 0 ; fi
if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 ; fi
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
e09=$(grep 'e09=' status | cut -d "=" -f2)
i14=$(grep 'e14=' status | cut -d "=" -f2)
i17=$(grep 'e17=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i08=$(grep 'i08=' status | cut -d "=" -f2)
i8awindow=$(grep 'i8awindow=' status | cut -d "=" -f2)
i8bwindow=$(grep 'i8bwindow=' status | cut -d "=" -f2)
i29window=$(grep 'i29window=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=14' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=17' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=09' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=08' status
sed -i '/block=/c\block=i' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 13) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east $e14 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north $e17 13) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e09 1) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform elooka door2) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh blockform elooka house west) ;; 

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform elooka window2);;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8bwindow -eq 0 ]
then
sed -i '/i8bwindow=/c\i8bwindow=1' status
intro1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh blockform lick house) ;;

[l][i][c][k][t][r][e][e]) output=$(./utils.sh blockform lick tree) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh blockform smell housee) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform windowe) ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh blockform uni far) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=08' status
sed -i '/block=/c\block=i' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elooka window2);;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh blockform looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh blockform looki null window22 0 window7 $8awindow) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8bwindow -eq 0 ]
then
sed -i '/i8bwindow=/c\i8bwindow=1' status
intro1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform windowe) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform windowe) ;;

#constantcomm

esac
fi

done

