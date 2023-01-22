#!/bin/bash
#version=1.08.02

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
comp=1
pic=room1
aux1=$(./utils.sh overlay knob1 7 15 0 0 0
if [ $i12panel -eq 1 ] ; then ./utils.sh overlay door3 7 11 0 0; fi
./utils.sh overlay door9 24 21 0 0
./utils.sh overlay door10 24 5 0 0)
fi

if [ $focus -eq 1 ]
then
comp=0
pic=06pic2a
aux2=$(if [ $book33 -eq 0 ] ; then ./utils.sh overlay table1 18 10 0 0; fi
if [ $pendant -eq 0 ] ; then ./utils.sh overlay pendant1 35 8 0 0; fi)
fi

image=$( block/$block/./graphics.sh $pic
sidebar
echo "$aux1")
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 0
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

./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then exit ; fi
sleep=$(grep "sleep=" status | cut -d "=" -f2)
sleepthreshold=$(grep "sleepthreshold=" status | cut -d "=" -f2)
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)

while true ; do

if [ $intro -eq 2 ] ; then vars ; fi

if [ $intro -lt 2 ]
then
if [ $intro -eq 0 ] ; then output=$(./utils.sh form 1) ; fi
vars
printf "\e[0;0H"
background
intro=2
sed -i "/intro=/c\intro=2" status
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
sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=13' status
break 
else
output=$(./utils.sh form 1 uni doorlock)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=11' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i12) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door5 $i14 $key7) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door8 $i11 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book33 -eq 1 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][h][o][l][e]) if [ $i12panel -eq 0 ]
then
output=$(./utils.sh form 1 uni look)
else
sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 looki null hole1 0 hole3 $book33 hole4 $pendant)
fi ;;

[l][o][o][k][l][o][c][k]) sidebar
./lib.sh keyb key9
if [ $key7 -eq 0 ]
then
output=$(./utils.sh form 1 uni doorlock)
else
output=$(./utils.sh form 1 uni doorunlock)
fi ;;

[l][o][o][k][p][a][n][e][l]) if [ $i12panel -eq 0 ]
then
output=$(./utils.sh form 1 looki null panel1 0)
else
output=$(./utils.sh form 1 looki null panel2 0)
fi ;;

[l][o][o][k][p][e][g]) output=$(./utils.sh form 1 looki null peg1 0) ;;

[l][o][o][k][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
sidebar
./lib.sh pendantd
output=$(./utils.sh form 1 looki null pendant1 0)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][w][a][l][l]) if [ $i12panel -eq 0 ]
then
output=$(./utils.sh form 1 looki null wall2 0)
else
output=$(./utils.sh form 1 looki null wall3 0)
fi ;;

[o][p][e][n][p][a][n][e][l]) if [ $clockkey -eq 1 ]
then
if [ $i12panel -eq 1 ]
then
output=$(./utils.sh form 1 looki null panel3 0)
fi
if [ $i12panel -eq 0 ]
then
./utils.sh score 2
sidebar
sed -i "/i12panel=/c\i12panel=1" status
intro=1
output=$(./utils.sh form 1 looki null panel4 0)
fi
else
output=$(./utils.sh form 1 uni open)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book33 -eq 1 ]
then
./utils.sh reader book112r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book33 -eq 1 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][h][o][l][e]) if [ $i12panel -eq 1 ]
then
output=$(./utils.sh form 1 lick hole)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][p][a][n][e][l]) output=$(./utils.sh form 1 lick wall) ;;

[l][i][c][k][p][e][g]) output=$(./utils.sh form 1 lick peg) ;;

[l][i][c][k][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
output=$(./utils.sh form 1 lick pendant1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i01) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book33 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][h][o][l][e]) if [ $i12panel -eq 1 ]
then
output=$(./utils.sh form 1 smell hole)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][p][a][n][e][l]) output=$(./utils.sh form 1 smell wall) ;;

[s][m][e][l][l][p][e][g]) output=$(./utils.sh form 1 smell peg) ;;

[s][m][e][l][l][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
output=$(./utils.sh form 1 smell pendant1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) 
get=$(./utils.sh get book33 book $book33)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][e][t][p][e][n][d][a][n][t]) 
./lib.sh journal1 8
get=$(./utils.sh get pendant pendant $pendant)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null hole1 0 hole3 $book33 hole4 $pendant) ;;

[l][o][o][k][b][o][o][k]) if [ $book33 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor9 0 pendant1 $pendant ) ;;

[l][o][o][k][h][o][l][e]) output=$(./utils.sh form 1 looki null hole1 0 hole3 $book33 hole4 $pendant) ;;

[l][o][o][k][p][e][n][d][a][n][t]) if [ $pendant -eq 0 ]
then
sidebar
./lib.sh pendantd
output=$(./utils.sh form 1 looki null pendant1 0)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[p][l][a][c][e][p][e][n][d][a][n][t]) if [ $pendant -eq 1 ]
then
./utils.sh score -2
sidebar
sed -i '/pendant=/c\pendant=0' status
intro=1
output=$(./utils.sh form 1 looki null pendant2 0)
else
output=$(./utils.sh form 1 uni place)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book33 -ne 2 ]
then
./utils.sh reader book112r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book33 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][h][o][l][e]) output=$(./utils.sh form 1 lick hole) ;;

[l][i][c][k][p][e][n][d][a][n][t]) if [ $pendant -ne 2 ]
then
output=$(./utils.sh form 1 lick pendant1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell hole) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book33 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][h][o][l][e]) output=$(./utils.sh form 1 smell hole) ;;

[s][m][e][l][l][p][e][n][d][a][n][t]) if [ $pendant -ne 2 ]
then
output=$(./utils.sh form 1 smell pendant1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [[ "$case1" == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)

./utils.sh evecom "$case1"
cell=$(grep "cell=" status | cut -d "=" -f2)
intro=$(grep "intro=" status | cut -d "=" -f2)
if [[ "$cell" == null ]] ; then break ; fi
if [[ "$cell" != null ]] && [[ "$intro" != 0 ]] ; then case1=(system${case1}) ; fi
fi

if [[ "$case1" == *"system"* ]]
then

case1=$(sed "s/system//" <<< $case1)
concom=$(./utils.sh concom "$case1")
state=$(sed "1q;d" <<< "$concom")
intro=$(sed "2q;d" <<< "$concom")
output=$(tail -n 12 <<< "$concom")
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ "$state" == 2 ]] || [[ "$cell" == null ]] ; then break ; fi
fi

done

