#!/bin/bash
#version=1.08.02

background() {

if [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|11|15|17|18|19|23|24|26|28|34|35)$ ]] ; then num=0 ; fi
if [[ "$cella" =~ ^(10|12|14|21|29)$ ]] ; then num=1 ; fi
if [[ "$cella" =~ ^(33|36|37)$ ]] ; then num=2 ; fi
if [[ "$cella" =~ ^(27)$ ]] ; then num=3 ; fi

if [[ "$cella" =~ ^(02|03|04)$ ]] ; then pic=ext1 ; fi
if [[ "$cella" =~ ^(18|29)$ ]] ; then pic=ext2 ; fi
if [[ "$cella" =~ ^(01|05|06|07|09|10|11|12|14|15|17|19|21|23|24|26|27|28|33|34|35|36|37)$ ]] ; then pic=${cella}pic1 ; fi
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${pic}
sidebar
if [ $cella -eq 02 ] ; then ./utils.sh overlay shrub1 26 12 0 0
if [ $i30bwindow -eq 1 ] ; then ./utils.sh overlay win1 23 1 0 0; fi ; fi
if [ $cella -eq 03 ] ; then ./utils.sh overlay tree1 44 7 0 0
 if [ $i31window -eq 1 ] ; then ./utils.sh overlay win1 23 1 0 0; fi ; fi
if [ $cella -eq 04 ] ; then ./utils.sh overlay tree2 2 7 0 0
if [ $i32bwindow -eq 1 ] ; then ./utils.sh overlay win1 23 1 0 0; fi ; fi
if [ $cella -eq 09 ] ; then if [ $i32awindow -eq 1 ] ; then ./utils.sh overlay win9 2 4 0 0; fi ; fi
if [ $cella -eq 12 ] ; then if [ $i28window -eq 1 ] ; then ./utils.sh overlay win1 23 1 0 0; fi ; fi
if [ $cella -eq 18 ] ; then ./utils.sh overlay rock1 10 14 0 1
./utils.sh overlay tree3 24 4 0 0 ; fi
if [ $cella -eq 19 ] ; then if [ $wolf -eq 2 ] ; then ./utils.sh overlay eyes1 49 14 0 0; fi ; fi
if [ $cella -eq 21 ] ; then if [ $i24bwindow -eq 1 ] ; then ./utils.sh overlay win11 2 3 0 0 ; fi ; fi
if [ $cella -eq 23 ] ; then if [ $wolf -eq 2 ] ; then ./utils.sh overlay eyes1 49 15 0 0; fi ; fi
if [ $cella -eq 27 ] ; then if [ $i24awindow -eq 1 ] ; then ./utils.sh overlay win11 2 3 0 0; fi ; fi
if [ $cella -eq 29 ] ; then ./utils.sh overlay shed1 22 4 0 0 ; fi
if [ $cella -eq 33 ] ; then if [ $i24awindow -eq 1 ] ; then ./utils.sh overlay win8 15 4 0 0; fi ; fi
if [ $cella -eq 35 ] ; then if [ $wolf -eq 2 ] ; then ./utils.sh overlay eyes2 48 8 0 0; fi ; fi
)
echo "$image"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cella $num" 56 4 0 0
}

vars() {
#base
block=$(grep 'block=' status | cut -d "=" -f2)
cella=$(grep "cella=" status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)
if [ $cella -eq 19 ] ; then book18=$(grep 'book18=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 24 ] ; then book22=$(grep 'book22=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 12 ] ; then key5=$(grep 'key5=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 10 ] ; then key7=$(grep 'key7=' status | cut -d "=" -f2) ; fi

#variables
greed=$(grep 'greed=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)

if [[ "$cella" =~ ^(19|23|29|35|37)$ ]] ; then wolf=$(grep 'wolf=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 02 ] ; then i30bwindow=$(grep 'i30bwindow=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 03 ] ; then i31window=$(grep 'i31window=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 04 ] ; then i32bwindow=$(grep 'i32bwindow=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 09 ] ; then i32awindow=$(grep 'i32awindow=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 12 ] ; then i28window=$(grep 'i28window=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 21 ] ; then i24bwindow=$(grep 'i24bwindow=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 27 ] ; then i24awindow=$(grep 'i24awindow=' status | cut -d "=" -f2) ; fi
if [ $cella -eq 33 ] ; then i24awindow=$(grep 'i24awindow=' status | cut -d "=" -f2) ; fi

if [[ "$cella" =~ ^(02)$ ]] ; then e01=$(grep 'e01=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(01|03)$ ]] ; then e02=$(grep 'e02=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(02|04)$ ]] ; then e03=$(grep 'e03=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(03|05)$ ]] ; then e04=$(grep 'e04=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(04|06|09)$ ]] ; then e05=$(grep 'e05=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(05|07|10)$ ]] ; then e06=$(grep 'e06=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(06|11)$ ]] ; then e07=$(grep 'e07=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(01|12)$ ]] ; then e08=$(grep 'e08=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(05|10)$ ]] ; then e09=$(grep 'e09=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(06|09|11|14)$ ]] ; then e10=$(grep 'e10=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(07|15)$ ]] ; then e11=$(grep 'e11=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(09|14|17)$ ]] ; then e13=$(grep 'e13=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(10|15|18)$ ]] ; then e14=$(grep 'e14=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(11|14|19)$ ]] ; then e15=$(grep 'e15=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(12)$ ]] ; then e16=$(grep 'e16=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(21)$ ]] ; then e17=$(grep 'e17=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(14|17|19)$ ]] ; then e18=$(grep 'e18=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(15|18|23)$ ]] ; then e19=$(grep 'e19=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(24)$ ]] ; then e20=$(grep 'e20=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(17|28)$ ]] ; then e21=$(grep 'e21=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(18|21|23|29)$ ]] ; then e22=$(grep 'e22=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(19)$ ]] ; then e23=$(grep 'e23=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(24|26)$ ]] ; then e25=$(grep 'e25=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(25|27|33)$ ]] ; then e26=$(grep 'e26=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(26|28|34)$ ]] ; then e27=$(grep 'e27=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(21|27|29|35)$ ]] ; then e28=$(grep 'e28=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(28|36)$ ]] ; then e29=$(grep 'e29=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(23|29|37)$ ]] ; then e30=$(grep 'e30=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(24)$ ]] ; then e31=$(grep 'e31=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(31)$ ]] ; then e32=$(grep 'e32=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(26|34)$ ]] ; then e33=$(grep 'e33=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(27|33|35)$ ]] ; then e34=$(grep 'e34=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(28|34|36)$ ]] ; then e35=$(grep 'e35=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(29|35|37)$ ]] ; then e36=$(grep 'e36=' status | cut -d "=" -f2) ; fi
if [[ "$cella" =~ ^(36)$ ]] ; then e36=$(grep 'e37=' status | cut -d "=" -f2) ; fi
}
helpcount=0
intro=0

