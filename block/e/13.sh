#!/bin/bash
#version=1.08.02

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 1
comp=0
tint=0
pic=pic1a
aux1=$(if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win12 2 10 0 0; fi
if [ $i29window -eq 1 ] ; then ./utils.sh overlay win9 2 4 0 0; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 4
comp=3
tint=1
pic=pic2a
aux1=$(if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win1 22 3 0 0; fi
if [ $i8bwindow -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 0; fi)
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
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e09=$(grep 'e09=' status | cut -d "=" -f2)
i14=$(grep 'e14=' status | cut -d "=" -f2)
i17=$(grep 'e17=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i08=$(grep 'i08=' status | cut -d "=" -f2)
i8awindow=$(grep 'i8awindow=' status | cut -d "=" -f2)
i8bwindow=$(grep 'i8bwindow=' status | cut -d "=" -f2)
i29window=$(grep 'i29window=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cella=/c\cella=14' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cella=/c\cella=17' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cella=/c\cella=09' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=08' status
sed -i '/block=/c\block=i' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 elook 13) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form 1 elookdir east $e14 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form 1 elookdir north $e17 13) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form 1 elookdir south $e09 1) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 elooka door2) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh form 1 elooka house west) ;; 

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form 1 uni far) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 elooka window2);;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i8bwindow $hammer $i8bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh form 1 lick house) ;;

[l][i][c][k][t][r][e][e]) output=$(./utils.sh form 1 lick tree) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh form 1 smell housee) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 windowe) ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh form 1 uni far) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=08' status
sed -i '/block=/c\block=i' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 elooka window2);;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 looki null window22 0 window7 $8awindow) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i8bwindow $hammer $i8bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 windowe) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 windowe) ;;

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
