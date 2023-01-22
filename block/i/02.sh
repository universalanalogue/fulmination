#!/bin/bash
#version=1.08.02

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 4
comp=0
tint=0
pic=pic1a
aux1=$(if [ $rain -eq 0 ] ; then ./utils.sh overlay chair1 21 14 0 0 ; fi
if [ $i2window -eq 1 ] ; then ./utils.sh overlay win2 3 7 0 0; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
comp=3
tint=4
pic="pic2"
aux1=$(if [ $rain -eq 1 ] ; then ./utils.sh overlay rain2 3 3 1 0 ; fi
if [ $i2window -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 0; fi)
fi

if [ $focus -eq 2 ]
then
comp=0
tint=4
pic=pic3a
aux2=$(if [ $book32 -eq 0 ] ; then ./utils.sh overlay book11 24 6 0 0; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar
echo "$aux1")
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 $tint
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 $tint
}

vars() {
#inventory

ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book32=$(grep 'book32=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep "block=" status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i01=$(grep 'i01=' status | cut -d "=" -f2)
i03=$(grep 'i03=' status | cut -d "=" -f2)
i2window=$(grep 'i2window=' status | cut -d "=" -f2)
rain=$(grep 'rain=' status | cut -d "=" -f2)
sleep=$(grep "sleep=" status | cut -d "=" -f2)
sleepthreshold=$(grep "sleepthreshold=" status | cut -d "=" -f2)
}
helpcount=0
intro=0
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=01' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=03' status ; break ;;

[g][o][w][e][s][t]) if [ $i2window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=08' status
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i02 window1 $i2window) ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 looki null bookcase1 0) ;;

[l][o][o][k][c][h][a][i][r]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null chair1 0)
else
if [ $book32 -eq 0 ]
then
output=$(./utils.sh form 1 looki null chair2 0)
else
output=$(./utils.sh form 1 looki null chair3 0)
fi
fi ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lookdoor door1 door3 $i01 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book32 -eq 2 ] 
then
output=$(./utils.sh form 1 uni look)
else
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 looki null book5 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][l][e][g]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 uni look)
else
if [ $focus -eq 0 ]
then
sed -i '/focus=/c\focus=2' status
intro=1
if [ $book32 -eq 0 ] 
then
output=$(./utils.sh form 1 looki null chair4 0)
else
output=$(./utils.sh form 1 looki null chair5 0)
fi
else
output=$(./utils.sh form 1 uni look)
fi
fi ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 lookdoor door1 door4 $i03 1) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $rain -eq 1 ] 
then
output=$(./utils.sh form 1 looki null window3 0 rain1 0 window7 $i2window)
else
output=$(./utils.sh form 1 looki null window3 0 rain2 0 window7 $i2window)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book32 -eq 1 ]
then
./utils.sh reader book32r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[s][i][t][c][h][a][i][r]) if [ $rain -eq 0 ]
then 
output=$(./utils.sh form 1 uni ic)
break
else
./utils.sh colorset 2
./utils.sh cutscene i sit2 Death logo
./utils.sh setdeath
break
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i2window $hammer $i2window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book32 -eq 1 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][c][h][a][i][r]) output=$(./utils.sh form 1 lick chair1) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i01 null $i2window) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book32 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell forreste) ;;

[s][m][e][l][l][c][h][a][i][r]) output=$(./utils.sh form 1 smell chair1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i2window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=08' status
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ] 
then
output=$(./utils.sh form 1 looki null window3 0 rain1 0 window7 $i2window)
else
output=$(./utils.sh form 1 looki null window3 0 rain2 0 window7 $i2window)
fi ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh form 1 looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor2 0) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh form 1 looki null gate1 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form 1 looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null rain3 0)
else
output=$(./utils.sh form 1 looki null rain4 0)
fi ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form 1 looki null tree1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i2window $hammer $i2window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book32 book $book32)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k]) if [ $book32 -eq 0 ]
then
output=$(./utils.sh form 1 looki null chair4 0)
else
output=$(./utils.sh form 1 looki null chair5 0)
fi ;;

[l][o][o][k][b][o][o][k]) sidebar
./lib.sh bookg
if [ $book32 -eq 0 ] 
then
output=$(./utils.sh form 1 looki null book4 0)
fi
if [ $book32 -eq 1 ] 
then
output=$(./utils.sh form 1 looki null book5 0)
fi ;;

[l][o][o][k][c][h][a][i][r]) if [ $book32 -eq 0 ]
then
output=$(./utils.sh form 1 looki null chair2 0)
else
output=$(./utils.sh form 1 looki null chair3 0)
fi ;;

[l][o][o][k][l][e][g]) if [ $book32 -eq 0 ] 
then
output=$(./utils.sh form 1 looki null chair4 0)
else
output=$(./utils.sh form 1 looki null chair5 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book32 -ne 2 ]
then
./utils.sh reader book32r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book32 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][c][h][a][i][r]) output=$(./utils.sh form 1 lick chair1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book32 -ne 2 ]
then
output=$(./utils.sh form 1 smell book) 
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][c][h][a][i][r]) output=$(./utils.sh form 1 smell chair1) ;;

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