block=$(grep "block=" status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
mvnt1=$(grep "mvnt1=" status | cut -d "=" -f2)

events(){

./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then exit ; fi
sleep=$(grep "sleep=" status | cut -d "=" -f2)
sleepthreshold=$(grep "sleepthreshold=" status | cut -d "=" -f2)
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)

}

while true ; do

vars

if [ $intro -lt 2 ]
then
if [ $intro -eq 0 ] ; then output=$(./utils.sh form 1) 
if [[ $cella != $cellb ]] ; then events ; fi
cellb=$cella ; fi
sed -i '/${block}${cella}=/c\\${block}${cella}=1' status

if [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|11|15|17|18|19|23|24|26|28|34|35)$ ]] ; then num=0 ; fi
if [[ "$cella" =~ ^(10|12|14|21|29)$ ]] ; then num=1 ; fi
if [[ "$cella" =~ ^(33|36|37)$ ]] ; then num=2 ; fi
if [[ "$cella" =~ ^(27)$ ]] ; then num=3 ; fi
if [ $mvnt1 -eq 0 ]
then
sed -i '/mvnt2=/c\mvnt2=0' status
else
sed -i "/mvnt2=/c\mvnt2=$num" status
fi

printf "\e[0;0H"
background
intro=2
sed -i "/intro=/c\intro=2" status
fi
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

#common space
case $case1 in

[l][o][o][k]) if [ $cella -eq 01 ] ; then output=$(./utils.sh form 1 elook 01) ; fi
if [ $cella -eq 02 ] ; then output=$(./utils.sh form 1 elook 02) ; fi
if [ $cella -eq 03 ] ; then output=$(./utils.sh form 1 elook 03) ; fi
if [ $cella -eq 04 ] ; then output=$(./utils.sh form 1 elook 04) ; fi
if [ $cella -eq 07 ] ; then output=$(./utils.sh form 1 elook 07) ; fi
if [ $cella -eq 09 ] ; then output=$(./utils.sh form 1 elook 09) ; fi
if [ $cella -eq 10 ] ; then output=$(./utils.sh form 1 elook 10) ; fi
if [ $cella -eq 12 ] ; then output=$(./utils.sh form 1 elook 12) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form 1 elook 14) ; fi
if [ $cella -eq 15 ] ; then output=$(./utils.sh form 1 elook 15) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form 1 elook 17) ; fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form 1 elook 18) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form 1 elook 19 wolf $wolf) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form 1 elook 21) ; fi
if [ $cella -eq 23 ] ; then output=$(./utils.sh form 1 elook 23 wolf $wolf) ; fi
if [ $cella -eq 24 ] ; then output=$(./utils.sh form 1 elook 24) ; fi
if [ $cella -eq 26 ] ; then output=$(./utils.sh form 1 elook 26) ; fi
if [ $cella -eq 27 ] ; then output=$(./utils.sh form 1 elook 27) ; fi
if [ $cella -eq 28 ] ; then output=$(./utils.sh form 1 elook 28) ; fi
if [ $cella -eq 29 ] ; then output=$(./utils.sh form 1 elook 29) ; fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form 1 elook 33) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form 1 elook 35 wolf $wolf) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form 1 elook 36) ; fi
if [ $cella -eq 37 ] ; then output=$(./utils.sh form 1 elook 37) ; fi
if [[ "$cella" =~ ^(05|06)$ ]] ; then output=$(./utils.sh form 1 elook 05) ; fi
if [[ "$cella" =~ ^(11|34)$ ]] ; then output=$(./utils.sh form 1 elook 11) ; fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 elooka floor) ;;

#olfactory

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) 
if [[ "$cella" =~ ^(19|23|35|37)$ ]] && [ $wolf -eq 2 ] 
then output=$(./utils.sh form 1 smell wolf1)
else output=$(./utils.sh form 1 smell e) ; fi;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

*) case1=(system${case1}) ;;

esac

