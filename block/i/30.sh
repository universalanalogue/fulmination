#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
echo "$image"
if [ $i30awindow -eq 1 ] ; then ./utils.sh overlay win5 25 4 0 ; fi
if [ $i30bwindow -eq 1 ] ; then ./utils.sh overlay win6 5 6 0 ; fi
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
if [ $i30awindow -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 ; fi
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 1
image=$(block/$block/./graphics.sh ${cell}pic3a)
echo "$image"
if [ $i30bwindow -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 ; fi
fi

}

function vars() {

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
i40=$(grep 'i40=' status | cut -d "=" -f2)
i30awindow=$(grep 'i30awindow=' status | cut -d "=" -f2)
i30bwindow=$(grep 'i30bwindow=' status | cut -d "=" -f2)
sleepnum=$(grep "sleepnum=" status | cut -d "=" -f2)
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
if [ $intro -eq 0 ] ; then output=$(./utils.sh blockform) ; fi
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

[g][o][w][e][s][t]) if [ $i40awindow -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[g][o][s][o][u][t][h]) if [ $i40bwindow -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=42' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i30 curtain1 0 window1 $i30awindow) ;;

[l][o][o][k][s][o][u][t][[h][c][u][r][t][a][i][n][s])
output=$(./utils.sh blockform looki null curtains2 0) ;;

[l][o][o][k][w][e][s][t][c][u][r][t][a][i][n][s])
output=$(./utils.sh blockform looki null curtains2 0) ;;

[l][o][o][k][e][a][s][t][d][o][o][r])
output=$(./utils.sh blockform lookdoor door1 door15 $i42 1) ;;

[l][o][o][k][a][r][m][o][i][r][e]) output=$(./utils.sh blockform looki null armoire1 0) ;;

[l][o][o][k][b][e][d]) output=$(./utils.sh blockform looki null bed1 0) ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh blockform looki null bookcase1 0) ;;

[l][o][o][k][d][r][a][w][e][r][s]) output=$(./utils.sh blockform looki null drawer2 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor7 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh blockform looki null window21 0 window7 $i30bwindow) ;;

[l][o][o][k][w][e][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=2' status
intro=1
output=$(./utils.sh blockform looki null window22 0 window7 $i30awindow) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[o][p][e][n][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i30bwindow -eq 0 ]
then
sed -i '/i30bwindow=/c\i30bwindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

[s][m][a][s][h][w][e][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i30awindow -eq 0 ]
then
sed -i '/i30awindow=/c\i30awindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#bedtime


#olfactory

[l][i][c][k][a][r][m][o][i][r]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][b][e][d]) output=$(./utils.sh blockform lick bed1) ;;

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][c][u][r][t][a][i][n][s]) output=$(./utils.sh blockform lick curtain1) ;;

[l][i][c][k][d][r][a][w][e][r][s]) output=$(./utils.sh blockform lick forest) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor5) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall) ;;

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) if [ $i30awindow -eq 1 ] || [ $i30bwindow -eq 1 ]
then
output=$(./utils.sh blockform smell e)
else
output=$(./utils.sh blockform smell i23)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][a][r][m][o][i][r]) output=$(./utils.sh blockform smell foreste) ;;

[s][m][e][l][l][b][e][d]) output=$(./utils.sh blockform smell bed1) ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh blockform smell foreste) ;;

[s][m][e][l][l][c][u][r][t][a][i][n][s]) output=$(./utils.sh blockform smell curtain1) ;;

[s][m][e][l][l][d][r][a][w][e][r][s]) output=$(./utils.sh blockform smell foreste) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floor5) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][s][o][u][t][h]) if [ $i40bwindow -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki null window21 0 window7 $i30bwindow) ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh blockform looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh blockform looki null gate1 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh blockform looki null rain4 0) ;;

[l][o][o][k][r][o][a][d]) output=$(./utils.sh blockform looki null road1 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform looki null tree1 0) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i30bwindow -eq 0 ]
then
sed -i '/i30bwindow=/c\i30bwindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i40awindow -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh blockform uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh blockform looki null window22 0 window7 $i30awindow) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor2 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh blockform looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh blockform looki null rain4 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh blockform looki null tree1 0) ;;

[o][p][e][n][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform uni openwin) ;;

[s][m][a][s][h][w][e][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i30awindow -eq 0 ]
then
sed -i '/i30awindow=/c\i30awindow=1' status
intro=1
output=$(./utils.sh blockform uni smashwin1)
else
output=$(./utils.sh blockform uni smashwin2)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh blockform smell window) ;;

#constantcomm

esac
fi

done

