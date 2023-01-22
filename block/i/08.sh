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
aux1=$(if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win2 3 7 0 0; fi
if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win4 45 2 0 0; fi)
aux2=$(if [ "$book17" -eq 0 ] ; then ./utils.sh overlay book2 33 13 0 0; fi
if [ "$key1" -eq 0 ] ; then ./utils.sh overlay key1 17 16 0 0; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
comp=3
tint=4
pic="pic2" 
aux1=$(if [ $rain -eq 1 ] ; then ./utils.sh overlay rain1 3 3 1 0 ;fi
if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win3 48 4 0 0; fi
if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 0; fi
if [ $i9box -eq 1 ] ; then ./utils.sh overlay box2 46 8 1 0; fi)
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 1
comp=1
tint=4
pic="pic3"
aux1=$(if [ $rain -eq 1 ] ; then ./utils.sh overlay rain2 3 3 1 0 ; fi
if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 0; fi)
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
book17=$(grep 'book17=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key1=$(grep 'key1=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e13=$(grep 'e13=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i06=$(grep 'i06=' status | cut -d "=" -f2)
i5bwindow=$(grep 'i5bwindow=' status | cut -d "=" -f2)
i8awindow=$(grep 'i8awindow=' status | cut -d "=" -f2)
i8bwindow=$(grep 'i8bwindow=' status | cut -d "=" -f2)
i9box=$(grep 'i9box=' status | cut -d "=" -f2)
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

[g][e][t][k][e][y])
get=$(./utils.sh get key1 key $key1)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][e][t][b][o][o][k])
get=$(./utils.sh get book17 book $book17)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][e][a][s][t]) if [ $rain -eq 0 ]
then
sed -i '/cell=/c\cell=13' status
sed -i '/block=/c\block=e' status
break 
else
./utils.sh colorset 2
./utils.sh cutscene i i8a Death logo
./utils.sh setdeath
break
fi ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=06' status ; break ;;

[g][o][w][e][s][t]) if [ $i8bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=09' status
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i08 window1 $i8awindow) ;;

[l][o][o][k][b][o][o][k]) if [ $book17 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][c][o][r][r][i][d][o][r]) output=$(./utils.sh form 1 lookdoor corridor4 door11 $i06) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lookdoor door1 door12 $e13 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][k][e][y]) sidebar
./lib.sh keya key3
if [ $key1 -eq 0 ] ; then output=$(./utils.sh form 1 lookkey i08) ; fi
if [ $key1 -eq 1 ] ; then output=$(./utils.sh form 1 uni get3 key) ; fi ;;

[l][o][o][k][n][o][r][t][h][d][o][o][r]) 
output=$(./utils.sh form 1 looki null door23 0 door24 $book17) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table3 0 table4 $key1) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[l][o][o][k][e][a][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=2' status
intro=1
if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null window8 0 rain1 0)
else
output=$(./utils.sh form 1 looki null window8 0 rain2 0 window7 $i8awindow)
fi ;;

[l][o][o][k][w][e][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null window9 0 rain1 0)
else
output=$(./utils.sh form 1 looki null window9 0 rain2 0 window7 $i8bwindow box1 $i9box)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book17 -ne 2 ]
then
./utils.sh reader book17r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[o][p][e][n][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][e][s][t][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i8bwindow $hammer $i8bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i8awindow $hammer $i8awindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book17 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 lick door4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][k][e][y]) if [ $key1 -ne 2 ]
then
output=$(./utils.sh form 1 uni lickkey)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][t][a][b][l][e]) output=$(./utils.sh form 1 lick table) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) if [ $i8awindow -eq 1 ]
then
output=$(./utils.sh form 1 smell i01 null 1)
else
output=$(./utils.sh form 1 smell i01 null $i8bwindow)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book17 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form 1 smell corridor1) ;;

[s][m][e][l][l][e][a][s][t]d][o][o][r]) output=$(./utils.sh form 1 smell door6) ;;

[s][m][e][l][l][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 smell door7) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][k][e][y]) if [ $key1 -ne 2 ]
then
output=$(./utils.sh form 1 uni smellkey)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][t][a][b][l][e]) output=$(./utils.sh form 1 smell table) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands west window i08bwindow

[g][o][w][e][s][t]) if [ $i8bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=09' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null window9 0 rain1 0)
else
output=$(./utils.sh form 1 looki null window9 0 rain2 0 window7 $i8bwindow box1 $i9box)
fi ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form 1 looki null box2 0 box1 $i9box) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 looki null door27 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor2 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null rain3 0)
else
output=$(./utils.sh form 1 looki null rain4 0)
fi ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 looki null window23 0 window7 $i8bwindow) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall5 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i8bwindow $hammer $i8bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands east window i08awindow

[g][o][e][a][s][t]) if [ $i8awindow -eq 1 ]
then
sed -i '/cell=/c\cell=13' status
sed -i '/block=/c\block=e' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null window8 0 rain1 0)
else
output=$(./utils.sh form 1 looki null window8 0 rain2 0 window7 $i8awindow)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor2 0) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh form 1 looki null forest1 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null rain3 0)
else
output=$(./utils.sh form 1 looki null rain4 0)
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i8awindow $hammer $i8awindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

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