if [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in


[g][o]*) comm=$(sed 's/go//' <<< $case1)
#east
if [[ "$comm" == east ]] ; then
if [ $cella -eq 01 ] ; then sed -i '/cella=/c\cella=02' status ; intro=0 ; fi
if [ $cella -eq 02 ] ; then sed -i '/cella=/c\cella=03' status ; intro=0 ; fi
if [ $cella -eq 03 ] ; then sed -i '/cella=/c\cella=04' status ; intro=0 ; fi
if [ $cella -eq 04 ] ; then sed -i '/cella=/c\cella=05' status ; intro=0 ; fi
if [ $cella -eq 05 ] ; then sed -i '/cella=/c\cella=06' status ; intro=0 ; fi
if [ $cella -eq 06 ] ; then sed -i '/cella=/c\cella=07' status ; intro=0 ; fi
if [ $cella -eq 09 ] ; then sed -i '/cella=/c\cella=10' status ; intro=0 ; fi
if [ $cella -eq 10 ] ; then sed -i '/cella=/c\cella=11' status ; intro=0 ; fi
if [ $cella -eq 14 ] ; then sed -i '/cella=/c\cella=15' status ; intro=0 ; fi
if [ $cella -eq 17 ] ; then sed -i '/cella=/c\cella=18' status ; intro=0 ; fi
if [ $cella -eq 18 ] ; then sed -i '/cella=/c\cella=19' status ; intro=0 ; fi
if [ $cella -eq 21 ] ; then sed -i '/cell=/c\cell=22' status ; break ; fi
if [ $cella -eq 24 ] ; then sed -i '/cella=/c\cella=28' status ; intro=0 ; fi
if [ $cella -eq 26 ] ; then sed -i '/cella=/c\cella=27' status ; intro=0 ; fi
if [ $cella -eq 27 ] ; then sed -i '/cella=/c\cella=28' status ; intro=0 ; fi
if [ $cella -eq 28 ] ; then sed -i '/cella=/c\cella=29' status ; intro=0 ; fi
if [ $cella -eq 33 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=36' status ; intro=0 ; fi
if [ $cella -eq 36 ] ; then sed -i '/cella=/c\cella=37' status ; intro=0 ; fi

if [ $cella -eq 29 ] ; then if [ $wolf -eq 2 ]
then sed -i '/cell=/c\cell=30a' status
else sed -i '/cell=/c\cell=30' status ; fi ; break ; fi
if [[ "$cella" =~ ^(07|11)$ ]] ; then output=$(./utils.sh form 1 elooka hedge3) ; fi
if [[ "$cella" =~ ^(15|19|23|37)$ ]] ; then output=$(./utils.sh form 1 elooka forest2) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|10|11|14|15|17|18|19|21|23|24|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#north
if [[ "$comm" == north ]] ; then
if [ $cella -eq 01 ] ; then sed -i '/cell=/c\cell=08' status ; break ; fi
if [ $cella -eq 05 ] ; then sed -i '/cella=/c\cella=09' status ; intro=0 ; fi
if [ $cella -eq 06 ] ; then sed -i '/cella=/c\cella=10' status ; intro=0 ; fi
if [ $cella -eq 07 ] ; then sed -i '/cella=/c\cella=11' status ; intro=0 ; fi
if [ $cella -eq 09 ] ; then sed -i '/cell=/c\cell=13' status ; break ; fi
if [ $cella -eq 10 ] ; then sed -i '/cella=/c\cella=14' status ; intro=0 ; fi
if [ $cella -eq 11 ] ; then sed -i '/cella=/c\cella=15' status ; intro=0 ; fi
if [ $cella -eq 12 ] ; then sed -i '/cell=/c\cell=16' status ; break ; fi
if [ $cella -eq 14 ] ; then sed -i '/cella=/c\cella=18' status ; intro=0 ; fi
if [ $cella -eq 15 ] ; then sed -i '/cella=/c\cella=19' status ; intro=0 ; fi
if [ $cella -eq 17 ] ; then sed -i '/cella=/c\cella=21' status ; intro=0 ; fi
if [ $cella -eq 18 ] ; then sed -i '/cell=/c\cell=22' status ; break ; fi
if [ $cella -eq 19 ] ; then sed -i '/cella=/c\cella=23' status ; intro=0 ; fi
if [ $cella -eq 21 ] ; then sed -i '/cella=/c\cella=28' status ; intro=0 ; fi
if [ $cella -eq 24 ] ; then sed -i '/cell=/c\cell=31' status ; break ; fi
if [ $cella -eq 26 ] ; then sed -i '/cella=/c\cella=33' status ; intro=0 ; fi
if [ $cella -eq 27 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 28 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 29 ] ; then sed -i '/cella=/c\cella=36' status ; intro=0 ; fi

if [ $cella -eq 23 ] ; then if [ $wolf -eq 2 ]
then sed -i '/cell=/c\cell=30a' status
else sed -i '/cell=/c\cell=30' status ; fi ; break ; fi
if [[ "$cella" =~ ^(33|34)$ ]] ; then output=$(./utils.sh form 1 elooka hedge3) ; fi
if [[ "$cella" =~ ^(35|36|37)$ ]] ; then output=$(./utils.sh form 1 elooka forest2) ; fi
if ! [[ "$cella" =~ ^(01|05|06|07|09|10|11|12|14|15|17|18|19|21|23|24|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#south
if [[ "$comm" == south ]] ; then
if [ $cella -eq 09 ] ; then sed -i '/cella=/c\cella=05' status ; intro=0 ; fi
if [ $cella -eq 10 ] ; then sed -i '/cella=/c\cella=06' status ; intro=0 ; fi
if [ $cella -eq 11 ] ; then sed -i '/cella=/c\cella=07' status ; intro=0 ; fi
if [ $cella -eq 12 ] ; then sed -i '/cell=/c\cell=08' status ; break ; fi
if [ $cella -eq 14 ] ; then sed -i '/cella=/c\cella=10' status ; intro=0 ; fi
if [ $cella -eq 15 ] ; then sed -i '/cella=/c\cella=11' status ; intro=0 ; fi
if [ $cella -eq 17 ] ; then sed -i '/cell=/c\cell=13' status ; break ; fi
if [ $cella -eq 18 ] ; then sed -i '/cella=/c\cella=14' status ; intro=0 ; fi
if [ $cella -eq 19 ] ; then sed -i '/cella=/c\cella=15' status ; intro=0 ; fi
if [ $cella -eq 21 ] ; then sed -i '/cella=/c\cella=17' status ; intro=0 ; fi
if [ $cella -eq 23 ] ; then sed -i '/cella=/c\cella=19' status ; intro=0 ; fi
if [ $cella -eq 24 ] ; then sed -i '/cell=/c\cell=20' status ; break ; fi
if [ $cella -eq 28 ] ; then sed -i '/cella=/c\cella=21' status ; intro=0 ; fi
if [ $cella -eq 29 ] ; then sed -i '/cell=/c\cell=22' status ; break ; fi
if [ $cella -eq 33 ] ; then sed -i '/cella=/c\cella=26' status ; intro=0 ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=27' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=28' status ; intro=0 ; fi
if [ $cella -eq 36 ] ; then sed -i '/cella=/c\cella=29' status ; intro=0 ; fi

if [ $cella -eq 37 ] ; then if [ $wolf -eq 2 ]
then sed -i '/cell=/c\cell=30a' status
else sed -i '/cell=/c\cell=30' status ; fi ; break ; fi
if [[ "$cella" =~ ^(01|02|03|04|05|06|07)$ ]] ; then output=$(./utils.sh form 1 elooka hedge3) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|10|11|12|14|15|17|18|19|21|23|24|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#west
if [[ "$comm" == west ]] ; then
if [ $cella -eq 02 ] ; then sed -i '/cella=/c\cella=01' status ; intro=0 ; fi
if [ $cella -eq 03 ] ; then sed -i '/cella=/c\cella=02' status ; intro=0 ; fi
if [ $cella -eq 04 ] ; then sed -i '/cella=/c\cella=03' status ; intro=0 ; fi
if [ $cella -eq 05 ] ; then sed -i '/cella=/c\cella=04' status ; intro=0 ; fi
if [ $cella -eq 06 ] ; then sed -i '/cella=/c\cella=05' status ; intro=0 ; fi
if [ $cella -eq 07 ] ; then sed -i '/cella=/c\cella=06' status ; intro=0 ; fi
if [ $cella -eq 10 ] ; then sed -i '/cella=/c\cella=09' status ; intro=0 ; fi
if [ $cella -eq 11 ] ; then sed -i '/cella=/c\cella=10' status ; intro=0 ; fi
if [ $cella -eq 12 ] ; then output=$(./utils.sh form 1 elooka gate1) ; fi
if [ $cella -eq 14 ] ; then sed -i '/cell=/c\cell=13' status ; break ; fi
if [ $cella -eq 15 ] ; then sed -i '/cella=/c\cella=14' status ; intro=0 ; fi
if [ $cella -eq 18 ] ; then sed -i '/cella=/c\cella=17' status ; intro=0 ; fi
if [ $cella -eq 19 ] ; then sed -i '/cella=/c\cella=18' status ; intro=0 ; fi
if [ $cella -eq 23 ] ; then sed -i '/cell=/c\cell=22' status ; break ; fi
if [ $cella -eq 26 ] ; then sed -i '/cell=/c\cell=25' status ; break ; fi
if [ $cella -eq 27 ] ; then sed -i '/cella=/c\cella=26' status ; intro=0 ; fi
if [ $cella -eq 28 ] ; then sed -i '/cella=/c\cella=27' status ; intro=0 ; fi
if [ $cella -eq 29 ] ; then sed -i '/cella=/c\cella=28' status ; intro=0 ; fi
if [ $cella -eq 33 ] ; then sed -i '/cell=/c\cell=32' status ; break ; fi
if [ $cella -eq 34 ] ; then sed -i '/cella=/c\cella=33' status ; intro=0 ; fi
if [ $cella -eq 35 ] ; then sed -i '/cella=/c\cella=34' status ; intro=0 ; fi
if [ $cella -eq 36 ] ; then sed -i '/cella=/c\cella=35' status ; intro=0 ; fi
if [ $cella -eq 37 ] ; then sed -i '/cella=/c\cella=36' status ; intro=0 ; fi

if [[ "$cella" =~ ^(01|24)$ ]] ; then output=$(./utils.sh form 1 elooka hedge3) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|12|14|15|18|19|23|24|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#failure
if ! [[ "$comm" =~ ^(east|north|south|west)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[l][o][o][k]*) comm=$(sed 's/look//' <<< $case1)
#east
if [[ "$comm" == east ]] ; then
if [ $cella -eq 01 ] ; then output=$(./utils.sh form 1 elookdir east $e02 1) ; fi
if [ $cella -eq 02 ] ; then output=$(./utils.sh form 1 elookdir east $e03 3) ; fi
if [ $cella -eq 03 ] ; then output=$(./utils.sh form 1 elookdir east $e04 1) ; fi
if [ $cella -eq 04 ] ; then output=$(./utils.sh form 1 elookdir east $e05 1) ; fi
if [ $cella -eq 05 ] ; then output=$(./utils.sh form 1 elookdir east $e04 1) ; fi
if [ $cella -eq 06 ] ; then output=$(./utils.sh form 1 elookdir east $e07 1) ; fi
if [ $cella -eq 07 ] ; then output=$(./utils.sh form 1 elookdir east 1 2) ; fi
if [ $cella -eq 09 ] ; then output=$(./utils.sh form 1 elookdir east $e10 3) ; fi
if [ $cella -eq 10 ] ; then output=$(./utils.sh form 1 elookdir east $e11 6) ; fi
if [ $cella -eq 11 ] ; then output=$(./utils.sh form 1 elookdir east 1 7) ; fi
if [ $cella -eq 12 ] ; then output=$(./utils.sh form 1 elookdir east 1 4) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form 1 elookdir east $e15 9) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form 1 elookdir east $e18 1) ; fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form 1 elookdir east $e19 1) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form 1 elookdir east $e22 3) ; fi
if [ $cella -eq 24 ] ; then output=$(./utils.sh form 1 elookdir east $e24 1) ; fi
if [ $cella -eq 26 ] ; then output=$(./utils.sh form 1 elookdir east $e27 1) ; fi
if [ $cella -eq 27 ] ; then output=$(./utils.sh form 1 elookdir east $e28 1) ; fi
if [ $cella -eq 28 ] ; then output=$(./utils.sh form 1 elookdir east $e29 1) ; fi
if [ $cella -eq 29 ] ; then output=$(./utils.sh form 1 elookdir east $e30 10) ; fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form 1 elookdir east $e34 1) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form 1 elookdir east $e35 1) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form 1 elookdir east $e36 1) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form 1 elookdir east $e37 1) ; fi
if [[ "$cella" =~ ^(15|19|23|37)$ ]] ; then  output=$(./utils.sh form 1 elookdir east 1 9) ;fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|10|11|12|14|15|17|18|19|23|24|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#north
if [[ "$comm" == north ]] ; then
if [ $cella -eq 01 ] ; then output=$(./utils.sh form 1 elookdir north $e08 3) ; fi
if [ $cella -eq 06 ] ; then output=$(./utils.sh form 1 elookdir north $e10 3) ; fi
if [ $cella -eq 07 ] ; then output=$(./utils.sh form 1 elookdir north $e11 6) ; fi
if [ $cella -eq 09 ] ; then output=$(./utils.sh form 1 elookdir north $e13 5) ; fi
if [ $cella -eq 10 ] ; then output=$(./utils.sh form 1 elookdir north $e14 1) ; fi
if [ $cella -eq 11 ] ; then output=$(./utils.sh form 1 elookdir north $e15 1) ; fi
if [ $cella -eq 12 ] ; then output=$(./utils.sh form 1 elookdir north e17 2) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form 1 elookdir north $e18 1) ; fi
if [ $cella -eq 15 ] ; then output=$(./utils.sh form 1 elookdir north $e19 1) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form 1 elookdir north $e21 1) ; fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form 1 elookdir north $e22 3) ; fi
if [ $cella -eq 19 ] ; then output=$(./utils.sh form 1 elookdir north $e23 3) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form 1 elookdir north $e28 3) ; fi
if [ $cella -eq 23 ] ; then output=$(./utils.sh form 1 elookdir north $e30 10) ; fi
if [ $cella -eq 24 ] ; then output=$(./utils.sh form 1 elookdir north $e31 2) ; fi
if [ $cella -eq 26 ] ; then output=$(./utils.sh form 1 elookdir north $e33 2) ; fi
if [ $cella -eq 27 ] ; then output=$(./utils.sh form 1 elookdir north $e34 1) ; fi
if [ $cella -eq 28 ] ; then output=$(./utils.sh form 1 elookdir north $e35 1) ; fi
if [ $cella -eq 29 ] ; then output=$(./utils.sh form 1 elookdir north $e36 1) ; fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form 1 elookdir north 1 2) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form 1 elookdir north 1 7) ; fi
if [[ "$cella" =~ ^(02|03|04|05)$ ]] ; then output=$(./utils.sh form 1 elookdir north 1 4) ; fi
if [[ "$cella" =~ ^(35|36|37)$ ]] ; then output=$(./utils.sh form 1 elookdir north 1 9) ; fi

