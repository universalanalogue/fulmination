#!/bin/bash
#version=1.08.02

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ] ; then ./utils.sh colorset 6 ; comp=1 ; pic=pic1a ; fi
if [ $focus -eq 1 ] ; then ./utils.sh colorset 4 ; comp=3 ; pic=pic2a ; fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar)
echo "$image"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book38=$(grep 'book38=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
}
helpcount=0
intro=0
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
./utils.sh prompt "$last" "$bar" "$output" 6
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][b][o][o][k]) 
get=$(./utils.sh get book38 book $book38)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][s][o][u][t][h]) output=$(./utils.sh form 1 looki null door25 0) ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=10a' status
./utils.sh cutscene i "ghost1 returnwest" Intermission "graphpass i 10pic3a 6 6 3"
break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i10) ;;

[l][o][o][k][b][o][d][y]) output=$(./utils.sh form 1 looki null body2 0) ;;

[l][o][o][k][b][o][o][k]) if [ $book38 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor4 0) ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 looki null fireplace5 0) ;;

[l][o][o][k][h][o][b]) output=$(./utils.sh form 1 looki null hob1 0) ;;

[l][o][o][k][h][a][t][c][h]) if [ $book38 -eq 0 ]
then
output=$(./utils.sh form 1 looki null hatch1 0)
else
output=$(./utils.sh form 1 looki null hatch2 0)
fi ;; 

[l][o][o][k][i][c][e][c][h][e][s][t]) output=$(./utils.sh form 1 looki null chest1 0) ;;

[l][o][o][k][s][o][u][t][h][d][o][o][r]) output=$(./utils.sh form 1 looki null door25 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall4 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 looki null window13 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 looki null window14 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book38 -ne 2 ]
then
./utils.sh reader book38r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[s][m][a][s][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni smashwin1) ;;

#olfactory

[l][i][c][k][b][o][d][y]) output=$(./utils.sh form 1 lick body1) ;;

[l][i][c][k][b][o][o][k]) if [ $book38 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 lick fireplace2) ;;

[l][i][c][k][h][o][b]) output=$(./utils.sh form 1 lick hob) ;;

[l][i][c][k][h][a][t][c][h]) output=$(./utils.sh form 1 lick hatch1) ;;

[l][i][c][k][i][c][e][c][h][e][s][t]) output=$(./utils.sh form 1 lick chest) ;;

[l][i][c][k][s][o][u][t][d][o][o][r]) output=$(./utils.sh form 1 lick door7) ;;

[l][i][c][k][f][l][o][o][r]) .output=$(./utils.sh form 1 lick floor2) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall1) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window2) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i10) ;;

[s][m][e][l][l][b][o][d][y]) output=$(./utils.sh form 2 smellbody1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book38 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][f][i][r][e][p][l][a][c][e]) output=$(./utils.sh form 1 smell fireplace2) ;;

[s][m][e][l][l][h][o][b]) output=$(./utils.sh form 1 smell hob1) ;;

[s][m][e][l][l][h][a][t][c][h])  output=$(./utils.sh form 1 smell hatch1) ;;

[s][m][e][l][l][i][c][e][c][h][e][s][t])  output=$(./utils.sh form 1 smell chest1) ;;

[s][m][e][l][l][s][o][u][t][d][o][o][r])  output=$(./utils.sh form 1 smell door8) ;;

[s][m][e][l][l][f][l][o][o][r])  output=$(./utils.sh form 1 smell floor3) ;;

[s][m][e][l][l][w][a][l][l])  output=$(./utils.sh form 1 smell wall3) ;;

[s][m][e][l][l][w][i][n][d][o][w])  output=$(./utils.sh form 1 smell window2) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then
case $case1 in

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=10a' status
./utils.sh cutscene i "ghost1 returnwest" Intermission "graphpass i 10pic3a 5 5 0"
break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null window13 0) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 looki null door1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form 1 looki window14 0) ;;

[s][m][a][s][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni smashwin1) ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window2) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i10) ;;

[s][m][e][l][l][w][i][n][d][o][w])  output=$(./utils.sh form 1 smell window2) ;;

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

