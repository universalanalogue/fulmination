#!/bin/bash

function background() {

if [ $focus -eq 0 ] 
then
./utils.sh colorset 4
if [ $rain -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
else
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
echo "$image"
if [ $i2window -eq 1 ] ; then ./utils.sh overlay win2 3 7 0 ; fi
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
if [ $rain -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
else
image=$(block/$block/./graphics.sh ${cell}pic2b)
fi
echo "$image"
if [ $i2window -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 ; fi
fi

if [ $focus -eq 2 ]
then
if [ $book32 -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic3a)
else
image=$(block/$block/./graphics.sh ${cell}pic3b)
fi
echo "$image"
fi
}

function vars() {
#inventory

ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book32=$(grep 'book32=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep "block=" status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i01=$(grep 'i01=' status | cut -d "=" -f2)
i03=$(grep 'i03=' status | cut -d "=" -f2)
i2window=$(grep 'i2window=' status | cut -d "=" -f2)
rain=$(grep 'rain=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=01' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=03' status ; break ;;

[g][o][w][e][s][t]) if [ $i2window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=08' status
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i02 window1 $i2window) ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh blockform looki null bookcase1 0) ;;

[l][o][o][k][c][h][a][i][r]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null chair1 0)
else
if [ $book32 -eq 0 ]
then
output=$(./utils.sh blockform looki null chair2 0)
else
output=$(./utils.sh blockform looki null chair3 0)
fi
fi ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lookdoor door1 door3 $i01 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book32 -eq 1 ] 
then
output=$(./utils.sh blockform looki null book5 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][l][e][g]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform uni look)
else
if [ $focus -eq 0 ]
then
sed -i '/focus=/c\focus=2' status
intro=1
if [ $book32 -eq 0 ] 
then
output=$(./utils.sh blockform looki null chair4 0)
else
output=$(./utils.sh blockform looki null chair5 0)
fi
else
output=$(./utils.sh blockform uni look)
fi
fi ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh blockform lookdoor door1 door4 $i03 1) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $rain -eq 1 ] 
then
output=$(./utils.sh blockform looki null window3 0 rain1 0 window7 $i2window)
else
output=$(./utils.sh blockform looki null window3 0 rain2 0 window7 $i2window)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book32 -eq 1 ]
then
./utils.sh reader book32r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

[s][i][t][c][h][a][i][r]) if [ $rain -eq 0 ]
then 
output=$(./utils.sh blockform uni ic)
break
else
./utils.sh cutscene sit2 Death logo
./utils.sh setdeath
break
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ] 
then
if [ $i2window -eq 0 ]
then
sed -i '/i2window=/c\i2window=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book32 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][c][h][a][i][r]) output=$(./utils.sh blockform lick chair1) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floori) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i01 null $i2window) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book32 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh blockform smell forreste) ;;

[s][m][e][l][l][c][h][a][i][r]) output=$(./utils.sh blockform smell chair1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i2window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=08' status
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ] 
then
output=$(./utils.sh blockform looki null window3 0 rain1 0 window7 $i2window)
else
output=$(./utils.sh blockform looki null window3 0 rain2 0 window7 $i2window)
fi ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh blockform looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh blockform looki null gate1 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null rain3 0)
else
output=$(./utils.sh blockform looki null rain4 0)
fi ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform looki null tree1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ] 
then
if [ $i2window -eq 0 ]
then
sed -i '/i2window=/c\i2window=1' status
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

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book32 -eq 0 ] 
then
sed -i '/book32=/c\book32=1' status
intro=1
output=$(./utils.sh blockform uni get2 book) 
else
output=$(./utils.sh blockform uni get1)
fi ;;

[l][o][o][k]) if [ $book32 -eq 0 ]
then
output=$(./utils.sh blockform looki null chair4 0)
else
output=$(./utils.sh blockform looki null chair5 0)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book32 -eq 0 ] 
then
output=$(./utils.sh blockform looki null book4 0)
fi
if [ $book32 -eq 1 ] 
then
output=$(./utils.sh blockform looki null book5 0)
fi ;;

[l][o][o][k][c][h][a][i][r]) if [ $book32 -eq 0 ]
then
output=$(./utils.sh blockform looki null chair2 0)
else
output=$(./utils.sh blockform looki null chair3 0)
fi ;;

[l][o][o][k][l][e][g]) sed -i '/focus=/c\focus=2' status
intro=1
if [ $book32 -eq 0 ] 
then
output=$(./utils.sh blockform looki null chair4 0)
else
output=$(./utils.sh blockform looki null chair5 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book32 -eq 0 ] || [ $book32 -eq 1 ]
then
./utils.sh reader book32r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book32 -eq 0 ] || [ $book32 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][c][h][a][i][r]) output=$(./utils.sh blockform lick chair1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floori) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book32 -eq 0 ] || [ $book32 -eq 1 ]
then
output=$(./utils.sh blockform smell book) 
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floori) ;;

[s][m][e][l][l][c][h][a][i][r]) output=$(./utils.sh blockform smell chair1) ;;

#constantcomm

esac
fi
done

