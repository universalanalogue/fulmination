#!/bin/bash

function background() {


if [ $focus -eq 0 ]
then
./utils.sh colorset 4
image=$(block/${block}/./graphics.sh ${cell}pic1a)
echo "$image"
if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win2 3 7 0 ; fi
if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win4 45 2 0 ; fi
if [ "$book17" -eq 0 ] ; then ./utils.sh overlay book2 33 13 0 ; fi
if [ "$key1" -eq 0 ] ; then ./utils.sh overlay key1 17 16 0 ; fi
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
if [ $rain -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
else
image=$(block/$block/./graphics.sh ${cell}pic2b)
fi
echo "$image"

if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win3 48 4 0 ; fi
if [ $i9box ] ; then ./utils.sh overlay box2 46 8 1 ; fi
if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 ; fi
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 1
if [ $rain -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic3a)
else
image=$(block/$block/./graphics.sh ${cell}pic3b)
fi
echo "$image"
if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 ; fi
fi
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book17=$(grep 'book17=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key1=$(grep 'key1=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e13=$(grep 'e13=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i06=$(grep 'i06=' status | cut -d "=" -f2)
i5bwindow=$(grep 'i5bwindow=' status | cut -d "=" -f2)
i8awindow=$(grep 'i8awindow=' status | cut -d "=" -f2)
i8bwindow=$(grep 'i8bwindow=' status | cut -d "=" -f2)
i9box=$(grep 'i9box=' status | cut -d "=" -f2)
rain=$(grep 'rain=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][k][e][y]) if [ $key1 -eq 0 ]
then
sed -i '/key1=/c\key1=1' status
intro=1
output=$(./utils.sh blockform uni get2 key)
else
output=$(./utils.sh blockform uni get3 key)
fi ;;

[g][e][t][b][o][o][k]) if [ $book17 -eq 0 ]
then
sed -i '/book17=/c\book17=1' status
intro=1
output=$(./utils.sh blockform uni get2 book) 
else
output=$(./utils.sh blockform uni get1)
fi ;;

[g][o][e][a][s][t]) if [ $rain -eq 0 ]
then
sed -i '/cell=/c\cell=13' status
sed -i '/block=/c\block=e' status
break 
else
./utils.sh cutscene i8a Death logo
./utils.sh setdeath
break
fi ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=06' status ; break ;;

[g][o][w][e][s][t]) if [ $i8awindow -eq 1 ]
then
sed -i '/cell=/c\cell=09' status
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i08 window1 $i8awindow) ;;

[l][o][o][k][b][o][o][k]) if [ $book17 -eq 0 ] || [ $book17 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][c][o][r][r][i][d][o][r]) output=$(./utils.sh blockform lookdoor corridor4 door11 $i06) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lookdoor door1 door12 $e13 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][k][e][y]) ./lib.sh key1a
if [ $key1 -eq 0 ] ; then output=$(./utils.sh blockform lookkey i08) ; fi
if [ $key1 -eq 1 ] ; then output=$(./utils.sh blockform uni get3 key) ; fi ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r]) 
output=$(./utils.sh blockform looki null door23 0 door24 $book17) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh blockform looki null table3 0 table4 $key1) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[l][o][o][k][e][a][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=2' status
intro=1
if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null window8 0 rain1 0)
else
output=$(./utils.sh blockform looki null window8 0 rain2 0 window8 $i8bwindow)
fi ;;

[l][o][o][k][w][e][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null window9 0 rain1 0)
else
output=$(./utils.sh blockform looki null window9 0 rain2 0 window7 $i8awindow box1 $i9box)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book17 -eq 0 ] || [ $book17 -eq 1 ]
then
./utils.sh reader book17r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[o][p][e][n][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][e][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8awindow -eq 0 ]
then
sed -i '/i8awindow=/c\i8awindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8awindow -eq 0 ]
then
sed -i '/i8awindow=/c\i8awindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book17 -eq 0 ] || [ $book17 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh blockform lick door4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floori) ;;

[l][i][c][k][k][e][y]) if [ $key1 -eq 0 ] || [ $key1 -eq 1 ]
then
output=$(./utils.sh blockform uni lickkey)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][t][a][b][l][e]) output=$(./utils.sh blockform lick table) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall) ;;

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) if [ $i8awindow -eq 1 ]
then
output=$(./utils.sh blockform smell i01 null 1)
else
output=$(./utils.sh blockform smell i01 null $i8bwindow)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book17 -eq 0 ] || [ $book17 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh blockform smell corridor1) ;;

[s][m][e][l][l][e][a][s][t]d][o][o][r]) output=$(./utils.sh blockform smell door6) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh blockform smell door7) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floori) ;;

[s][m][e][l][l][k][e][y]) if [ $key1 -eq 0 ] || [ $key1 -eq 1 ]
then
output=$(./utils.sh blockform uni smellkey)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][t][a][b][l][e]) output=$(./utils.sh blockform smell table) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i8awindow -eq 1 ]
then
sed -i '/cell=/c\cell=09' status
break 
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null window9 0 rain1 0)
else
output=$(./utils.sh blockform looki null window9 0 rain2 0 window7 $i8awindow box1 $i9box)
fi ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh blockform looki null box2 0 box1 $i9box) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform looki null door27 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null rain3 0)
else
output=$(./utils.sh blockform looki null rain4 0)
fi ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh blockform looki null window22 0 window7 $1window) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall5 0) ;;

[o][p][e][n][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][e][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8awindow -eq 0 ]
then
sed -i '/i8awindow=/c\i8awindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $rain -eq 0 ]
then
sed -i '/cell=/c\cell=13' status
sed -i '/block=/c\block=e' status
break 
else
./utils.sh cutscene i8a Death logo
./utils.sh setdeath
break
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null window8 0 rain1 0)
else
output=$(./utils.sh blockform looki null window8 0 rain2 0 window8 $i8bwindow)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh blockform looki null forest1 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh blockform looki null rain3 0)
else
output=$(./utils.sh blockform looki null rain4 0)
fi ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8awindow -eq 0 ]
then
sed -i '/i8awindow=/c\i8awindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi



done

