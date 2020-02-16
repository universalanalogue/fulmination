#!/bin/bash

function background() {
./utils.sh colorset 2
image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
if [ $book28 -eq 0 ] ; then ./utils.sh overlay scuff 31 8 0 ; fi)
echo "$image"
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book28=$(grep 'book28=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i31=$(grep 'i31=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 2
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book28 -eq 0 ]
then
sed -i '/book28=/c\book28=1' status
output=$(./utils.sh form uni get2 book)
./lib.sh journal1 1
intro=1
else
output=$(./utils.sh form uni get1)
fi ;;

[g][o][s][o][u][t][h]) sed -i '/color=/c\color=5' status
sed -i '/cell=/c\cell=31' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i43) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor8 0) ;;

[l][o][o][k][l][a][d][d][e][r]) output=$(./utils.sh form looki null ladder1 0) ;;

[l][o][o][k][b][o][d][y]) output=$(./utils.sh form looki null body1 0 book3 $book28) ;;

[l][o][o][k][b][o][o][k]) if [ $book28 -eq 0 ] || [ $book28 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall9 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book28 -eq 0 ] || [ $book28 -eq 1 ]
then
./utils.sh reader book28r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][d][y]) output=$(./utils.sh form lick body2) ;;

[l][i][c][k][b][o][o][k]) if [ $book28 -eq 0 ] || [ $book28 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick forest) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i43) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book28 -eq 0 ] || [ $book28 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][b][o][d][y]) output=$(./utils.sh form smell body1) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell treee) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

#constantcomm

esac
done

