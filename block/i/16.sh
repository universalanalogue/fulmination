#!/bin/bash

function background() {

image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0)
echo "$image"

if [ $sprocket -eq 0 ]
then
./utils.sh colorset 9
./utils.sh overlay sprocket 13 21 0
fi
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)
sprocket=$(grep 'sprocket=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i15=$(grep 'i16=' status | cut -d "=" -f2)
i17=$(grep 'i17=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 7
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][s][p][r][o][c][k][e][t]) if [ $sprocket -eq 1 ]
then
output=$(./utils.sh form uni get3 sprocket)
fi 
if [ $sprocket -eq 0 ]
then
sed -i '/sprocket=/c\sprocket=1' status
intro=1
output=$(./utils.sh form uni get2 sprocket)
fi
if [ $sprocket -eq 2 ]
then
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form uni get1)
fi ;;

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=15' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=17' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i16) ;;

[l][o][o][k][e][a][s][t][d][o][o][r])
output=$(./utils.sh form lookdoor door1 door8 $i15 1) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door8 $i17 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor5 0 sprocket1 $sprocket) ;;

[l][o][o][k][s][p][r][o][c][k][e][t]) if [ $sprocket -eq 0 ]
then
output=$(./utils.sh form looki null sprocket2 0)
echo "it is a small sprocket from a clock" 
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall7 0) ;;

#olfactory


[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor3) ;;

[l][i][c][k][s][p][r][o][c][k][e][t]) if [ $sprocket -eq 0 ] || [ $sprocket -eq 1 ]
then
output=$(./utils.sh form lick key)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall3) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i15) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor4) ;;

[s][m][e][l][l][s][p][r][o][c][k][e][t]) if [ $sprocket -eq 0 ] || [ $sprocket -eq 1 ]
then
output=$(./utils.sh form smell key)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall5) ;;

#constantcomm

esac
done

