#!/bin/bash
#version=1.08.01

background() {
aux1=
aux2=
pic=
if [[ "$cella" =~ ^(13|33|34)$ ]] ; then num=1 ; fi
if [[ "$cella" =~ ^(17|20|21|35|36|39|40|42)$ ]] ; then num=2 ; fi
if [ "$cella" -eq 15 ] ; then num=3 ;fi
if [[ "$cella" =~ ^(14|16|18|)$ ]] ; then num=0 ; fi
if [ "$cella" -eq 13 ] ; then ./utils.sh colorset 4 ; fi
if [ "$cella" -eq 14 ] ; then ./utils.sh colorset 8 ; fi
if [ "$cella" -eq 15 ] ; then ./utils.sh colorset 7 ; fi
if [ "$cella" -eq 33 ] ; then ./utils.sh colorset 5 ; fi

if [[ "$cella" =~ ^(33|34|35|36|39|40|42)$ ]] 
then
pic="hall1"
prompt=5
fi

if [[ "$cella" =~ ^(13)$ ]] 
then
pic="room1"
prompt=4
fi

if [[ "$cella" =~ ^(14|15|16|17|18|20|21|)$ ]] 
then
pic="basement1"
prompt=7
if [ "$cella" -eq 14 ] ; then prompt=8 ; fi
if [ "$cella" -eq 15 ] ; then pic=15pic1a ; fi
fi

if [ $cella -eq 13 ] ; then
aux1=$(./utils.sh overlay stairs2 10 11 0 0
./utils.sh overlay door9 24 21 0 0)
fi

if [ $cella -eq 14 ] ; then
aux1=$(./utils.sh overlay door8 24 22 0
if [ $hammer -eq 0 ] ; then ./utils.sh overlay hammer1 48 11 0 0; fi
if [ $book113 -eq 0 ] ; then ./utils.sh overlay book7 13 7 0 0; fi)
fi

if [ $cella -eq 16 ] ; then
aux1=$(./utils.sh overlay door4 3 8 1 0
./utils.sh overlay door5 49 8 1 0)
aux2=$(if [ $sprocket -eq 0 ] ; then ./utils.sh overlay sprocket 13 21 0 9 ; fi)
fi

if [ $cella -eq 17 ] ; then
aux1=$(./utils.sh overlay door4 3 8 1 0
./utils.sh overlay door10 24 5 0 0)
fi

if [ $cella -eq 18 ] ; then
aux1=$(./utils.sh overlay door5 49 8 1 0
./utils.sh overlay door10 24 5 0 0)
fi

if [ $cella -eq 20 ] ; then
aux1=$(./utils.sh overlay door5 49 8 1 0
./utils.sh overlay box4 20 9 0 0 0
if [ $i20box -eq 1 ] ; then ./utils.sh overlay box3 22 11 0 0 ; fi)
fi

if [ $cella -eq 21 ] ; then
aux1=$(./utils.sh overlay door8 24 22 0 0)
aux2=$(if [ $book34 -eq 0 ] ; then ./utils.sh overlay book5 13 21 0 9 ; fi)
fi

if [ $cella -eq 33 ] ; then
aux1=$(./utils.sh overlay door7 22 2 0 0
./utils.sh overlay door6 34 5 0 0
./utils.sh overlay stairs1 14 17 0 0)
fi

if [ $cella -eq 34 ] ; then
aux1=$(./utils.sh overlay door7 22 2 0 0
./utils.sh overlay door8 22 22 0 0)
fi

if [ $cella -eq 35 ] ; then
aux1=$(./utils.sh overlay door7 22 2 0 0
./utils.sh overlay door6 39 10 1 0
./utils.sh overlay door4 12 10 1 0)
fi

if [ $cella -eq 36 ] ; then
aux1=$(./utils.sh overlay door7 22 2 0 0
./utils.sh overlay door8 22 22 0 0
./utils.sh overlay door4 16 6 0 0)
fi

if [ $cella -eq 39 ] ; then
aux1=$(./utils.sh overlay door7 22 2 0 0
./utils.sh overlay door8 22 22 1 0
./utils.sh overlay door4 16 6 0 0
./utils.sh overlay door5 35 6 0 0)
fi

if [ $cella -eq 40 ] ; then
aux1=$(./utils.sh overlay door7 22 2 0 0
./utils.sh overlay door8 22 22 0 0
./utils.sh overlay door4 16 6 0 0
./utils.sh overlay door5 35 6 0 0)
fi

if [ $cella -eq 42 ] ; then
aux1=$(./utils.sh overlay door8 22 22 0 0
./utils.sh overlay door5 35 6 0 0
./utils.sh overlay door4 16 6 0 0)
fi

image=$(block/$block/./graphics.sh $pic
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cella $num" 56 4 0 0
echo "$aux1")
echo "$image"
echo "$aux2"
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
if [ $cella -eq 14 ] ; then book113=$(grep 'book113=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 16 ] ; then sprocket=$(grep 'sprocket=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 21 ] ; then book34=$(grep 'book34=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 42 ] ; then key6=$(grep 'key6=' status | cut -d "=" -f2) ; fi

#variables
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)

if [ "$cella" -eq 13 ] ; then i12=$(grep 'i12=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(13|16)$ ]] ; then i15=$(grep 'i15=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 14 ] ; then e30=$(grep 'e30=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 15 ] ; then i13=$(grep 'i13=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(16|18)$ ]] ; then i17=$(grep 'i17=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(15|17)$ ]] ; then i16=$(grep 'i16=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 17 ] ; then i18=$(grep 'i18=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(18|20)$ ]] ; then i19=$(grep 'i19=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 20 ] ; then i21=$(grep 'i21=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 21 ] ; then i20=$(grep 'i20=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 39 ] ; then i22=$(grep 'i22=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 39 ] ; then i23=$(grep 'i23=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 35 ] ; then i24=$(grep 'i24=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 40 ] ; then i25=$(grep 'i25=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 40 ] ; then i26=$(grep 'i26=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 36 ] ; then i27=$(grep 'i27=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 42 ] ; then i30=$(grep 'i30=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 42 ] ; then i31=$(grep 'i31=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(34|39)$ ]] ; then i33=$(grep 'i33=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(33|35)$ ]] ; then i34=$(grep 'i34=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(34|36)$ ]] ; then i35=$(grep 'i35=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 35 ] ; then i36=$(grep 'i36=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 36 ] ; then i37=$(grep 'i37=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(33|40)$ ]] ; then i39=$(grep 'i39=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 39 ] ; then i40=$(grep 'i40=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 42 ] ; then i41=$(grep 'i41=' status | cut -d "=" -f2) ; fi
if [ "$cella" -eq 20 ] ; then i20box=$(grep 'i20box=' status | cut -d "=" -f2) ; fi
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

if [[ "$cella" =~ ^(13|33|34)$ ]] ; then num=1 ; fi
if [[ "$cella" =~ ^(17|20|21|35|36|39|40|42)$ ]] ; then num=2 ; fi
if [[ "$cella" =~ ^(14|16|18|)$ ]] ; then num=0 ; fi
if [ "$cella" -eq 15 ] ; then num=3 ; fi

if [ $mvnt1 -eq 0 ]
then
sed -i '/mvnt2=/c\mvnt2=0' status
else
sed -i "/mvnt2=/c\mvnt2=$num" status
fi

printf "\e[0;0H"
background
intro=2
fi
./utils.sh prompt "$last" "$bar" "$output" $prompt
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

#common space

case $case1 in

[l][o][o][k]) if [ $cella -eq 13 ] ; then output=$(./utils.sh form looki i13) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form looki i14 book2 $book113 hammer1 $hammer) ; fi
if [ $cella -eq 15 ] ; then output=$(./utils.sh form looki i15) ; fi
if [ $cella -eq 16 ] ; then output=$(./utils.sh form looki i16) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form looki i17) ; fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form looki i18) ; fi
if [ $cella -eq 20 ] ; then output=$(./utils.sh form looki i20 box1 $i20box) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form looki i21) ; fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki i33) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form looki i34) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form looki i35) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form looki i36) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form looki i39) ; fi
if [ $cella -eq 40 ] && [ $cella -eq 42 ] ; then output=$(./utils.sh form looki i40) ; fi ;;

