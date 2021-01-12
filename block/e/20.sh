#!/bin/bash

background() {

if [ $focus -eq 0 ]
then
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${cell}pic1a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
if [ $i11window -eq 1 ] ; then ./utils.sh overlay win3 45 9 0 ; fi
if [ $i22window -eq 1 ] ; then ./utils.sh overlay win10 46 2 0 ; fi)
echo "$image"
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 4
image=$(block/$block/./graphics.sh ${cell}pic2a
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 1" 56 4 0
if [ $i11window -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 ; fi)
echo "$image"
fi

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
e16=$(grep 'e16=' status | cut -d "=" -f2)
e24=$(grep 'e24=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i11window=$(grep 'i11window=' status | cut -d "=" -f2)
i22window=$(grep 'i22window=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i11window -eq 1 ]
then 
sed -i '/block=/c\block=i' status
sed -i '/cell=/c\cell=11' status
break
else
output=$(./utils.sh.sh form uni go)
fi ;;

[g][o][n][o][r][t][h]) sed -i '/cella=/c\cella=24' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=16' status ; break ;;

[g][o][w][e][s][t]) output=$(./utils.sh form elooka hedge3) ;;

[l][o][o][k]) output=$(./utils.sh form elook 20) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form elookdir east 1 4) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form elookdir north $e24 3) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form elookdir south $e16 14) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form elookdir west 1 2) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form elooka hedge) ;;

[l][o][o][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh form elooka drive) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh form elooka house east) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form uni far) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form elooka window3) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i2window -eq 0 ]
then
sed -i '/i11window=/c\i11window=1' status
intro1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh form lick hedge) ;;

[l][i][c][k][d][r][i][v][e][w][a][y]) output=$(./utils.sh form lick drive) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor) ;;

[l][i][c][k][h][o][u][s][e]) output=$(./utils.sh form lick house) ;;

[l][i][c][k][t][r][e][e]) output=$(./utils.sh form lick tree) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell e) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh form smell hedgee) ;;

[s][m][e][l][l][d][r][i][v][e][w][a][y]) output=$(./utils.sh form smell drive) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh form smell housee) ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh form uni far) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell windowe) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i11window -eq 1 ]
then 
sed -i '/block=/c\block=i' status
sed -i '/cell=/c\cell=11' status
break
else
output=$(./utils.sh.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form elooka window3) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][s][t][a][i][r][s]) output=$(./utils.sh form looki null stairs1 0) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form looki null door1 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i2window -eq 0 ]
then
sed -i '/i11window=/c\i11window=1' status
intro1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell windowe) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell windowe) ;;

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