if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|10|11|12|14|15|17|18|19|23|24|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#south
if [[ "$comm" == south ]] ; then
if [ $cella -eq 09 ] ; then output=$(./utils.sh form 1 elookdir south $e05 1) ; fi
if [ $cella -eq 10 ] ; then output=$(./utils.sh form 1 elookdir south $e06 1) ; fi
if [ $cella -eq 11 ] ; then output=$(./utils.sh form 1 elookdir south $e07 1) ; fi
if [ $cella -eq 12 ] ; then output=$(./utils.sh form 1 elookdir south $e08 4) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form 1 elookdir south $e10 3) ; fi
if [ $cella -eq 15 ] ; then output=$(./utils.sh form 1 elookdir south $e11 1) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form 1 elookdir south $e13 5) ; fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form 1 elookdir south $e14 1) ; fi
if [ $cella -eq 19 ] ; then output=$(./utils.sh form 1 elookdir south $e15 1) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form 1 elookdir east $e17 3) ; fi
if [ $cella -eq 23 ] ; then output=$(./utils.sh form 1 elookdir south $e19 1) ; fi
if [ $cella -eq 24 ] ; then output=$(./utils.sh form 1 elookdir south $e20 1) ; fi
if [ $cella -eq 26 ] ; then output=$(./utils.sh form 1 elookdir south 1 4) ; fi
if [ $cella -eq 27 ] ; then output=$(./utils.sh form 1 elookdir south 1 4) ; fi
if [ $cella -eq 28 ] ; then output=$(./utils.sh form 1 elookdir south $e21 1) ; fi
if [ $cella -eq 29 ] ; then output=$(./utils.sh form 1 elookdir south $e22 3) ; fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form 1 elookdir south $e26 3) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form 1 elookdir south $e27 4) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form 1 elookdir south $e28 3) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form 1 elookdir south $e29 1) ; fi
if [ $cella -eq 37 ] ; then output=$(./utils.sh form 1 elookdir south $e30 10) ; fi
if [[ "$cella" =~ ^(01|02|03|04|05|06|07)$ ]] ; then output=$(./utils.sh form 1 elookdir south 1 2) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|09|10|11|12|14|15|17|18|19|23|24|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi
#west
if [[ "$comm" == west ]] ; then
if [ $cella -eq 02 ] ; then output=$(./utils.sh form 1 elookdir west $e01 1) ; fi
if [ $cella -eq 03 ] ; then output=$(./utils.sh form 1 elookdir west $e02 1) ; fi
if [ $cella -eq 04 ] ; then output=$(./utils.sh form 1 elookdir west $e03 3) ; fi
if [ $cella -eq 05 ] ; then output=$(./utils.sh form 1 elookdir west $e04 1) ; fi
if [ $cella -eq 06 ] ; then output=$(./utils.sh form 1 elookdir west $e05 1) ; fi
if [ $cella -eq 07 ] ; then output=$(./utils.sh form 1 elookdir west $e06 1) ; fi
if [ $cella -eq 10 ] ; then output=$(./utils.sh form 1 elookdir west $e09 1) ; fi
if [ $cella -eq 11 ] ; then output=$(./utils.sh form 1 elookdir west $e10 1) ; fi
if [ $cella -eq 12 ] ; then output=$(./utils.sh form 1 elookdir west 1 8) ; fi
if [ $cella -eq 14 ] ; then output=$(./utils.sh form 1 elookdir west $e13 5) ; fi
if [ $cella -eq 15 ] ; then output=$(./utils.sh form 1 elookdir west $e14 1) ; fi
if [ $cella -eq 17 ] ; then output=$(./utils.sh form 1 elookdir west 1 4) ; fi
if [ $cella -eq 18 ] ; then output=$(./utils.sh form 1 elookdir west $e17 3) ; fi
if [ $cella -eq 19 ] ; then output=$(./utils.sh form 1 elookdir west $e18 1) ; fi
if [ $cella -eq 21 ] ; then output=$(./utils.sh form 1 elookdir east 1 4) ; fi
if [ $cella -eq 23 ] ; then output=$(./utils.sh form 1 elookdir east $e22 3) ; fi
if [ $cella -eq 26 ] ; then output=$(./utils.sh form 1 elookdir west $e25 1) ; fi
if [ $cella -eq 27 ] ; then output=$(./utils.sh form 1 elookdir west $e26 3) ; fi
if [ $cella -eq 28 ] ; then output=$(./utils.sh form 1 elookdir west $e27 1) ; fi
if [ $cella -eq 29 ] ; then output=$(./utils.sh form 1 elookdir west $e28 3) ; fi
if [ $cella -eq 33 ] ; then output=$(./utils.sh form 1 elookdir west $e32 11) ; fi
if [ $cella -eq 34 ] ; then output=$(./utils.sh form 1 elookdir west $e33 1) ; fi
if [ $cella -eq 35 ] ; then output=$(./utils.sh form 1 elookdir west $e34 1) ; fi
if [ $cella -eq 36 ] ; then output=$(./utils.sh form 1 elookdir west $e35 1) ; fi
if [ $cella -eq 37 ] ; then output=$(./utils.sh form 1 elookdir west $e36 1) ; fi
if [[ "$cella" =~ ^(01|24)$ ]] ; then output=$(./utils.sh form 1 elookdir west 1 2) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|12|14|15|17|18|19|23|26|27|28|29|33|34|35|36|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == bush ]] ; then
if [[ "$cella" =~ ^(02|14|36)$ ]] ; then output=$(./utils.sh form 1 elooka bush) ; fi
if [ "$cella" -eq 19 ] ; then output=$(./utils.sh form 1 looki null bush1 0 book14 $book18) ; fi
if ! [[ "$cella" =~ ^(02|14|36|19)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == chimney ]] ; then
if [[ "$cella" =~ ^(17)$ ]] ; then output=$(./utils.sh form 1 elooka chimney1) ; fi
if ! [[ "$cella" =~ ^(17)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == driveway ]] ; then
if [[ "$cella" =~ ^(21)$ ]] ; then output=$(./utils.sh form 1 uni far) ; fi
if [[ "$cella" =~ ^(12|24|26|27|28)$ ]] ; then output=$(./utils.sh form 1 elooka drive) ; fi
if ! [[ "$cella" =~ ^(12|21|24|26|27|28)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == eyes ]] ; then
if [[ "$cella" =~ ^(19|23|35)$ ]] ; then if [ $wolf -eq 2 ] ;then output=$(./utils.sh form 1 elooka eyes1)
else output=$(./utils.sh form 1 uni look) ; fi ; fi
if ! [[ "$cella" =~ ^(19|23|35)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == forest ]] ; then
if [ $cella -eq 28 ] ; then output=$(./utils.sh form 1 elooka forest1) ; fi
if [[ "$cella" =~ ^(11|14|15|18|34|36|37)$ ]] ; then output=$(./utils.sh form 1 elooka forest) ; fi
if [[ $cella =~ ^(19|23|35)$ ]] ; then output=$(./utils.sh form 1 looki null forest4 0 wolf1 $wolf) ; fi
if ! [[ "$cella" =~ ^(11|14|15|18|19|23|28|34|35|36|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == hedge ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|24|26|33|34)$ ]] ; then output=$(./utils.sh form 1 elooka hedge) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|24|26|33|34)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == rock ]] ; then
if [[ "$cella" =~ ^(11|15|18|35)$ ]] ; then output=$(./utils.sh form 1 elooka rock) ; fi
if ! [[ "$cella" =~ ^(11|15|18|35)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == shed ]] ; then
if [ $cella -eq 24 ] ; then output=$(./utils.sh form 1 elooka shed north) ; fi
if [ $cella -eq 29 ] ; then output=$(./utils.sh form 1 elooka shed east) ; fi
if [ $cella -eq 37 ] ; then output=$(./utils.sh form 1 elooka shed south) ; fi
if ! [[ "$cella" =~ ^(24|29|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == tree ]] ; then
if [[ "$cella" =~ ^(01|04|06|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if [[ "$cella" =~ ^(03|17|26|28)$ ]] ; then output=$(./utils.sh form 1 elooka tree) ; fi
if [ $cella -eq 24 ] ; then output=$(./utils.sh form 1 looki null tree2 0 book14 $book22) ; fi
if ! [[ "$cella" =~ ^(01|03|04|06|12|17|21|24|26|27|28|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == window ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == house ]] ; then
if [ $cella -eq 21 ] ; then output=$(./utils.sh form 1 elooka house west) ; fi
if [ $cella -eq 27 ] ; then output=$(./utils.sh form 1 elooka house) ; fi
if [ $cella -eq 37 ] ; then ./utils.sh cutscene 1 "elooka house southwest" "Look House" back ; fi
if [[ "$cella" =~ ^(06|07|10|11|14|15|18|19|23|29)$ ]] ; then ./utils.sh cutscene 1 "elooka house west" "Look House" back ; fi
if [[ "$cella" =~ ^(26|34|35|36)$ ]] ; then ./utils.sh cutscene 1 "elooka house south" "Look House" side ; fi
if [[ "$cella" =~ ^(06|07|10|11|14|15|18|19|23|26|29|34|35|36|37)$ ]] ; then intro=0 ; fi
if ! [[ "$cella" =~ ^(06|07|10|11|14|15|18|19|21|23|26|27|29|34|35|36|37)$ ]] ; then comm=null ; fi
fi

#failure
if ! [[ "$comm" =~ ^(east|north|south|west|bush|chimney|driveway|eyes|forest|hedge|house|rock|shed|tree|window)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

#olfactory

[l][i][c][k]*) comm=$(sed 's/lick//' <<< $case1)

if [[ "$comm" == bush ]] ; then
if [[ "$cella" =~ ^(02|14|19|36)$ ]] ; then output=$(./utils.sh form 1 lick hedge) ; fi
if ! [[ "$cella" =~ ^(02|14|19|36)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == chimney ]] ; then
if [[ "$cella" =~ ^(17)$ ]] ; then output=$(./utils.sh form 1 lick drive) ; fi
if ! [[ "$cella" =~ ^(17)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == driveway ]] ; then
if [[ "$cella" =~ ^(12|21|24|26|27|28)$ ]] ; then output=$(./utils.sh form 1 lick drive) ; fi
if ! [[ "$cella" =~ ^(12|21|24|26|27|28)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == forest ]] ; then
if [[ "$cella" =~ ^(28)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if [[ "$cella" =~ ^(11|14|15|18|19|23|34|35|36|37)$ ]] ; then output=$(./utils.sh form 1 lick forest) ; fi
if ! [[ "$cella" =~ ^(11|14|15|18|19|23|34|35|36|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == hedge ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|12|24|26|33|34)$ ]] ; then output=$(./utils.sh form 1 lick hedge) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|12|24|26|33|34)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == house ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|05|09|12|17|21|24|26|27|28)$ ]] ; then output=$(./utils.sh form 1 lick house) ; fi
if [[ "$cella" =~ ^(33)$ ]] ; then output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|09|12|17|21|24|26|27|28|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == rock ]] ; then
if [[ "$cella" =~ ^(11|15|18|35)$ ]] ; then output=$(./utils.sh form 1 lick rock) ; fi
if ! [[ "$cella" =~ ^(11|15|18|35)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == shed ]] ; then
if [[ "$cella" =~ ^(23|29|37)$ ]] ; then output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(23|29|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == tree ]] ; then
if [[ "$cella" =~ ^(01|04|06|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if [[ "$cella" =~ ^(03|10|17|24|26|28)$ ]] ; then output=$(./utils.sh form 1 lick tree) ; fi
if ! [[ "$cella" =~ ^(01|03|04|06|10|12|17|24|26|27|28|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == window ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then comm=null ; fi
fi
#failure
if ! [[ "$comm" =~ ^(bush|driveway|forest|hedge|house|rock|shed|tree|window)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[o][p][e][n][w][i][n][d][o][w]) if [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$comm" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

[s][m][e][l][l]*) comm=$(sed 's/smell//' <<< $case1)

if [[ "$comm" == bush ]] ; then
if [[ "$cella" =~ ^(02|14|19|36)$ ]] ; then output=$(./utils.sh form 1 smell bushe) ; fi
if ! [[ "$cella" =~ ^(02|14|19|36)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == chimney ]] ; then
if [[ "$cella" =~ ^(17)$ ]] ; then output=$(./utils.sh form 1 smell drive) ; fi
if ! [[ "$cella" =~ ^(17)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == driveway ]] ; then
if [[ "$cella" =~ ^(12|21|24|26|27|28)$ ]] ; then output=$(./utils.sh form 1 smell drive) ; fi
if ! [[ "$cella" =~ ^(12|21|24|26|27|28)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == forest ]] ; then
if [[ "$cella" =~ ^(28)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if [[ "$cella" =~ ^(11|14|15|18|34|36|37)$ ]] ; then output=$(./utils.sh form 1 smell foreste) ; fi
if [[ $cella =~ ^(19|23|35)$ ]] ; then output=$(./utils.sh form 1 smell foreste wolf $wolf) ; fi
if ! [[ "$cella" =~ ^(11|14|15|18|19|23|34|35|36|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == hedge ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|12|24|26|33|34)$ ]] ; then output=$(./utils.sh form 1 smell hedgee) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|06|07|10|11|12|24|26|33|34)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == house ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|05|09|12|17|21|24|26|27|28)$ ]] ; then output=$(./utils.sh form 1 smell housee) ; fi
if [[ "$cella" =~ ^(33)$ ]] ; then output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|05|09|12|17|21|24|26|27|28|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == rock ]] ; then
if [[ "$cella" =~ ^(11|15|18|35)$ ]] ; then output=$(./utils.sh form 1 smell rocke)  ; fi
if ! [[ "$cella" =~ ^(11|15|18|35)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == shed ]] ; then
if [[ "$cella" =~ ^(23|29|37)$ ]] ; then output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(23|29|37)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == tree ]] ; then
if [[ "$cella" =~ ^(01|06|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if [[ "$cella" =~ ^(03|04|10|17|24|26|28)$ ]] ; then output=$(./utils.sh form 1 smell treee) ; fi
if ! [[ "$cella" =~ ^(01|03|04|06|10|12|17|21|24|26|27|28|33)$ ]] ; then comm=null ; fi
fi

if [[ "$comm" == window ]] ; then
if [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then  output=$(./utils.sh form 1 uni far) ; fi
if ! [[ "$cella" =~ ^(01|02|03|04|09|12|21|27|33)$ ]] ; then comm=null ; fi
fi
#failure
if ! [[ "$comm" =~ ^(bush|driveway|forest|hedge|house|rock|shed|tree|window)$ ]] && [[ ! -z "$comm" ]]
then
case1=(system${case1})
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 10 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][k][e][y]) 
get=$(./utils.sh get key7 key $key7)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k][k][e][y]) if [ $key7 -ne 2 ]
then
sidebar
./lib.sh keya key9
fi
if [ $key7 -eq 0 ] ; then output=$(./utils.sh form 1 lookkey e10) ; fi
if [ $key7 -eq 1 ] ; then output=$(./utils.sh form 1 uni get3 key) ; fi 
if [ $key7 -eq 2 ] ; then output=$(./utils.sh form 1 uni look) ; fi ;;

[l][o][o][k][t][r][e][e]) if [ $key7 -eq 0 ]
then output=$(./utils.sh form 1 lookkey e10)
else
output=$(./utils.sh form 1 elooka tree)
fi ;;

#olfactory

[l][i][c][k][k][e][y]) if [ $key7 -ne 2 ]
then
output=$(./utils.sh form 1 uni lickkey)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l][k][e][y]) if [ $key7 -ne 2 ]
then
output=$(./utils.sh form 1 smell key)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 12 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][k][e][y])
get=$(./utils.sh get key5 key $key5)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;