[l][o][o][k][f][l][o][o][r]) if [[ $cella =~ ^(13|33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form looki null floor1 0) ; fi
if [[ $cella =~ ^(14|)$ ]] ; then
output=$(./utils.sh form looki null floor5 0) ; fi
if [ $cella -eq 16 ] ; then output=$(./utils.sh form looki null floor5 0 sprocket1 $sprocket) ; fi
if [[ $cella =~ ^(15|17|18|20)$ ]] ; then output=$(./utils.sh form looki null floor5 0) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form looki null floor5 0 book8 $book34) ;fi
 ;;

[l][o][o][k][w][a][l][l]) if [[ $cella =~ ^(13|33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form looki null wall1 0) ; fi 
if [[ $cella =~ ^(14)$ ]] ; then
output=$(./utils.sh form looki null wall6 0) ; fi
if [[ $cella =~ ^(15|16|17|18|20|21)$ ]] ; then
output=$(./utils.sh form looki null wall7 0) ; fi ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) if [[ $cella =~ ^(13|33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form lick floori) ; fi
if [[ $cella =~ ^(14|15|16|17|18|20|21)$ ]] ; then output=$(./utils.sh form lick floor3) ; fi
;;

[l][i][c][k][w][a][l][l]) if [[ $cella =~ ^(13|33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form lick wall) ; fi
if [ $cella  -eq 14 ] ; then output=$(./utils.sh form lick door3) ; fi
if [[ $cella =~ ^(15|16|17|18|20|21)$ ]] ; then output=$(./utils.sh form lick wall3) ; fi ;;

[s][m][e][l][l]) if [[ $cella =~ ^(33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form smell i33) ;fi 
if [ $cella -eq 13 ] ; then output=$(./utils.sh form smell i01) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form smell i14) ; fi 
if [[ $cella =~ ^(15|16|17|18|20|21)$ ]] ; then output=$(./utils.sh form smell i15); fi;;

[s][m][e][l][l][f][l][o][o][r]) if [[ $cella =~ ^(13|33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form smell floori) ; fi
if [[ $cella =~ ^(14|15|16|17|18|20|21)$ ]] ; then output=$(./utils.sh form smell floor4) ;fi ;;

[s][m][e][l][l][w][a][l][l]) if [[ $cella =~ ^(13|33|34|35|36|39|40|42)$ ]] ; then
output=$(./utils.sh form smell wall) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form smell wall4) ; fi
if [[ $cella =~ ^(15|16|17|18|20|21) ]] ; then output=$(./utils.sh form semll wall5) ; fi ;;

*) case1=(system${case1}) ;;

esac

if [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in


[g][o]*) comm=$(sed 's/go//' <<< $case1)
#east
if [[ "$comm" == east ]] ; then 
if [[ $cella =~ ^(13|16)$ ]] ; then sed -i '/cella=/c\cella=15' status ; intro=0 ; fi
if [ $cella -eq 17 ] ; then sed -i '/cella=/c\cella=16' status ; intro=0 ; fi
if [ $cella -eq 18 ] ; then sed -i '/cell=/c\cell=19' status ; break ; fi
if [ $cella -eq 33 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cell=/c\cell=24' status ; break ; fi
if [ $cella -eq 36 ] ; then sed -i '/cell=/c\cell=27' status ; break ; fi
if [ $cella -eq 39 ] ; then sed -i '/cell=/c\cell=23' status ; break  ; fi
if [ $cella -eq 40 ] ; then sed -i '/cell=/c\cell=26' status ; break ; fi
if [ $cella -eq 42 ] ; then if [ $key6 -eq 1 ] ; then sed -i '/cell=/c\cell=31' status ; break
else output=$(./utils.sh form uni doorlock) ; fi ; fi
if ! [[ "$cella" =~ ^(13|15|16|17|18|33|34|35|36|39|40|42)$ ]] ; then comm=null ; fi
fi
#north
if [[ "$comm" == north ]] ; then
if [ $cella -eq 15 ] ; then sed -i '/cella=/c\cella=13' status ; intro=0 ; fi
if [ $cella -eq 18 ] ; then sed -i '/cella=/c\cella=17' status ; intro=0 ; fi
if [ $cella -eq 21 ] ; then sed -i '/cella=/c\cella=20' status ; intro=0 ; fi
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=11' status ; break ; fi
if [ $cella -eq 36 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 39 ] ; then sed -i '/cella=/c\cella=33' status ; intro=0 ; fi
if [ $cella -eq 40 ] ; then sed -i '/cella=/c\cella=39' status ; intro=0 ; fi
if [ $cella -eq 42 ] ; then sed -i '/cell=/c\cell=41' status ; break ; fi
if ! [[ "$cella" =~ ^(18|21|36|39|40|42)$ ]] ; then comm=null ; fi
fi
#south
if [[ "$comm" == south ]] ; then 
if [ $cella -eq 14 ] ; then sed -i '/cell=/c\cell=30' status
sed -i '/block=/c\block=e' status ; break ; fi
if [ $cella -eq 17 ] ; then sed -i '/cella=/c\cella=18' status ; intro=0 ; fi
if [ $cella -eq 20 ] ; then if [ $i20box -eq 0 ] ; then output=$(./utils.sh form uni go)
else sed -i '/cella=/c\cella=21' status ; intro=0 ;fi ; fi
if [ $cella -eq 33 ] ; then sed -i '/cella=/c\cella=39' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=36' status ; intro=0  ; fi
if [ $cella -eq 36 ] ; then sed -i '/cell=/c\cell=37' status ; break ; fi
if [ $cella -eq 39 ] ; then sed -i '/cella=/c\cella=40' status ; intro=0 ; fi
if [ $cella -eq 40 ] ; then sed -i '/cell=/c\cell=41' status ; break ; fi
if ! [[ "$cella" =~ ^(14|17|20|33|35|36|39|40)$ ]] ; then comm=null ; fi
fi
if [[ "$comm" == stairs ]] ; then
if [ $cella -eq 13 ] ; then sed -i '/cella=/c\cella=15' status ; intro=0 ; fi
if [ $cella -eq 15 ] ; then sed -i '/cella=/c\cella=13' status ; intro=0 ; fi
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=11' status ; break ; fi
if ! [[ "$cella" =~ ^(13|15|33)$ ]] ; then comm=null ; fi
fi
#west
if [[ "$comm" == west ]] ; then 
if [ $cella -eq 13 ] ; then sed -i '/cell=/c\cell=12' status ; break ; fi
if [ $cella -eq 15 ] ; then sed -i '/cella=/c\cella=16' status ; intro=0 ;fi
if [ $cella -eq 16 ] ; then sed -i '/cella=/c\cella=17' status; intro=0 ;fi
if [ $cella -eq 20 ] ; then sed -i '/cell=/c\cell=19' status ; break ;fi
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=11' status ; break ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=33' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 39 ] ; then sed -i '/cell=/c\cell=22' status ; break ; fi
if [ $cella -eq 40 ] ; then sed -i '/cell=/c\cell=25' status ; break ; fi
if [ $cella -eq 42 ] ; then sed -i '/cell=/c\cell=30' status ; break ; fi
if ! [[ "$cella" =~ ^(13|15|16|20|33|34|35|39|40|42)$ ]] ; then comm=null ; fi
fi
#failure
if ! [[ "$comm" =~ ^(east|north|south|west|stairs)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[l][o][o][k]*) comm=$(sed 's/look//' <<< $case1)
#east
if [[ "$comm" == east ]] ; then 
if [ $cella -eq 13 ] ; then output=$(./utils.sh form lookdoor door1 door15 $i12 1) ; fi
if [ $cella -eq 16 ] ; then output=$(./utils.sh form lookdoor door1 door8 $i15 1) ;fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form lookdoor door1 door8 $i16 1) ;fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form lookdoor door1 door8 $i19 1) ;fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i34) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i35) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form lookdoor door1 door19 $i24 1) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form lookdoor door1 door20 $i27 1) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form lookdoor door1 door19 $i23 1) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form lookdoor door1 door20 $i26 1) ; fi
if [ $cella -eq 42 ] ; then output=$(./utils.sh form lookdoor door1 door21 $i31 $key6) ; fi
if ! [[ "$cella" =~ ^(13|16|17|18|33|34|35|36|39|40|42)$ ]] ; then comm=null ; fi
fi
#north
if [[ "$comm" == north ]] ; then
if [ $cella -eq 18 ] ; then output=$(./utils.sh form lookdoor door1 door8 $i17 1) ;fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i35) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor6 $i33) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i39) ; fi
if [ $cella -eq 42 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor7 $i41) ; fi
if ! [[ "$cella" =~ ^(18|36|39|40|42)$ ]] ; then comm=null ; fi
fi
#south
if [[ "$comm" == south ]] ; then 
if [ $cella -eq 14 ] ; then output=$(./utils.sh form lookdoor door16 door12 $e30 $key2) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form lookdoor door1 door8 $18 1) ;fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $39) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i36) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor7 $i37) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i40) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor7 $i41) ; fi
if ! [[ "$cella" =~ ^(14|17|33|35|36|39|40)$ ]] ; then comm=null ; fi
fi
if [[ "$comm" == stairs ]] ; then
if [ $cella -eq 33 ] ; then output=$(./utils.sh form looki null stairs2 0) ; fi
if [ $cella -eq 13 ] ; then output=$(./utils.sh form looki null stairs2 0) ; fi
if [ $cella -eq 15 ] ; then output=$(./utils.sh form looki null stairs1 0) ; fi
if ! [[ "$cella" =~ ^(13|15|33)$ ]] ; then comm=null ; fi
fi
#west
if [[ "$comm" == west ]] ; then 
if [ $cella -eq 15 ] ; then output=$(./utils.sh form lookdoor door1 door15 $i12 1) ; fi
if [ $cella -eq 16 ] ; then output=$(./utils.sh form lookdoor door1 door8 $i17 1 ) ; fi
if [ $cella -eq 20 ] ; then output=$(./utils.sh form lookdoor door1 door8 $i19 $key1) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor6 $i33) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form looki null corridor4 0 corridor5 $i34) ; fi
if [ $cella -eq 39 ] ; then output=$(./utils.sh form lookdoor door1 door10 $i22 1) ; fi
if [ $cella -eq 40 ] ; then output=$(./utils.sh form lookdoor door1 door20 $i25 1) ; fi
if [ $cella -eq 42 ] ; then  output=$(./utils.sh form lookdoor door1 door19 $i30 1) ; fi
if ! [[ "$cella" =~ ^(15|16|20|34|35|39|40|42)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == lock ]] ; then 
if [ $cella -eq 42 ] ; then ./lib.sh key6b ; if [ $key6 -eq 0 ] ; then output=$(./utils.sh form uni doorlock)
else output=$(./utils.sh form uni doorunlock) ; fi ; fi
if ! [[ "$cella" =~ ^(42)$ ]] ; then comm=null ; fi
fi

