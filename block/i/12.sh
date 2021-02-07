#!/bin/bash

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
pic=12pic1a
aux1=$(if [ $i12panel -eq 1 ] ; then ./utils.sh overlay door3 7 11 0 ; fi)
fi

if [ $focus -eq 1 ]
then
pic=06pic2a
aux2=$(if [ $book33 -eq 0 ] ; then ./utils.sh overlay table1 18 10 0 ; fi
if [ $pendant -eq 0 ] ; then ./utils.sh overlay pendant1 35 8 0 ; fi)
fi

image=$(block/$block/./graphics.sh $pic
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
echo -e "$aux1")
echo "$image"
echo -e "$aux2"

}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book33=$(grep 'book33=' status | cut -d "=" -f2)
clockkey=$(grep 'clockkey' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key7=$(grep 'key7=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)
pendant=$(grep 'pendant=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i11=$(grep 'i11=' status | cut -d "=" -f2)
i13=$(grep 'i13=' status | cut -d "=" -f2)
i12panel=$(grep 'i12panel=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) if [ $key7 -eq 1 ]
then
sed -i '/cell=/c\cell=13' status
break 
else
output=$(./utils.sh form uni doorlock)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=11' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i12) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door5 $i14 $key7) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door8 $i11 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book33 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][h][o][l][e]) if [ $i12panel -eq 0 ]
then
output=$(./utils.sh form uni look)
else
sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form looki null hole1 0 hole3 $book33 hole4 $pendant)
fi ;;

[l][o][o][k][l][o][c][k])./lib.sh key7b
if [ $key7 -eq 0 ]
then
output=$(./utils.sh form uni doorlock)
else
output=$(./utils.sh form uni doorunlock)
fi ;;

[l][o][o][k][p][a][n][e][l]) if [ $i12panel -eq 0 ]
then
output=$(./utils.sh form looki null panel1 0)
else
output=$(./utils.sh form looki null panel2 0)
fi ;;

[l][o][o][k][p][e][g]) output=$(./utils.sh form looki null peg1 0) ;;

[l][o][o][k][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
output=$(./utils.sh form looki null pendant1 0)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][w][a][l][l]) if [ $i12panel -eq 0 ]
then
output=$(./utils.sh form looki null wall2 0)
else
output=$(./utils.sh form looki null wall3 0)
fi ;;

[o][p][e][n][p][a][n][e][l]) if [ $clockkey -eq 1 ]
then
if [ $i12panel -eq 1 ]
then
output=$(./utils.sh form looki null panel3 0)
fi
if [ $i12panel -eq 0 ]
then
sed -i "/i12panel=/c\i12panel=1" status
intro=1
output=$(./utils.sh form looki null panel4 0)
fi
else
output=$(./utils.sh form uni open)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book33 -eq 1 ]
then
./utils.sh reader book112r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book33 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][h][o][l][e]) if [ $i12panel -eq 1 ]
then
output=$(./utils.sh form lick hole)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][p][a][n][e][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][p][e][g]) output=$(./utils.sh form lick peg) ;;

[l][i][c][k][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
output=$(./utils.sh form lick pendant1)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i01) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book33 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][h][o][l][e]) if [ $i12panel -eq 1 ]
then
output=$(./utils.sh form smell hole)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][p][a][n][e][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][p][e][g]) output=$(./utils.sh form smell peg) ;;

[s][m][e][l][l][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
output=$(./utils.sh form smell pendant1)
else
output=$(./utils.sh form uni lick1)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book33 -eq 0 ]
then
sed -i '/book33=/c\book33=1' status
intro=1
output=$(./utils.sh form uni get2 book) 
else
output=$(./utils.sh form uni get1)
fi ;;

[g][e][t][p][e][n][d][a][n][t]) if [ $pendant -eq 0 ]
then
sed -i '/pendant=/c\pendant=1' status
./lib.sh journal1 8
intro=1
output=$(./utils.sh form uni get2 pendant)
else
output=$(./utils.sh form uni get3 pendant)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null hole1 0 hole3 $book33 hole4 $pendant) ;;

[l][o][o][k][b][o][o][k]) if [ $book33 -eq 0 ] || [ $book33 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor9 0 pendant1 $pendant ) ;;

[l][o][o][k][h][o][l][e]) output=$(./utils.sh form looki null hole1 0 hole3 $book33 hole4 $pendant) ;;

[l][o][o][k][p][e][n][d][a][n][t]) if [ $pendant -eq 0 ]
then
output=$(./utils.sh form looki null pendant1 0)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[p][l][a][c][e][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
sed -i '/pendant=/c\pendant=0' status
intro=1
output=$(./utils.sh form looki null pendant2 0)
else
output=$(./utils.sh form uni place)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book33 -eq 0 ] || [ $book33 -eq 1 ]
then
./utils.sh reader book112r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book33 -eq 0 ] || [ $book33 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][h][o][l][e]) output=$(./utils.sh form lick hole) ;;

[l][i][c][k][p][e][n][d][a][n][t]) if [ $pendant -eq 0 ] || [ $pendant -eq 1 ]
then
output=$(./utils.sh form lick pendant1)
else
output=$(./utils.sh form uni lick1)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form smell hole) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book33 -eq 0 ] || [ $book33 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][h][o][l][e]) output=$(./utils.sh form smell hole) ;;

[s][m][e][l][l][p][e][n][d][a][n][t]) if [ $pendant -eq 0 ] || [ $pendant -eq 1 ]
then
output=$(./utils.sh form smell pendant1)
else
output=$(./utils.sh form uni lick1)
fi ;;

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

