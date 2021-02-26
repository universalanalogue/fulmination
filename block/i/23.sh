#!/bin/bash
#version=1.08.01

background() {
image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 1" 56 4 0)
echo "$image"
if [ $book110 -eq 0 ] ; then ./utils.sh overlay "scuff" 37 11 0 ; fi

}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book110=$(grep 'book110=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key6=$(grep 'key6=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i39=$(grep 'i39=' status | cut -d "=" -f2)
sleepnum=$(grep "sleepnum=" status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book110 -eq 0 ]
then
sed -i '/book110=/c\book110=1' status
output=$(./utils.sh form uni get2 book)
intro=1
else
output=$(./utils.sh form uni get1)
fi ;;

[g][e][t][k][e][y]) if [ $key6 -eq 1 ]
then
output=$(./utils.sh form uni get3 key)
fi
if [ $key6 -eq 2 ] 
then
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form uni get1)
else
if [ $key6 -eq 0 ]
then
sed -i '/key6=/c\key6=1' status
output=$(./utils.sh form uni get2 key)
fi 
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=39' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i23) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door15 $i39 1) ;;

[l][o][o][k][b][e][d]) output=$(./utils.sh form looki null bed1 0) ;;

[l][o][o][k][b][o][o][k]) if [ $book110 -eq 0 ] || [ $book110 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) if [ $book110 -eq 0 ]
then
output=$(./utils.sh form looki null bookcase2 0)
else
output=$(./utils.sh form looki null bookcase1 0)
fi ;;

[l][o][o][k][d][r][a][w][e][r][s]) if [ $key6 -eq 0 ]
then
output=$(./utils.sh form looki null drawer1 0)
else 
output=$(./utils.sh form looki null drawer2 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor7 0) ;;

[l][o][o][k][k][e][y]) if [ $key6 -ne 2 ]
then
./lib.sh key6a
fi
if [ $key6 -eq 0 ] ; then output=$(./utils.sh form lookkey i23) ; fi
if [ $key6 -eq 1 ] ; then output=$(./utils.sh form uni get3 key) ; fi 
if [ $key6 -eq 2 ] ; then output=$(./utils.sh form uni look) ; fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book110 -eq 0 ] || [ $book110 -eq 1 ]
then
./utils.sh reader book110r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#bedtime


#olfactory

[l][i][c][k][b][e][d]) output=$(./utils.sh form lick bed1) ;;

[l][i][c][k][b][o][o][k]) if [ $book110 -eq 0 ] || [ $book110 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form lick forest) ;;

[l][i][c][k][d][r][a][w][e][r][s]) output=$(./utils.sh form lick forest) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor5) ;;

[l][i][c][k][k][e][y]) if [ $key6 -eq 0 ] || [ $key6 -eq 1 ]
then
output=$(./utils.sh form uni lickkey)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i23) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][b][e][d]) output=$(./utils.sh form smell bed1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book110 -eq 0 ] || [ $book110 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh form smell foreste) ;;

[s][m][e][l][l][d][r][a][w][e][r][s]) output=$(./utils.sh form smell foreste) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor5) ;;

[s][m][e][l][l][k][e][y]) if [ $key2 -eq 0 ] || [ $key2 -eq 1 ]
then
output=$(./utils.sh form uni smellkey)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

#constantcomm

esac
done