#failure
if ! [[ "$comm" =~ ^(east|north|south|west|stairs|lock)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[r][e][a][d]*) comm=$(sed 's/read//' <<< $case1)

if [[ "$comm" == book ]] ; then 
if [ $cella -eq 14 ] ; then ./utils.sh reader book113r ; intro=0 ; fi
if [ $cella -eq 21 ] ; then ./utils.sh reader book34r ; intro=0 ; fi
if ! [[ "$cella" =~ ^(14|)$ ]] ; then comm=null ; fi
fi

#failure
if ! [[ "$comm" =~ ^(book)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[l][i][c][k]*) comm=$(sed 's/lick//' <<< $case1)

if [[ "$comm" == book ]] ; then 
if [[ $cella =~ ^(14|21)$ ]] ; then output=$(./utils.sh form lick book); fi
if ! [[ "$cella" =~ ^(14|21)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == box ]] ; then 
if [[ $cella =~ ^(20|21)$ ]] ; then output=$(./utils.sh form lick box4); fi
if ! [[ "$cella" =~ ^(20|21)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == eastdoor ]] ; then 
if [[ $cella =~ ^(16|17|18|20|35|36|39|40|42)$ ]] ; then output=$(./utils.sh form lick door); fi
if ! [[ "$cella" =~ ^(16|17|18|20|35|36|39|40|42)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == northdoor ]] ; then 
if [[ $cella =~ ^(18)$ ]] ; then output=$(./utils.sh form lick door); fi
if ! [[ "$cella" =~ ^(18)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == southdoor ]] ; then 
if [[ $cella =~ ^(|17)$ ]] ; then output=$(./utils.sh form lick door); fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form lick door3) ; fi
if ! [[ "$cella" =~ ^(14|17)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == stairs ]] ; then 
if [[ $cella =~ ^(13|15|33)$ ]] ; then output=$(./utils.sh form lick stairs1); fi
if ! [[ "$cella" =~ ^(13|15|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == westdoor ]] ; then 
if [[ $cella =~ ^(13|15|16|39|42)$ ]] ; then output=$(./utils.sh form lick door); fi
if ! [[ "$cella" =~ ^(13|15|16|39|42)$ ]] ; then comm=null ; fi
fi

#failure
if ! [[ "$comm" =~ ^(book|box|eastdoor|northdoor|southdoor|westdoor|stairs)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[s][m][e][l][l]*) comm=$(sed 's/smell//' <<< $case1)

if [[ "$comm" == book ]] ; then 
if [[ $cella =~ ^(14|21)$ ]] ; then output=$(./utils.sh form smell book); fi
if ! [[ "$cella" =~ ^(14|21)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == box ]] ; then 
if [[ $cella =~ ^(20|21)$ ]] ; then output=$(./utils.sh form smell hole); fi
if ! [[ "$cella" =~ ^(20|21)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == eastcorridoor ]] ; then 
if [[ $cella =~ ^(33|34)$ ]] ; then output=$(./utils.sh form smell corridor3); fi
if ! [[ "$cella" =~ ^(33|34)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == eastdoor ]] ; then 
if [[ $cella =~ ^(16|17|18|35|36|39|40|42)$ ]] ; then output=$(./utils.sh form smell door); fi
if ! [[ "$cella" =~ ^(16|17|18|35|36|39|40|42)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == northcorridoor ]] ; then 
if [[ $cella =~ ^(18|36|39|40|42)$ ]] ; then output=$(./utils.sh form smell corridor3); fi
if ! [[ "$cella" =~ ^(18|36|39|40|42)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == southcorridoor ]] ; then 
if [[ $cella =~ ^(17|33|35|36|39|40)$ ]] ; then output=$(./utils.sh form smell corridor3); fi
if ! [[ "$cella" =~ ^(17|33|35|36|39|40)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == northdoor ]] ; then 
if [[ $cella =~ ^()$ ]] ; then output=$(./utils.sh smell smell door); fi
if ! [[ "$cella" =~ ^()$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == stairs ]] ; then 
if [[ $cella =~ ^(13|15|33)$ ]] ; then output=$(./utils.sh form smell stairs1); fi
if ! [[ "$cella" =~ ^(13|15|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == westcorridoor ]] ; then 
if [[ $cella =~ ^(34|35)$ ]] ; then output=$(./utils.sh form smell door); fi
if ! [[ "$cella" =~ ^(34|35)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == westdoor ]] ; then 
if [[ $cella =~ ^(13|16|20|39|42)$ ]] ; then output=$(./utils.sh form smell door); fi
if ! [[ "$cella" =~ ^(13|16|20|39|42)$ ]] ; then comm=null ; fi
fi

#failure
if ! [[ "$comm" =~ ^(book|box|eastdoor|northdoor|northcorridoor|southcorridor|southdoor|sprocket|westdoor|stairs)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 14 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][b][o][o][k]) if [ $book113 -eq 0 ]
then
sed -i '/book113=/c\book113=1' status
intro=1
output=$(./utils.sh form uni get2 book)
./lib.sh journal1 2
else
output=$(./utils.sh form uni get1)
fi ;;

[g][e][t][h][a][m][m][e][r]) if [ $hammer -eq 0 ]
then
sed -i '/hammer=/c\hammer=1' status
intro=1
output=$(./utils.sh form uni get2 hammer)
else
output=$(./utils.sh form uni get3 hammer)
fi ;;

[l][o][o][k][b][o][o][k]) output=$(./utils.sh form uni book) ;;

[l][o][o][k][h][a][m][m][e][r]) output=$(./utils.sh form looki null hammer2 0) ;;

[l][i][c][k][h][a][m][m][e][r]) output=$(./utils.sh form lick hammer1) ;;

