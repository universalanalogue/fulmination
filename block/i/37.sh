#!/bin/bash
#version=1.08.02

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
comp=2
pic=pic1a
aux1=$(if [ $i37window -eq 1 ] ; then ./utils.sh overlay win3 39 7 0 ; fi)
fi

if [ $focus -eq 1 ]
then
comp=3
pic=pic2a
aux1=$(if [ $i41window -eq 1 ] ; then ./utils.sh overlay win1 24 6 0 ; fi
if [ $i37window -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 ; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0
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
i29=$(grep 'i29=' status | cut -d "=" -f2)
i36=$(grep 'i36=' status | cut -d "=" -f2)
i38=$(grep 'i38=' status | cut -d "=" -f2)
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

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=29' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=36' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=38' status ; break ;;

[g][o][w][e][s][t]) if [ $i37window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki i37 window1 $i37window) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form lookdoor door1 door19 $i29 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form looki null corridor4 0 corridor5 $i36) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form looki null corridor4 0 corridor5 $i38) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form looki null window15 0 window7 $i37window) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i37window -eq 0 ]
then
sed -i '/i37window=/c\i37window=1' status
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

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) if [ $i37window -eq 1 ]
then
output=$(./utils.sh form smell e)
else
output=$(./utils.sh form smell i33)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor5) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i37window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window15 0 window7 $i37window) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form looki null rain4 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form looki null window22 0 window7 $i41window) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i37window -eq 0 ]
then
sed -i '/i37window=/c\i37window=1' status
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

