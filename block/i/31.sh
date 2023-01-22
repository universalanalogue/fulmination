#!/bin/bash
#version=1.08.02

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 5
comp=1
tint=0
pic=pic1a
aux1=$(if [ $i31window -eq 1 ] ; then ./utils.sh overlay win3 48 6 0 0; fi
if [ $i31trapdoor -eq 1 ] ; then ./utils.sh overlay trapdoor1 25 2 0 0; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
comp=2
tint=5
pic=pic2a
aux1=$(if [ $i31window -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 0; fi)
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
clockkey=$(grep 'clockkey=' status | cut -d "=" -f2)
cog=$(grep 'cog=' status | cut -d "=" -f2)
gear=$(grep 'gear=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)
mainspringbarrel=$(grep 'mainspringbarrel=' status | cut -d "=" -f2)
sprocket=$(grep 'sprocket=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i42=$(grep 'i42=' status | cut -d "=" -f2)
i31window=$(grep 'i31window=' status | cut -d "=" -f2)
i1window=$(grep 'i1window=' status | cut -d "=" -f2)
i31trapdoor=$(grep 'i31trapdoor=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l])
get=$(./utils.sh get mainspringbarrel mainspringbarel $mainspringbarrel)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][e][a][s][t]) if [ $i31trapdoor -eq 1 ]
then
sed -i '/cell=/c\cell=43' status
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][s][o][u][t][h]) if [ $i31window -eq 1 ]
then 
./utils.sh colorset 2
./utils.sh cutscene i windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=42' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i28 window1 $i31window) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door18 $i37 1) ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 looki null bookcase2 0) ;;

[l][o][o][k][c][l][o][c][k]) if [ $mainspringbarrel -eq 0 ]
then
output=$(./utils.sh form 1 looki null clock16 0 clock18 0)
else
output=$(./utils.sh form 1 looki null clock16 0 clock17 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 looki null window22 0 window7 $31window) ;;

[l][o][o][k][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l])
if [ $mainspringbarrel -eq 0 ] || [ $mainspringbarrel -eq 1 ]
then
output=$(./utils.sh form 1 looki null mainspring1 0)
fi ;;

[l][o][o][k][t][r][a][p][d][o][o][r]) if [ $i31trapdoor -eq 0 ]
then
output=$(./utils.sh form 1 looki null trapdoor1 0 trapdoor2 0)
else
output=$(./utils.sh form 1 looki null trapdoor1 0 trapdoor2 0)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[o][p][e][n][t][r][a][p][d][o][o][r]) if [ $i31trapdoor -eq 0 ]
then
./utils.sh score 2
sidebar
sed -i '/i31trapdoor=/c\i31trapdoor=1' status
intro=1
output=$(./utils.sh form 1 looki null trapdoor4 0)
else
output=$(./utils.sh form 1 looki null trapdoor5 0)
fi ;;

[p][l][a][c][e][c][o][g][c][l][o][c][k]) if [ $cog -eq 0 ]
then
output=$(./utils.sh form 1 uni place)
else
output=$(./utils.sh form 1 looki null clock13 0)
fi ;;

[p][l][a][c][e][g][e][a][r][c][l][o][c][k]) if [ $gear -eq 0 ]
then
output=$(./utils.sh form 1 uni place)
else
output=$(./utils.sh form 1 looki null clock13 0)
fi ;;

[p][l][a][c][e][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l][c][l][o][c][k])
if [ $mainspringbarrel -eq 0 ] 
then
output=$(./utils.sh form 1 uni place)
else
output=$(./utils.sh form 1 looki null clock13 0)
fi ;;

[p][l][a][c][e][s][p][r][o][c][k][e][t][c][l][o][c][k]) if [ $sprocket -eq 0 ] 
then
output=$(./utils.sh form 1 uni place)
else
output=$(./utils.sh form 1 looki null clock13 0)
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i31window $hammer $i31window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][c][l][o][c][k]) output=$(./utils.sh form 1 lick clock1) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l]) 
if [ $mainspringbarrel -ne 2 ]
then
output=$(./utils.sh form 1 lick key)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) if [ $i31window -eq 1 ]
then
output=$(./utils.sh form 1 smell e)
else
output=$(./utils.sh form 1 smell i31)
fi ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][c][l][o][c][k]) output=$(./utils.sh form 1 smell clock1) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l]) 
if [ $mainspringbarrel -ne 2 ]
then
output=$(./utils.sh form 1 smell peg)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][s][o][u][t][h]) if [ $i31window -eq 1 ]
then 
./utils.sh cutscene i windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null window22 0 window7 $31window) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor2 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form 1 looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form 1 looki null rain4 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form 1 looki null tree1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i31window $hammer $i31window )
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

