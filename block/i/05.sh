#!/bin/bash
#version=1.08.02

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 4
comp=1
tint=0
pic=pic1a
aux1=$(if [ $i5awindow -eq 1 ] ; then ./utils.sh overlay win1 26 6 0 0; fi
if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win3 47 6 0 0; fi)
fi

if [ $focus -eq 1 ]
then
comp=1
tint=4
if [ $i5awindow -eq 0 ] ; then pic="pic3a" ; else pic="pic3b" ; ./utils.sh colorset 6 ; fi
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 1
comp=2
tint=4
pic="pic2"
aux1=$(if [ $rain -eq 1 ] ; then ./utils.sh overlay rain1 3 3 1 0 ; fi
if [ $i1window -eq 1 ] ; then ./utils.sh overlay win1 14 3 0 0; fi
if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 0; fi
if [ $book31 -eq 0 ] ; then ./utils.sh overlay spec1 16 5 0 0; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar
echo "$aux1")
echo "$image"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 $tint
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 $tint
}

vars() {
#inventory 
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book25=$(grep 'book25=' status | cut -d "=" -f2)
book31=$(grep 'book31=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
light=$(grep 'light=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
ammocount=$(grep 'ammocount=' status | cut -d "=" -f2)
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i04=$(grep 'i04=' status | cut -d "=" -f2)
i1window=$(grep 'i1window=' status | cut -d "=" -f2)
i5awindow=$(grep 'i5awindow=' status | cut -d "=" -f2)
i5bwindow=$(grep 'i5bwindow=' status | cut -d "=" -f2)
rain=$(grep 'rain=' status | cut -d "=" -f2)
roomtotal=$((ammocount+book25+gun+light))
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

[g][e][t][a][m][m][o]) if [ $ammo -eq 0 ] && [ $ammocount -eq 0 ]
then
./utils.sh score 6
sidebar
sed -i '/ammocount=/c\ammocount=1' status
sed -i '/ammo=/c\ammo=3' status
output=$(./utils.sh form 1 looki null ammo1 0 gun5 $gun)
else
output=$(./utils.sh form 1 looki null ammo2 0)
fi ;;

[g][e][t][b][o][o][k])
get=$(./utils.sh get book25 book $book25)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;


[g][e][t][g][u][n]) if [ $gun -eq 0 ]
then
./utils.sh score 2
sidebar
sed -i '/gun=/c\gun=1' status
sed -i '/book31=/c\book31=0' status
sed -i '/book12=/c\book12=0' status
output=$(./utils.sh form 1 looki null gun1 0 gun5 $ammocount)
else
output=$(./utils.sh form 1 looki null gun2 0)
fi ;;

[g][e][t][l][i][g][h][t]) 
get=$(./utils.sh get light light $light)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][e][a][s][t]) if [ $i5awindow -eq 1 ]
then
sed -i '/cell=/c\cell=10' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][s][o][u][t][h]) if [ $i5bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=09' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=04' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i02 window1 $i5bwindow) ;;

[l][o][o][k][b][o][o][k]) if [ $book25 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][b][o][x]) if [ $roomtotal -ge 4 ]
then
output=$(./utils.sh form 1 looki null box6 0)
else
output=$(./utils.sh form 1 looki null ammo3 $ammocount gun3 $gun book6 $book25 light3 $light)
fi ;;

[l][o][o][k][a][m][m][o]) sidebar
./lib.sh ammog
output=$(./utils.sh form 1 looki null ammo4 0) ;;

[l][o][o][k][g][u][n]) sidebar
./lib.sh gung
output=$(./utils.sh form 1 looki null gun4 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][l][i][g][h][t]) sidebar
./lib.sh lightg
output=$(./utils.sh form 1 looki null light4 0) ;;

[l][o][o][k][e][a][s][t][w][i][n][d][o][w]) intro=1
sed -i '/focus=/c\focus=1' status
if [ $i5awindow -eq 0 ]
then
output=$(./utils.sh form 1 looki null window4 0)
else
output=$(./utils.sh form 1 looki null window5 0)
fi ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) intro=1
sed -i '/focus=/c\focus=2' status
if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null window6 0 figure1 $book31 rain1 0 window7 $i5bwindow)
else
output=$(./utils.sh form 1 looki null window6 0 figure1 $book31 rain2 0 window7 $i5bwindow)
fi ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table2 0) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lookdoor door1 door6 $i04 1) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book25 -ne 2 ]
then
./utils.sh reader book25r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;
 
[o][p][e][n][b][o][x]) output=$(./utils.sh form 1 looki null box1 0) ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w])
if [ $i5awindow -eq 0 ] ; then ./utils.sh score 2 ; fi 
smash=$(./utils.sh smash i5awindow $hammer $i5awindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i5bwindow $hammer $i5bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][a][m][m][o]) if [ $ammo -gt 0 ] || ammocount -q 0 ]
then
output=$(./utils.sh form 1 lick ammo1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][b][o][o][k]) if [ $book25 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][b][o][x]) output=$(./utils.sh form 1 lick box2) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][g][u][n]) if [ $gun -ne 2 ]
then
output=$(./utils.sh form 1 lick ammo1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][l][i][g][h][t]) if [ $light -ne 2 ]
then
output=$(./utils.sh form 1 lick light1)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][t][a][b][l][e]) output=$(./utils.sh form 1 lick table) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window1) ;;

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i01 null $i5bwindow) ;;

[s][m][e][l][l][a][m][m][o]) if [ $ammo -eq 0 ] && [ $ammocount -eq 0 ] || [ $ammo -gt 0 ] && [ $ammocount -eq 1 ]
then
output=$(./utils.sh form 1 smell ammo)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book25 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][o][x]) output=$(./utils.sh form 1 smell box2) ;;

[s][m][e][l][l][d][o][o][r]) .output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][g][u][n]) if [ $gun -ne 2 ]
then
output=$(./utils.sh form 1 smell gun)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][l][i][g][h][t]) if [ $light -ne 2 ]
then
output=$(./utils.sh form 1 smell light)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][t][a][b][l][e]) output=$(./utils.sh form 1 smell table) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window1) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i5awindow -eq 1 ]
then
sed -i '/cell=/c\cell=10' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) if [ $i5awindow -eq 0 ]
then
output=$(./utils.sh form 1 looki null window4 0)
else
output=$(./utils.sh form 1 looki null window5 0)
fi ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 looki null fireplace7 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall4 0) ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w])
if [ $i5awindow -eq 0 ] ; then ./utils.sh score 2 ; fi 
smash=$(./utils.sh smash i5awindow $hammer $i5awindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window1) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window1) ;;
*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][o][s][o][u][t][h]) if [ $i5bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=09' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null window6 0 figure1 $book31 rain1 0 window7 $i5bwindow)
else
output=$(./utils.sh form 1 looki null window6 0 figure1 $book31 rain2 0 window7 $i5bwindow)
fi ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 looki null door27 0) ;;

[l][o][o][k][f][i][g][u][r][e]) if [ $book31 -eq 0 ]
then
output=$(./utils.sh form 1 looki null figure1 0)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor2 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form 1 looki null rain3 0)
else
output=$(./utils.sh form 1 looki null rain4 0)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 looki null window23 0 figure1 $book31 window7 $1window) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i5bwindow $hammer $i5bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;
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