[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 elooka door1) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh form 1 elooka gate) ;;

[l][o][o][k][k][e][y]) sidebar ; ./lib.sh keya key7 
if [ $key5 -eq 0 ] ; then output=$(./utils.sh form 1 lookkey e12) ; fi
if [ $key5 -eq 1 ] ; then output=$(./utils.sh form 1 uni get3 key) ; fi ;;

[l][o][o][k][m][a][i][l][b][o][x]) if [ $key5 -eq 0 ] 
then
output=$(./utils.sh form 1 elooka mail1)
else
output=$(./utils.sh form 1 elooka mail2)
fi ;;

#olfactory

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form 1 lick door2) ;;

[l][i][c][k][k][e][y]) if [ $key5 -ne 2 ]
then
output=$(./utils.sh form 1 uni lickkey)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][m][a][i][l][b][o][x]) output=$(./utils.sh form 1 lick mail) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh form 1 smell door2) ;;

[s][m][e][l][l][k][e][y]) if [ $key5 -ne 2 ]
then
output=$(./utils.sh form 1 uni smellkey)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][m][a][i][l][b][o][x])output=$(./utils.sh form 1 smell mail) ;;

*) case1=(system${case1}) ;;

esac
fi


if [ $cella -eq 19 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][b][o][o][k])
get=$(./utils.sh get book18 book $book18)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k][b][o][o][k]) sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book) ;;

[r][e][a][d][b][o][o][k]) ./utils.sh reader book18r
intro=0 ;;

#olfactory

[l][i][c][k][b][o][o][k]) output=$(./utils.sh form 1 lick book) ;;

[s][m][e][l][l][b][o][o][k]) output=$(./utils.sh form 1 smell book) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $cella -eq 24 ] && [[ $case1 == *"system"* ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[g][e][t][b][o][o][k])
get=$(./utils.sh get book22 book $book22)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k][b][o][o][k]) if [ $book22 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book22 -ne 2 ]
then
./utils.sh reader book22r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book22 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book22 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

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

