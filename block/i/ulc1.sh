#!/bin/bash

background() {
if [[ "$cella" =~ ^(33|34)$ ]] ; then num=1 ; fi
if [[ "$cella" =~ ^(35|36|39|40|42)$ ]] ; then num=2 ; fi
if [ "$cella" -eq 33 ] ; then ./utils.sh colorset 5 ; fi
image=$(block/$block/./graphics.sh ${cella}pic1
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cella $num" 56 4 0)
echo "$image"
}

vars() {
#base
block=$(grep 'block=' status | cut -d "=" -f2)
cella=$(grep "cella=" status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep "focus=" status | cut -d "=" -f2)

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)
if [ $cella -eq 42 ] ; then key6=$(grep 'key6=' status | cut -d "=" -f2) ; fi

#variables
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)

if [[ "$cella" =~ ^(39)$ ]] ; then i22=$(grep 'i22=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(39)$ ]] ; then i23=$(grep 'i23=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(35)$ ]] ; then i24=$(grep 'i24=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(40)$ ]] ; then i25=$(grep 'i25=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(40)$ ]] ; then i26=$(grep 'i26=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(36)$ ]] ; then i27=$(grep 'i27=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(42)$ ]] ; then i30=$(grep 'i30=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(42)$ ]] ; then i31=$(grep 'i31=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(34|39)$ ]] ; then i33=$(grep 'i33=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(33|35)$ ]] ; then i34=$(grep 'i34=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(34|36)$ ]] ; then i35=$(grep 'i35=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(35)$ ]] ; then i36=$(grep 'i36=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(36)$ ]] ; then i37=$(grep 'i37=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(33|40)$ ]] ; then i39=$(grep 'i39=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(39)$ ]] ; then i40=$(grep 'i40=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(42)$ ]] ; then i41=$(grep 'i41=' status | cut -d "=" -f2) ; fi
}

helpcount=0
intro=0

block=$(grep "block=" status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
mvnt1=$(grep "mvnt1=" status | cut -d "=" -f2)

sleep1(){

#sleep

}

while true ; do

vars

./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then break ; fi


if [ $intro -lt 2 ]
then
if [ $intro -eq 0 ] ; then output=$(./utils.sh form) 
if [[ $cella != $cellb ]] ; then sleep1 ; fi
cellb=$cella ; fi
sed -i '/${block}${cella}=/c\\${block}${cella}=1' status

if [[ "$cella" =~ ^(33|34)$ ]] ; then num=1 ; fi
if [[ "$cella" =~ ^(35|36|39|40|42)$ ]] ; then num=2 ; fi
if [ $mvnt1 -eq 0 ]
then
sed -i '/mvnt2=/c\mvnt2=0' status
else
sed -i "/mvnt2=/c\mvnt2=num" status
fi

printf "\e[0;0H"
background
intro=2
fi
./utils.sh prompt "$last" "$bar" "$output" 5
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

#common space

case $case1 in

[l][o][o][k]) if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki i33) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form looki i34) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form looki i35) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form looki i36) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form looki i39) ; fi
if [ $cella -eq 40 ] && [ $cella -eq 42 ] ; then output=$(./utils.sh form looki i40) ; fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell i33) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][w][a][l][l]) .output=$(./utils.sh form smell wall) ;;

*) case1=(system${case1}) ;;

esac

