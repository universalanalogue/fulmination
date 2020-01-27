#!/bin/bash

function background() {
image=$(block/$block/./graphics.sh ${cell}pic1)
echo "$image"
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key7=$(grep 'key7=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e06=$(grep 'e06=' status | cut -d "=" -f2)
e09=$(grep 'e09=' status | cut -d "=" -f2)
e11=$(grep 'e11=' status | cut -d "=" -f2)
e14=$(grep 'e14=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
}
helpcount=0
intro=0

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
if [ $intro -eq 0 ] ; then output=$(./utils.sh blockform) ; fi
vars
printf "\e[0;0H"
background
intro=2
fi
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

case1=$(./utils.sh parser1 "$case1")

case $case1 in

#room commands

[g][e][t][k][e][y]) if [ $key7 -eq 2 ] 
then
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh blockform uni get1)
else
if [ $key7 -eq 0 ]
then
sed -i '/key7=/c\key7=1' status
output=$(./utils.sh blockform uni get2 key)
else
output=$(./utils.sh blockform uni get3 key)
fi 
fi ;;

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=11' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cell=/c\cell=14' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=06' status ; break ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=09' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform elook 10) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh blockform elookdir east $e11 6) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh blockform elookdir north $e14 1) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh blockform elookdir south $e06 1) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh blockform elookdir west $e09 1) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform elooka hedge) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) ./utils.sh cutscene "elooka house west" "Look House" back
intro=0 ;;

[l][o][o][k][k][e][y]) if [ $key7 -ne 2 ]
then
./lib.sh key7a
fi
if [ $key7 -eq 0 ] ; then output=$(./utils.sh blockform lookkey e10) ; fi
if [ $key7 -eq 1 ] ; then output=$(./utils.sh blockform uni get3 key) ; fi 
if [ $key7 -eq 2 ] ; then output=$(./utils.sh blockform uni look) ; fi ;;

[l][o][o][k][t][r][e][e]) if [ $key7 -eq 0 ]
then output=$(./utils.sh blockform lookkey e10)
else
output=$(./utils.sh blockform elooka tree)
fi ;;

#olfactory

[l][i][c][k][h][e][d][g][e]) output=$(./utils.sh blockform lick hedge) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor) ;;

[l][i][c][k][k][e][y]) if [ $key7 -eq 0 ] || [ $key7 -eq 1 ]
then
output=$(./utils.sh blockform uni lickkey)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][t][r][e][e]) ouput=$(./utils.sh blockform lick tree) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell e) ;;

[s][m][e][l][l][h][e][d][g][e]) output=$(./utils.sh blockform uni far) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floore) ;;

[s][m][e][l][l][h][o][u][s][e]) output=$(./utils.sh blockform smell housee) ;;

[s][m][e][l][l][k][e][y]) if [ $key7 -eq 0 ] || [ $key7 -eq 1 ]
then
output=$(./utils.sh blockform smell key)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][t][r][e][e]) output=$(./utils.sh blockform smell treee) ;;


#constantcomm

esac
done

