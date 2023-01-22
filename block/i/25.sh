#!/bin/bash
#version=1.08.01

background() {
image=$(block/$block/./graphics.sh room2
./utils.sh overlay table2 25 14 0 0
./utils.sh overlay chair2 33 15 0 0
sidebar)
echo "$image"
if [ $i25wound -eq 1 ] ; then ./utils.sh overlay "scuff" 22 12 0 0; fi
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 3" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book35=$(grep 'book35=' status | cut -d "=" -f2)
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
i40=$(grep 'i40=' status | cut -d "=" -f2)
i25wound=$(grep 'i25wound=' status | cut -d "=" -f2)
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
get=$(./utils.sh get book35 book $book35)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][e][t][c][o][g]) if [ $cog -eq 2 ] && [ $i25wound -ne 1 ]
then
sed -i '/cog=/c\cog=1' status
output=$(./utils.sh form 1 uni get2 cog)
else
if [ $i25wound -eq 0 ]
then
output=$(./utils.sh form 1 uni get3 cog)
else
output=$(./utils.sh form 1 looki null clock1 0)
fi 
fi;;

[g][e][t][g][e][a][r]) if [ $gear -eq 2 ] && [ $i25wound -ne 1 ]
then
sed -i '/gear=/c\gear=1' status
output=$(./utils.sh form 1 uni get2 gear)
else
if [ $i25wound -eq 0 ]
then
output=$(./utils.sh form 1 uni get3 gear)
else
output=$(./utils.sh form 1 looki null clock1 0)
fi 
fi;;

[g][e][t][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l]) if [ $mainspringbarrel -eq 2 ] && [ $i25wound -ne 1 ]
then
sed -i '/mainspringbarrel=/c\mainspringbarrel=1' status
output=$(./utils.sh form 1 uni get2 mainspringbarrel)
else
if [ $i25wound -eq 0 ]
then
output=$(./utils.sh form 1 uni get3 mainspringbarrel)
else
output=$(./utils.sh form 1 looki null clock1 0)
fi 
fi;;

[g][e][t][s][p][r][o][c][k][e][t]) if [ $sprocket -eq 2 ] && [ $i25wound -ne 1 ]
then
sed -i '/sprocket=/c\sprocket=1' status
output=$(./utils.sh form 1 uni get2 sprocket)
else
if [ $i25wound -eq 0 ]
then
output=$(./utils.sh form 1 uni get3 sprocket)
else
output=$(./utils.sh form 1 looki null clock1 0)
fi 
fi ;;

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=ulc1' status
sed -i '/cella=/c\cella=40' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i25) ;;

[l][o][o][k][b][o][o][k]) if [ $book35 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][c][h][a][i][r]) output=$(./utils.sh form 1 looki null chair6 0) ;;

[l][o][o][k][c][l][o][c][k]) if [ $i25wound -eq 2 ]
then
output=$(./utils.sh form 1 looki null clock2 0 clock3 0)
fi
if [ $i25wound -eq 0 ]
then
output=$(./utils.sh form 1 looki null clock2 0 clock4 0)
fi
if [ $i25wound -eq 1 ]
then
output=$(./utils.sh form 1 looki null clock2 0 clock5 0)
fi ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh form 1 lookdoor door1 door15 $i40 1) ;;

[l][o][o][k][n][o][r][t][h][b][o][o][k][c][a][s][e])
output=$(./utils.sh form 1 looki null bookcase3 0) ;;

[l][o][o][k][s][o][u][t][h][b][o][o][k][c][a][s][e]) 
output=$(./utils.sh form 1 looki null bookcase3 0) ;;

