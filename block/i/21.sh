#!/bin/bash

background() {
image=$(block/$block/./graphics.sh 14pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 2" 56 4 0)
echo "$image"
if [ $book34 -eq 0 ]
then 
./utils.sh colorset 9
./utils.sh overlay book5 13 21 0
fi
}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book34=$(grep 'book34=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i20=$(grep 'i20=' status | cut -d "=" -f2)
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

[g][e][t][b][o][o][k]) if [ $book34 -eq 0 ]
then
sed -i '/book34=/c\book34=1' status
sed -i '/clockkey=/c\clockkey=0' status
output=$(./utils.sh form uni get2 book)
intro=1
else
output=$(./utils.sh form uni get1)
fi ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=20' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i21) ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form looki null box10 0) ;;

[l][o][o][k][b][o][o][k]) if [ $book34 -eq 0 ] 
then
output=$(./utils.sh form looki null book8 0)
fi 
if [ $book34 -eq 1 ] 
then
output=$(./utils.sh form looki null book9 0)
fi
if [ $book34 -eq 2 ]
then
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r])
output=$(./utils.sh form looki null floor5 0 book8 $book34) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book34 -eq 0 ] || [ $book34 -eq 1 ]
then
./utils.sh reader book34r
intro=1
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book34 -eq 0 ] || [ $book34 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][b][o][x]) output=$(./utils.sh form lick box4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor4) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall3) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i15) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book34 -eq 0 ] || [ $book34 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][b][o][x]) output=$(./utils.sh form smell hole) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor4) ;;

[s][m][e][l][l][k][e][y]) if [ $sitkey -eq 0 ] || [ $sitkey -eq 1 ]
then
output=$(./utils.sh form smell key)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall5) ;;

#constantcomm

esac
done

