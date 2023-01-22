#!/bin/bash
#version=1.08.02

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 4
comp=0
tint=0
pic=pic1a
aux1=$(if [ $i11window -eq 1 ] ; then ./utils.sh overlay win2 3 8 0 0; fi
if [ $i11cupboard -eq 1 ] ; then ./utils.sh overlay door2 8 10 0 0; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
comp=3
tint=4
pic=pic2a
aux1=$(if [ $i11window -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 0; fi)
fi

if [ $focus -eq 2 ]
then
pic=pic3a
comp=0
tint=4
aux2=$(if [ $book15 -eq 0 ] ; then ./utils.sh overlay book3 45 15 0 0; fi
if [ $gear -eq 0 ] ; then ./utils.sh overlay gear1 20 18 0 2; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar
echo "$aux1")
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 $tint
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 $tint
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gear=$(grep 'gear=' status | cut -d "=" -f2)
book15=$(grep 'book15=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i04=$(grep 'i04=' status | cut -d "=" -f2)
i12=$(grep 'i12=' status | cut -d "=" -f2)
i33=$(grep 'i33=' status | cut -d "=" -f2)
i11cupboard=$(grep 'i11cupboard=' status | cut -d "=" -f2)
i11window=$(grep 'i11window=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=12' status ; break ;;

[g][o][n][o][r][t][h]) sed -i '/cella=/c\cella=33' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=04' status ; break ;;

[g][o][w][e][s][t]) if [ $i11window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=20' status
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i11 window1 $i11window) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form 1 lookdoor door1 door13 $i12 1) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form 1 looki null stairs1 0) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form 1 lookdoor door1 door6 $i04 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book15 -eq 1 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][c][u][p][b][o][a][r][d]) if [ $i11cupboard -eq 0 ]
then
output=$(./utils.sh form 1 looki null cupboard1 0)
else
sed -i '/focus=/c\focus=2' status
intro=1
if [ $book15 -ne 0 ] && [ $gear -ne 0 ]
then
output=$(./utils.sh form 1 looki null cupboard4 0)
else
output=$(./utils.sh form 1 looki null cupboard2 $book15 cupboard3 $gear)
fi
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][s][t][a][i][r][s]) output=$(./utils.sh form 1 looki null stairs1 0 cupboard5 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w])sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 looki null window16 0 window7 $i11window) ;;

[o][p][e][n][c][u][p][b][o][a][r][d]) if [ $i11cupboard -eq 1 ]
then
output=$(./utils.sh form 1 looki null cupboard7 0)
fi
if [ $i11cupboard -eq 0 ]
then
sed -i "/i11cupboard=/c\i11cupboard=1" status
intro=1
output=$(./utils.sh form 1 looki null cupboard6 0)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book15 -eq 1 ]
then
./utils.sh reader book112r
intro=0
output=$(./utils.sh form 1)
else
output=$(./utils.sh form 1 uni read)
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i11window $hammer $i11window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book15 -eq 1 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][n][o][r][t][h][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door4) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][g][e][a][r]) if [ $gear -eq 1 ]
then
output=$(./utils.sh form 1 lick peg)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][s][t][a][i][r][s]) output=$(./utils.sh form 1 lick stairs1) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i01 null $i11window) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book15 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][g][e][a][r]) if [ $gear -eq 1 ]
then
output=$(./utils.sh form 1 smell key)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][c][u][p][b][o][a][r][d]) output=$(./utils.sh form 1 smell cupboard1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][s][t][a][i][r][s]) output=$(./utils.sh form 1 smell stairs1) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall1) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i11window -eq 1 ]
then 
sed -i '/block=/c\block=e' status
sed -i '/cell=/c\cell=20' status
break
else
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null window16 0 window7 $i11window) ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh form 1 looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor2 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form 1 looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form 1 looki null rain4 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form 1 looki null tree3 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i11window $hammer $i11window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[s][m][e][l][l]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book15 book $book15)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][e][t][g][e][a][r])
get=$(./utils.sh get gear gear $gear)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[l][o][o][k]) if [ $book15 -ne 0 ] && [ $gear -ne 0 ]
then
output=$(./utils.sh form 1 looki null cupboard4 0)
else
output=$(./utils.sh form 1 looki null cupboard2 $book15)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book15 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][c][u][p][b][o][a][r][d]) if [ $book15 -ne 0 ] && [ $gear -ne 0 ]
then
output=$(./utils.sh form 1 looki null cupboard4 0)
else
output=$(./utils.sh form 1 looki null cupboard2 $book15 cupboard3 $gear)
fi ;;

[l][o][o][k][g][e][a][r]) if [ $gear -ne 2 ]
then
sidebar
./lib.sh cogg
output=$(./utils.sh form 1 looki null gear1 0)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor9 0 cupboard3 $gear) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book15 -ne 2 ]
then
./utils.sh reader book112r
intro=0
output=$(./utils.sh form 1)
else
output=$(./utils.sh form 1 uni read)
fi ;;

#olfactory

[l][i][c][k][g][e][a][r]) if [ $gear -ne 2 ]
then
output=$(./utils.sh form 1 lick peg)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][g][e][a][r]) if [ $gear -ne 2 ]
then
output=$(./utils.sh form 1 lick peg)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell cupboard1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book15 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][g][e][a][r]) if [ $gear -ne 2 ]
then
output=$(./utils.sh form 1 smell key)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][c][u][p][b][o][a][r][d]) output=$(./utils.sh form 1 smell cupboard1) ;;

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