[l][o][o][k][w][e][s][t][b][o][o][k][c][a][s][e]) 
output=$(./utils.sh form 1 looki null bookcase3 0) ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) 
output=$(./utils.sh form 1 looki null fireplace1 0 fireplace6 $i25wound book10 $book35) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor7 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table5 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[p][l][a][c][e][c][o][g][c][l][o][c][k]) if [ $cog -eq 1 ]
then
output=$(./utils.sh form 1 looki null clock6 0)
sed -i '/cog=/c\cog=2' status
vars
if [ $cog -eq 2 ] && [ $gear -eq 2 ] && [ $mainspringbarrel -eq 2 ] && [ $sprocket -eq 2 ]
then
output=$(./utils.sh form 1 looki null clock7 0)
sed -i '/i25wound=/c\i25wound=0' status
fi
else
output=$(./utils.sh form 1 uni place2)
fi ;;

[p][l][a][c][e][g][e][a][r][c][l][o][c][k])if [ $gear -eq 1 ]
then
output=$(./utils.sh form 1 looki null clock6 0)
sed -i '/gear=/c\gear=2' status
vars
if [ $cog -eq 2 ] && [ $gear -eq 2 ] && [ $mainspringbarrel -eq 2 ] && [ $sprocket -eq 2 ]
then
output=$(./utils.sh form 1 looki null clock7 0)
sed -i '/i25wound=/c\i25wound=0' status
fi 
else
output=$(./utils.sh form 1 uni place2)
fi ;;

[p][l][a][c][e][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l][c][l][o][c][k])if [ $mainspringbarrel -eq 1 ]
then
if [ $cog -eq 2 ] || [ $gear -eq 2 ] || [ $sprocket -eq 2 ]
then
output=$(./utils.sh form 1 looki null clock8 0)
else
output=$(./utils.sh form 1 looki null clock6 0)
sed -i '/mainspringbarrel=/c\mainspringbarrel=2' status
fi 
else
output=$(./utils.sh form 1 uni place2)
fi ;;

[p][l][a][c][e][s][p][r][o][c][k][e][t][c][l][o][c][k]) if [ $sprocket -eq 1 ]
then
if [ $cog -eq 2 ] || [ $gear -eq 2 ] 
then
output=$(./utils.sh form 1 looki null clock8 0)
else
output=$(./utils.sh form 1 looki null clock6 0)
sed -i '/sprocket=/c\sprocket=2' status
fi 
else
output=$(./utils.sh form 1 uni place2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book35 -ne 2 ]
then
./utils.sh reader book35r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[w][i][n][d][c][l][o][c][k]) if [ $clockkey -eq 1 ]
then
if [ $i25wound -eq 2 ]
then
output=$(./utils.sh form 1 looki null clock9 0)
fi
if [ $i25wound -eq 1 ]
then
output=$(./utils.sh form 1 looki null clock10 0)
fi 
if [ $i25wound -eq 0 ]
then
./utils.sh score 12
sidebar
sed -i '/i25wound=/c\i25wound=1' status
sed -i '/book35=/c\book35=0' status
intro=1
output=$(./utils.sh form 1 looki null clock11 0)
fi 
else
output=$(./utils.sh form 1 uni wind)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book35 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][c][h][a][i][r]) output=$(./utils.sh form 1 lick chair2) ;;

[l][i][c][k][c][l][o][c][k]) output=$(./utils.sh form 1 lick clock1) ;;

[l][i][c][k][n][o][r][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][s][o][u][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][w][e][s][t][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 lick door) ;;

[l][i][c][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 lick fireplace1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floori) ;;

[l][i][c][k][t][a][b][l][e]) output=$(./utils.sh form 1 lick forest) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i04) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book35 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][c][h][a][i][r]) output=$(./utils.sh form 1 smell chair2) ;;

[s][m][e][l][l][c][l][o][c][k]) output=$(./utils.sh form 1 smell clock1) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form 1 smell door) ;;

[s][m][e][l][l][n][o][r][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][s][o][u][t][h][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

[s][m][e][l][l][w][e][s][t][b][o][o][k][c][a][s][e]) output=$(./utils.sh form 1 smell foreste) ;;

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

