#!/bin/bash
#version=1.08.01

background() {
image=$(block/$block/./graphics.sh room2
./utils.sh overlay table2 17 14 0 0
./utils.sh overlay chair3 26 14 0 0
sidebar)
echo "$image"
if [ $book27 -eq 0 ] ; then ./utils.sh overlay scuff 29 7 0 0 ; fi
}


sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 1" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book27=$(grep 'book27=' status | cut -d "=" -f2)
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
i36=$(grep 'i36=' status | cut -d "=" -f2)
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

case $case1 in

#room commands

[g][e][t][b][o][o][k])
get=$(./utils.sh get book27 book $book27)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=36' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i27) ;;

[l][o][o][k][b][o][o][k]) if [ $book27 -ne 2 ] 
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][c][h][a][i][r]) output=$(./utils.sh form 1 looki null chair6 0) ;;

[l][o][o][k][c][l][o][c][k]) if [ $book27 -eq 0 ] 
then
output=$(./utils.sh form 1 looki null clock2 0 book11 0)
else
output=$(./utils.sh form 1 looki null clock2 0 clock12 0)
fi ;;

[l][o][o][k][w][e][s][t][d][o][o][r])
output=$(./utils.sh form 1 lookdoor door1 door15 $i36 1) ;;

[l][o][o][k][e][a][s][t][b][o][o][k][c][a][s][e]) 
output=$(./utils.sh form 1 looki null bookcase3 0) ;;

[l][o][o][k][n][o][r][t][h][b][o][o][k][c][a][s][e]) 
output=$(./utils.sh form 1 looki null bookcase3 0) ;;

[l][o][o][k][s][o][u][t][h][b][o][o][k][c][a][s][e])
output=$(./utils.sh form 1 looki null bookcase3 0) ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) 
output=$(./utils.sh form 1 looki null fireplace2 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor7 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table5 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

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

[p][l][a][c][e][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l][c][l][o][c][k]) if [ $mainspringbarrel -eq 0 ] 
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

[r][e][a][d][b][o][o][k]) if [ $book27 -ne 2 ]
then
./utils.sh reader book27r
intro=1
else
output=$(./utils.sh form 1 uni read)
fi ;;

[w][i][n][d][c][l][o][c][k]) if [ $clockkey -eq 1 ]
then
output=$(./utils.sh form 1 looki null clock14 0)
else
output=$(./utils.sh form 1 looki null clock15 0)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book27 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][c][h][a][i][r]) output=$(./utils.sh form 1 lick chair2) ;;

[l][i][c][k][c][l][o][c][k]) output=$(./utils.sh form 1 lick clock1) ;;

[l][i][c][k][e][a][s][t][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][n][o][r][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][s][o][u][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 lick fireplace1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][t][a][b][l][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i04) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book27 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][c][h][a][i][r]) output=$(./utils.sh form 1 smell chair2) ;;

[s][m][e][l][l][c][l][o][c][k]) output=$(./utils.sh form 1 smell clock1) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][e][a][s][t][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][n][o][r][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][s][o][u][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 smell fireplace1) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floori) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall) ;;

*) case1=(system${case1}) ;;
esac

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

