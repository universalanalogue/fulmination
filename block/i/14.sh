#!/bin/bash
#version=1.08.01

background() {
./utils.sh colorset 8
image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
if [ $hammer -eq 0 ] ; then ./utils.sh overlay hammer1 48 11 0 ; fi
if [ $book113 -eq 0 ] ; then ./utils.sh overlay book7 13 7 0 ; fi)
echo "$image"
}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book113=$(grep 'book113=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
e30=$(grep 'e30=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 8
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][o][s][o][u][t][h]) sed -i '/color=/c\color=1' status
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=30' status
break ;;

[g][e][t][b][o][o][k]) if [ $book113 -eq 0 ]
then
sed -i '/book113=/c\book113=1' status
intro=1
output=$(./utils.sh form uni get2 book)
./lib.sh journal1 2
else
output=$(./utils.sh form uni get1)
fi ;;

[g][e][t][h][a][m][m][e][r]) if [ $hammer -eq 0 ]
then
sed -i '/hammer=/c\hammer=1' status
intro=1
output=$(./utils.sh form uni get2 hammer)
else
output=$(./utils.sh form uni get3 hammer)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki i14 book2 $book113 hammer1 $hammer) ;;

[l][o][o][k][b][o][o][k]) if [ $book113 -eq 0 ] || [ $book113 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor5 0) ;;

[l][o][o][k][h][a][m][m][e][r]) if [ $hammer -eq 0 ] || [ $hammer -eq 1 ]
then
output=$(./utils.sh form looki null hammer2 0)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][s][o][u][t][h][d][o][o][r]) 
output=$(./utils.sh form lookdoor door16 door12 $e30 $key2) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall6 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book113 -eq 0 ] || [ $book113 -eq 1 ]
then
./utils.sh reader book113r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book113 -eq 0 ] || [ $book113 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][h][a][m][m][e][r]) ./utils.sh blockclear

if [ $hammer -eq 0 ] || [ $hammer -eq 1 ]
then
output=$(./utils.sh form lick hammer1)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh form lick door3) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor3) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick door3) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i14) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book31 -eq 0 ] || [ $book31 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][h][a][m][m][e][r]) ./utils.sh blockclear
if [ $hammer -eq 0 ] || [ $hammer -eq 1 ]
then
output=$(./utils.sh form smell hammer)
else
output=$(./utils.sh form uni smell )
fi ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh form smell doore) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor4) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall4) ;;

#constantcomm

esac
done

