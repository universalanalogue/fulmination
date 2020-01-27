#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
./utils.sh colorset 4
if [ $i11cupboard -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
else
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
echo "$image"
if [ $i11window -eq 1 ] ; then ./utils.sh overlay win2 3 8 0 ; fi
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
if [ $i11window -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 ; fi
fi

if [ $focus -eq 2 ]
then
image=$(block/$block/./graphics.sh ${cell}pic3a)
echo "$image"
if [ $book15 -eq 0 ] ; then ./utils.sh overlay book3 45 15 0 ; fi
if [ $gear -eq 0 ]
then
./utils.sh colorset 2
./utils.sh overlay gear1 20 18 0
fi
fi

}


function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gear=$(grep 'gear=' status | cut -d "=" -f2)
book15=$(grep 'book15=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i04=$(grep 'i04=' status | cut -d "=" -f2)
i12=$(grep 'i12=' status | cut -d "=" -f2)
i33=$(grep 'i33=' status | cut -d "=" -f2)
i11cupboard=$(grep 'i11cupboard=' status | cut -d "=" -f2)
i11window=$(grep 'i11window=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=12' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/color=/c\color=5' status
sed -i '/cell=/c\cell=33' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=04' status ; break ;;

[g][o][w][e][s][t]) if [ $i11window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=20' status
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i11 window1 $i11window) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform lookdoor door1 door13 $i12 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform looki null stairs1 0) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform lookdoor door1 door6 $i04 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book15 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][c][u][p][b][o][a][r][d]) if [ $i11cupboard -eq 0 ]
then
output=$(./utils.sh blockform looki null cupboard1 0)
else
sed -i '/focus=/c\focus=2' status
intro=1
if [ $book15 -ne 0 ] && [ $gear -ne 0 ]
then
output=$(./utils.sh blockform looki null cupboard4 0)
else
output=$(./utils.sh blockform looki null cupboard2 $book15 cupboard3 $gear)
fi
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor1 0) ;;

[l][o][o][k][s][t][a][i][r][s]) output=$(./utils.sh blockform looki null stairs1 0 cupboard5 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w])sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform looki null window16 0 window7 $i11window) ;;

[o][p][e][n][c][u][p][b][o][a][r][d]) if [ $i11cupboard -eq 1 ]
then
output=$(./utils.sh blockform looki null cupboard7 0)
fi
if [ $i11cupboard -eq 0 ]
then
sed -i "/i11cupboard=/c\i11cupboard=1" status
intro=1
output=$(./utils.sh blockform looki null cupboard6 0)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book15 -eq 1 ]
then
./utils.sh reader book112r
intro=0
output=$(./utils.sh blockform)
else
output=$(./utils.sh blockform uni read)
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i11window -eq 0 ]
then
sed -i '/i11window=/c\i11window=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book15 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floori) ;;

[l][i][c][k][g][e][a][r]) if [ $gear -eq 1 ]
then
output=$(./utils.sh blockform lick peg)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][s][t][a][i][r][s]) output=$(./utils.sh blockform lick stairs1) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i01 null $i11window) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book15 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][g][e][a][r]) if [ $gear -eq 1 ]
then
output=$(./utils.sh blockform smell key)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][u][p][b][o][a][r][d]) output=$(./utils.sh blockform smell cupboard1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floori) ;;

[s][m][e][l][l][s][t][a][i][r][s]) output=$(./utils.sh blockform smell stairs1) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall1) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i11window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=20' status
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki null window16 0 window7 $i11window) ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh blockform looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh blockform looki null rain4 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform looki null tree3 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i11window -eq 0 ]
then
sed -i '/i11window=/c\i11window=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[s][m][e][l][l]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book15 -eq 0 ]
then
sed -i '/book15=/c\book15=1' status
intro=1
output=$(./utils.sh blockform uni get2 book) 
else
output=$(./utils.sh blockform uni get1)
fi ;;

[g][e][t][g][e][a][r]) if [ $gear -eq 0 ]
then
sed -i '/gear=/c\gear=1' status
intro=1
output=$(./utils.sh blockform uni get2 gear)
else
output=$(./utils.sh blockform uni get3 gear)
fi ;;

[l][o][o][k]) if [ $book15 -ne 0 ] && [ $gear -ne 0 ]
then
output=$(./utils.sh blockform looki null cupboard4 0)
else
output=$(./utils.sh blockform looki null cupboard2 $book15)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book15 -eq 0 ]] || [ $book15 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][c][u][p][b][o][a][r][d]) if [ $book15 -ne 0 ] && [ $gear -ne 0 ]
then
output=$(./utils.sh blockform looki null cupboard4 0)
else
output=$(./utils.sh blockform looki null cupboard2 $book15 cupboard3 $gear)
fi ;;

[l][o][o][k][g][e][a][r]) if [ $gear -eq 0 ] || [ $gear -eq 1 ]
then
output=$(./utils.sh blockform looki null gear1 0)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor9 0 cupboard3 $gear) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book15 -eq 0 ] || [ $book15 -eq 1 ]
then
./utils.sh reader book112r
intro=0
output=$(./utils.sh blockform)
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][g][e][a][r]) if [ $gear -eq 0 ] || [ $gear -eq 1 ]
then
output=$(./utils.sh blockform lick peg)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][g][e][a][r]) if [ $gear -eq 0 ] || [ $gear -eq 1 ]
then
output=$(./utils.sh blockform lick peg)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell cupboard1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book15 -eq 0 ] || [ $book15 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][g][e][a][r]) if [ $gear -eq 0 ] || [ $gear -eq 1 ]
then
output=$(./utils.sh blockform smell key)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][u][p][b][o][a][r][d]) output=$(./utils.sh blockform smell cupboard1) ;;

#constantcomm

esac
fi

done

