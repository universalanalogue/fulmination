#!/bin/bash

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
pic2=pic1a
aux1=$(if [ $i6panel -eq 1 ] ; then ./utils.sh overlay door1 43 11 0 ; fi)
fi

if [ $focus -eq 1 ]
then
pic=pic2a
aux2=$(if [ $book37 -eq 0 ] ; then ./utils.sh overlay table1 23 10 0 ; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
echo -e "$aux1")
echo "$image"
echo -e "$aux2"

}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book37=$(grep 'book37=' status | cut -d "=" -f2)
clockkey=$(grep 'clockkey' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key1=$(grep "key1=" status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i01=$(grep 'i01=' status | cut -d "=" -f2)
i07=$(grep 'i07=' status | cut -d "=" -f2)
i08=$(grep 'i08=' status | cut -d "=" -f2)
i6panel=$(grep 'i6panel=' status | cut -d "=" -f2)
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
if [ $intro -eq 0 ] ; then output=$(./utils.sh form) ; fi
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=08' status ; break ;;

[g][o][n][o][r][t][h]) if [ $key1 -eq 1 ]
then
if [ $rain -eq 1 ]
then
./utils.sh colorset 6
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh cutscene bathroom1 Intermission "graphpass i 07pic2a 6 4"
./utils.sh cutscene bathroom2 Intermission "null"
sed -i '/rain=/c\rain=0' status
./lib.sh journal1 3
sed -i '/book32=/c\book32=0' status
./utils.sh colorset 4
fi
sed -i '/cell=/c\cell=07' status
break 
else
output=$(./utils.sh form uni doorlocked)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=01' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i06) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form lookdoor corridor3 door9 $i08) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form lookdoor door1 door5 $i07 $key1) ;;

[l][o][o][k][w][e][s][t]) .output=$(./utils.sh form lookdoor corridor4 door3 $i01) ;;

[l][o][o][k][b][o][o][k]) if [ $book37 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form lookdoor door1 door10 $i07 $key1) ;;

[l][o][o][k][h][o][l][e]) if [ $i6panel -eq 0 ]
then
output=$(./utils.sh form uni look)
else
intro=1
sed -i '/focus=/c\focus=1' status
if [ $book37 -eq 0 ]
then
output=$(./utils.sh form looki null hole1 0 hole3 0)
else
output=$(./utils.sh form looki null hole2 0)
fi
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][l][o][c][k])./lib.sh key1b
if [ $key1 -eq 0 ]
then
output=$(./utils.sh form uni doorlock)
else
output=$(./utils.sh form uni doorunlock)
fi ;;

[l][o][o][k][p][a][n][e][l]) if [ $i6panel -eq 0 ]
then
output=$(./utils.sh form looki null panel1 0)
else
output=$(./utils.sh form looki null panel2 0)
fi ;;

[l][o][o][k][p][e][g]) output=$(./utils.sh form looki null peg1 0) ;;

[l][o][o][k][w][a][l][l]) if [ $i6panel -eq 0 ]
then
output=$(./utils.sh form looki null wall2 0)
else
output=$(./utils.sh form looki null wall3 0)
fi ;;

[o][p][e][n][p][a][n][e][l]) if [ $clockkey -eq 1 ]
then
if [ $i6panel -eq 1 ]
then
output=$(./utils.sh form looki null panel3 0)
fi
if [ $i6panel -eq 0 ]
then
./lib.sh journal1 6
sed -i "/i6panel=/c\i6panel=1" status
intro=1
output=$(./utils.sh form looki null panel4 0)
fi
else
output=$(./utils.sh form uni open)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book37 -eq 1 ]
then
./utils.sh reader book37r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form lick door5) ;;

[l][i][c][k][b][o][o][k]) if [ $book37 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][h][o][l][e]) if [ $i6panel -eq 1 ]
then
output=$(./utils.sh form lick hole)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][p][a][n][e][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][p][e][g]) output=$(./utils.sh form lick peg1) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i06) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book37 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][e][a][s][t][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor2) ;;

[s][m][e][l][l][w][e][s][t][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor2) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh form smell door4) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][h][o][l][e]) if [ $i6panel -eq 1 ]
then
output=$(./utils.sh form smell hole)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][p][a][n][e][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][p][e][g]) output=$(./utils.sh form smell peg) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book37 -eq 0 ]
then
sed -i '/book37=/c\book37=1' status
intro=1
output=$(./utils.sh form uni get2 book) 
else
output=$(./utils.sh form uni get1)
fi ;;

[l][o][o][k]) if [ $book37 -eq 0 ]
then
output=$(./utils.sh form looki null hole1 0 hole3 0)
else
output=$(./utils.sh form looki null hole2 0)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book37 -eq 0 ] || [ $book37 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor9 0) ;;

[l][o][o][k][h][o][l][e]) if [ $book37 -eq 0 ]
then
output=$(./utils.sh form looki null hole1 0 hole3 0)
else
output=$(./utils.sh form looki null hole2 0)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book37 -eq 0 ] || [ $book37 -eq 1 ]
then
./utils.sh reader book37r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book37 -eq 0 ] || [ $book37 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][h][o][l][e]) output=$(./utils.sh form lick hole) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell hole) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book37 -eq 0 ] || [ $book37 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][h][o][l][e]) output=$(./utils.sh form smell hole) ;;

*) case1=(system${case1}) ;;

esac
fi

if [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

#constantcomm

esac
fi

done

