#!/bin/bash
#version=1.08.01

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 5
pic=pic1a
aux1=$(if [ $i41window -eq 1 ] ; then ./utils.sh overlay win2 12 8 0 ; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
pic=pic2a
aux1=$(if [ $i37window -eq 1 ] ; then ./utils.sh overlay win1 26 6 0 ; fi
if [ $i41window -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 ; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
echo -e "$aux1")
echo "$image"
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
greed=$(grep 'greed=' status | cut -d "=" -f2)
i28=$(grep 'i28=' status | cut -d "=" -f2)
i40=$(grep 'i40=' status | cut -d "=" -f2)
i42=$(grep 'i42=' status | cut -d "=" -f2)
i37window=$(grep 'i37window=' status | cut -d "=" -f2)
i41window=$(grep 'i41window=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i41window -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=40' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=42' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=28' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i41 window1 $i41window) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form looki null corridor4 0 corridor5 $i40) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form looki null corridor4 0 corridor5 $i42) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form lookdoor door1 door19 $i28 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form looki null window15 0 window7 $i1window);;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i41window -eq 0 ]
then
sed -i '/i41window=/c\i41window=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) if [ $i41window -eq 1 ]
then
output=$(./utils.sh form smell e)
else
output=$(./utils.sh form smell i33)
fi ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i41window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window15 0 window7 $i1window);;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form looki null rain4 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form looki null window22 0 window7 $i37window) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i41window -eq 0 ]
then
sed -i '/i41window=/c\i41window=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

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

