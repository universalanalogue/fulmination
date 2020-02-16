#!/bin/bash

function background() {
image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0)
echo "$image"
if [ $key8 -eq 0 ] ; then ./utils.sh overlay key2 9 17 0 ; fi
if [ $book12 -eq 0 ] ; then ./utils.sh overlay scuff 9 17 0 ; fi
}

function vars (){

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book12=$(grep "book12=" status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key5=$(grep "key5=" status | cut -d "=" -f2)
key8=$(grep "key8=" status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i03=$(grep 'i03=' status | cut -d "=" -f2)
i05=$(grep 'i05=' status | cut -d "=" -f2)
i11=$(grep 'i11=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")


case $case1 in

#room commands

[g][e][t][a][s][h][e][s]) output=$(./utils.sh form looki null ashes1 0) ;;

[g][e][t][b][o][o][k]) if [ $book12 -eq 0 ]
then
sed -i '/book12=/c\book12=1' status
intro=1
output=$(./utils.sh form uni get2 book) 
else
output=$(./utils.sh form uni get1)
fi ;;

[g][e][t][k][e][y]) if [ $book12 -ne 0 ] && [ $key8 -ne 2 ]
then
if [ $key8 -eq 0 ]
then
sed -i '/key8=/c\key8=1' status
intro=1
output=$(./utils.sh form uni get2 key)
else
output=$(./utils.sh form uni get3 key)
fi 
else
output=$(./utils.sh form uni get1)
fi ;;


[g][o][e][a][s][t]) sed -i '/cell=/c\cell=05' status ; break ;;

[g][o][n][o][r][t][h]) if [ $key5 -eq 1 ]
then
sed -i '/cell=/c\cell=11' status
break 
else
output=$(./utils.sh form uni doorlock)
fi ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=03' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i04) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door7 $i05 1) ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) 
output=$(./utils.sh form looki null fireplace2 0 fireplace3 $book12)
if [ $book12 -ne 0 ] && [ $key8 -eq 0 ]
then
output=$(./utils.sh form looki null fireplace2 0 fireplace4 $key8)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book12 -eq 0 ] || [ $book12 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look) 
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][k][e][y]) if [ $book12 -ne 0 ] && [ $key8 -ne 2 ]
then
./lib.sh key8a
if [ $key8 -eq 0 ] ; then output=$(./utils.sh form lookkey i04) ; fi
if [ $key8 -eq 1 ] ; then output=$(./utils.sh form uni get3 key) ; fi
else
output=$(./utils.sh form uni look) ; fi ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r])
output=$(./utils.sh form lookdoor door1 door8 $i11 $key5) ;;

[l][o][o][k][s][o][u][t][h][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door4 $i03 1) ;;

[l][o][o][k][l][o][c][k])./lib.sh key5b
if [ $key5 -eq 0 ]
then
output=$(./utils.sh form uni doorlock)
else
output=$(./utils.sh form uni doorunlock)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book12 -eq 0 ] || [ $book12 -eq 1 ]
then
./utils.sh reader book12r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][a][s][h][e][s]) output=$(./utils.sh form lick ashes1) ;;

[l][i][c][k][b][o][o][k]) if [ $book12 -eq 0 ] || [ $book12 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form lick fireplace1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][k][e][y]) if [ $key8 -eq 0 ] || [ $key8 -eq 1 ]
then
output=$(./utils.sh form uni lickkey)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i04) ;;

[s][m][e][l][l][a][s][h][e][s]) output=$(./utils.sh form smell ashes1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book12 -eq 0 ] || [ $book12 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form smell fireplace1) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][k][e][y]) if [ $key8 -ne 2 ] && [ $book12 -ne 0 ] 
then
output=$(./utils.sh form uni smellkey)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

#constantcomm

esac
done