[s][m][e][l][l][h][a][m][m][e][r]) output=$(./utils.sh form smell hammer);;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh form smell doore) ;;

*) case1=(system${case1}) ;;

esac
fi


if [ $cella -eq 16 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][s][p][r][o][c][k][e][t]) if [ $sprocket -eq 0 ]
then
sed -i '/sprocket=/c\sprocket=1' status
intro=1
output=$(./utils.sh form uni get2 sprocket)
else
output=$(./utils.sh form uni get3 sprocket)
fi ;;

[l][o][o][k][s][p][r][o][c][k][e][t]) output=$(./utils.sh form looki null sprocket2 0) ;;

[l][i][c][k][s][p][r][o][c][k][e][t]) output=$(./utils.sh form lick key) ;;

[s][m][e][l][l][s][p][r][o][c][k][e][t]) output=$(./utils.sh form smell key) ;;

*) case1=(system${case1}) ;;

esac
fi


if [ $cella -eq 20 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[l][o][o][k][b][o][x]) if [ $i20box -eq 0 ]
then
output=$(./utils.sh form looki null box7 0)
else
output=$(./utils.sh form looki null box11 0 door26 $i21)
fi ;;

[o][p][e][n][b][o][x]) if [ $i20box -eq 1 ]
then
output=$(./utils.sh form looki null box11 0)
else
sed -i "/i20box=/c\i20box=1" status
intro=1
output=$(./utils.sh form looki null box9 0)
fi ;;


*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 21 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][b][o][o][k]) if [ $book34 -eq 0 ]
then
sed -i '/book34=/c\book34=1' status
sed -i '/clockkey=/c\clockkey=0' status
output=$(./utils.sh form uni get2 book)
intro=1
else
output=$(./utils.sh form uni get1)
fi ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form looki null box10 0) ;;

[l][o][o][k][b][o][o][k]) if [ $book34 -eq 0 ] 
then
output=$(./utils.sh form looki null book8 0)
else
output=$(./utils.sh form looki null book9 0)
fi;;



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