if [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in


[g][o]*) comm=$(sed 's/go//' <<< $case1)
#east
if [[ "$comm" == east ]] ; then 
if [ $cella -eq 33 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cell=/c\cell=24' status ; break ; fi
if [ $cella -eq 36 ] ; then sed -i '/cell=/c\cell=27' status ; break ; fi
if [ $cella -eq 39 ] ; then sed -i '/cell=/c\cell=23' status ; break  ; fi
if [ $cella -eq 40 ] ; then sed -i '/cell=/c\cell=26' status ; break ; fi
if ! [[ "$cella" =~ ^(33|34|35|36|39|40)$ ]] ; then comm=null ; fi
fi
#north
if [[ "$comm" == north ]] ; then
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=11' status ; break ; fi
if [ $cella -eq 36 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 39 ] ; then sed -i '/cella=/c\cella=33' status ; intro=0 ; fi
if [ $cella -eq 40 ] ; then sed -i '/cella=/c\cella=39' status ; intro=0 ; fi
if [ $cella -eq 42 ] ; then sed -i '/cell=/c\cell=41' status ; break ; fi
if ! [[ "$cella" =~ ^(36|39|40|42)$ ]] ; then comm=null ; fi
fi
#south
if [[ "$comm" == south ]] ; then 
if [ $cella -eq 33 ] ; then sed -i '/cella=/c\cella=39' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=36' status ; intro=0  ; fi
if [ $cella -eq 36 ] ; then sed -i '/cell=/c\cell=37' status ; break ; fi
if [ $cella -eq 39 ] ; then sed -i '/cella=/c\cella=40' status ; intro=0 ; fi
if [ $cella -eq 40 ] ; then sed -i '/cell=/c\cell=41' status ; break ; fi
if ! [[ "$cella" =~ ^(33|35|36|39|40)$ ]] ; then comm=null ; fi
fi
if [[ "$comm" == stairs ]] ; then
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=11' status ; break ; fi
if ! [[ "$cella" =~ ^(33)$ ]] ; then comm=null ; fi
fi
#west
if [[ "$comm" == west ]] ; then 
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=11' status ; break ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=33' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 39 ] ; then sed -i '/cell=/c\cell=22' status ; break ; fi
if [ $cella -eq 40 ] ; then sed -i '/cell=/c\cell=25' status ; break ; fi
if [ $cella -eq 42 ] ; then sed -i '/cell=/c\cell=30' status ; break ; fi
if ! [[ "$cella" =~ ^(33|34|35|39|40|42)$ ]] ; then comm=null ; fi
fi
#failure
if ! [[ "$comm" =~ ^(east|north|south|west|stairs)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[l][o][o][k]*) comm=$(sed 's/look//' <<< $case1)
#east
if [[ "$comm" == east ]] ; then 
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i34) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i35) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form lookdoor door1 door19 $i24 1) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form lookdoor door1 door20 $i27 1) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form lookdoor door1 door19 $i23 1) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form lookdoor door1 door20 $i26 1) ; fi
if [ $cella -eq 42 ] ; then output=$(./utils.sh form lookdoor door1 door21 $i31 $key6) ; fi
if ! [[ "$cella" =~ ^(33|34|35|36|39|40|42)$ ]] ; then comm=null ; fi
fi
#north
if [[ "$comm" == north ]] ; then
if [ $cella -eq 36 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i35) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor6 $i33) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i39) ; fi
if [ $cella -eq 42 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor7 $i41) ; fi
if ! [[ "$cella" =~ ^(36|39|40|42)$ ]] ; then comm=null ; fi
fi
#south
if [[ "$comm" == south ]] ; then 
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $39) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i36) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor7 $i37) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i40) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor7 $i41) ; fi
if ! [[ "$cella" =~ ^(33|35|36|39|40)$ ]] ; then comm=null ; fi
fi
if [[ "$comm" == stairs ]] ; then
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki null stairs2 0) ; fi
if ! [[ "$cella" =~ ^(33)$ ]] ; then comm=null ; fi
fi
#west
if [[ "$comm" == west ]] ; then 
if [ $cella -eq 34 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor6 $i33) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i34) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form lookdoor door1 door10 $i22 1) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form lookdoor door1 door20 $i25 1) ; fi
if [ $cella -eq 42 ] ; then  output=$(./utils.sh form lookdoor door1 door19 $i30 1) ; fi
if ! [[ "$cella" =~ ^(34|35|39|40|42)$ ]] ; then comm=null ; fi
fi
#failure
if ! [[ "$comm" =~ ^(east|north|south|west|stairs)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 33 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[l][i][c][k][s][t][a][i][r][s]) output=$(./utils.sh form lick stairs1) ;;

[s][m][e][l][l][e][a][s][t][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][t][a][i][r][s]) output=$(./utils.sh form smell stairs1) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 34 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[s][m][e][l][l][e][a][s][t][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][w][e][s][t][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 35 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][w][e][s][t][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 36 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 39 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 40 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][s][o][u][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 42 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][o][e][a][s][t]) if [ $key6 -eq 1 ]
then
sed -i '/cell=/c\cell=31' status
break 
else
output=$(./utils.sh form uni doorlock)
fi ;;

[l][o][o][k][l][o][c][k])./lib.sh key6b
if [ $key6 -eq 0 ]
then
output=$(./utils.sh form uni doorlock)
else
output=$(./utils.sh form uni doorunlock)
fi ;;

#olfactory

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][n][o][r][t][h][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor3) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

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
