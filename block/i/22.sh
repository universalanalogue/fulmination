#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
if [ $i22mirror -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
else
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
echo "$image"
if [ $i22window -eq 1 ] ; then ./utils.sh overlay win5 33 8 0 ; fi
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
if [ $i22window -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 ; fi
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 6
if [ $i22mirror -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic3a)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic3b)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic3c)
fi
echo "$image"
fi

}

function vars(){

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book23=$(grep 'book23=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i39=$(grep 'i39=' status | cut -d "=" -f2)
i22mirror=$(grep 'i22mirror=' status | cut -d "=" -f2)
i22window=$(grep 'i22window=' status | cut -d "=" -f2)
licktoilet=$(grep 'licktoilet=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=39' status ; break ;;

[g][o][w][e][s][t]) if [ $i22window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i22 curtains1 0 window1 $i22window) ;;

[l][o][o][k][b][o][o][k]) if [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][c][u][r][t][a][i][n][s]) output=$(./utils.sh blockform looki null curtains2 0) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform lookdoor door1 door15 $i39 1) ;;

[l][o][o][k][c][a][b][i][n][e][t]) output=$(./utils.sh blockform looki null cabinet1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor6 0) ;;

[l][o][o][k][m][i][r][r][o][r]) sed -i '/focus=/c\focus=2' status
intro=1
if [ $i22mirror -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror4 0)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror5 0)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform looki null mirror3 0)
fi ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh blockform lookdoor door1 door15 $i39 1) ;;

[l][o][o][k][t][o][i][l][e][t]) output=$(./utils.sh blockform looki null toilet1 0) ;;

[l][o][o][k][t][u][b]) output=$(./utils.sh blockform looki null tub1 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform looki null window17 0 window7 $i22window) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i22window -eq 0 ]
then
sed -i '/i22window=/c\i22window=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book22 -eq 1 ]
then
./utils.sh reader book22r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

[s][m][a][s][h][m][i][r][r][o][r]) if [ $hammer -eq 1 ]
then
if [ $i22mirror -eq 0 ]
then
sed -i '/i22mirror=/c\i22mirror=1' status
intro=1
output=$(./utils.sh blockform uni smashmin1)
else
output=$(./utils.sh blockform uni smashmir1)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][c][a][b][i][n][e][t]) output=$(./utils.sh blockform lick cabinet1) ;;

[l][i][c][k][c][u][r][t][a][i][n][s]) output=$(./utils.sh blockform lick curtains1) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh blockform lick cabinet1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor1) ;;

[l][i][c][k][m][i][r][r][o][r]) if [ $i22mirror -eq 0 ]
then
output=$(./utils.sh blockform lick mirror3)
else
output=$(./utils.sh blockform lick mirror4)
fi  ;;

[l][i][c][k][t][o][i][l][e][t]) if [ $licktoilet -eq 2 ]
then
./utils.sh cutscene toiletlick3 Death "graphpass i 07pic1a"
./utils.sh setdeath
break
fi
if [ $licktoilet -eq 1 ]
then
output=$(./utils.sh blockform lick toilet2)
sed -i '/licktoilet=/c\licktoilet=2' status
fi
if [ $licktoiliet -eq 0 ]
then
output=$(./utils.sh blockform lick toilet1)
sed -i '/licktoilet=/c\licktoilet=1' status
fi ;;

[l][i][c][k][t][u][b]) output=$(./utils.sh blockform lick tub1) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall1) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) if [ $i22window -eq 1 ]
then
output=$(./utils.sh blockform smell e)
else
output=$(./utils.sh blockform smell i07)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][a][b][i][n][e][t]) output=$(./utils.sh blockform smell cabinet1) ;;

[s][m][e][l][l][c][u][r][t][a][i][n][s]) output=$(./utils.sh blockform smell curtains1) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh blockform smell door5) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floor2) ;;

[s][m][e][l][l][m][i][r][r][o][r]) output=$(./utils.sh blockform smell mirror1) ;;

[s][m][e][l][l][t][o][i][l][e][t]) output=$(./utils.sh blockform smell toilet1) ;;

[s][m][e][l][l][t][u][b]) output=$(./utils.sh blockform smell tub1) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall1) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i22window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki null window17 0 window7 $i22window) ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh blockform looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh blockform looki null gate1 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh blockform looki null rain4 0) ;;

[l][o][o][k][r][o][a][d]) output=$(./utils.sh blockform looki null road1 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform looki null tree2 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i22window -eq 0 ]
then
sed -i '/i22window=/c\i22window=1' status
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

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $i22mirror -eq 1 ]
then
if [ $book23 -eq 0 ]
then
sed -i '/book23=/c\book23=1' status
output=$(./utils.sh blockform uni get2 book)
intro=1
else
output=$(./utils.sh blockform uni get1)
fi
else
greed=$((greed + 1))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh blockform uni get1)
fi ;;

[l][o][o][k]) if [ $i22mirror -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror4 0)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror5 0)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform looki null mirror3 0)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ] || [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][m][i][r][r][o][r]) if [ $i22mirror -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror4 0)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror5 0)
fi
if [ $i22mirror -eq 1 ] && [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform looki null mirror3 0)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ] || [ $book22 -eq 1 ]
then
./utils.sh reader book22r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

[s][m][a][s][h][m][i][r][r][o][r]) if [ $hammer -eq 1 ]
then
if [ $i22mirror -eq 0 ]
then
sed -i '/i22mirror=/c\i22mirror=1' status
intro=1
output=$(./utils.sh blockform uni smashmin1)
else
output=$(./utils.sh blockform uni smashmir1)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ] || [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][m][i][r][r][o][r]) if [ $i22mirror -eq 0 ]
then
output=$(./utils.sh blockform lick mirror3)
else
output=$(./utils.sh blockform lick mirror4)
fi  ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell mirror1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $i22mirror -eq 1 ] && [ $book23 -eq 0 ] || [ $book23 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][m][i][r][r][o][r]) output=$(./utils.sh blockform smell mirror1) ;;

#constantcomm

esac
fi

done

