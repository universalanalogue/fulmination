#!/bin/bash

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 5
pic=pic1a
aux1=$(if [ $i32awindow -eq 1 ] ; then ./utils.sh overlay win5 25 4 0 ; fi
if [ $i32bwindow -eq 1 ] ; then ./utils.sh overlay win7 49 7 0 ; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
pic=pic2a
aux1=$(if [ $i32awindow -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 ; fi)
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 1
pic=pic3a
aux1=$(if [ $i32bwindow -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 ; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
echo -e "aux1")
echo "$image"
}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
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
i38=$(grep 'i38=' status | cut -d "=" -f2)
i32awindow=$(grep 'i32awindow=' status | cut -d "=" -f2)
i32bwindow=$(grep 'i32bwindow=' status | cut -d "=" -f2)
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
if [ $intro -eq 0 ] ; then output=$(./utils.sh form) ; fi
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

[g][o][e][a][s][t]) if [ $i32awindow -eq 1 ]
then 
./utils.sh colorset 2
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[g][o][s][o][u][t][h]) if [ $i32bwindow -eq 1 ]
then 
./utils.sh colorset 2
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=38' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i32 curtain1 0 window1 $i32awindow) ;;

[l][o][o][k][e][a][s][t][c][u][r][t][a][i][n][s])
output=$(./utils.sh form looki null curtains2 0) ;;

[l][o][o][k][s][o][u][t][h][c][u][r][t][a][i][n][s])
output=$(./utils.sh form looki null curtains2 0) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh form lookdoor door1 door15 $i38 1) ;;

[l][o][o][k][a][r][m][o][i][r][e]) output=$(./utils.sh form looki null armoire1 0) ;;

[l][o][o][k][b][e][d]) output=$(./utils.sh form looki null bed1 0) ;;

[l][o][o][k][c][l][o][c][k]) output=$(./utils.sh form looki null clock12 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor7 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][e][a][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form looki null window18 0 window7 $i32awindow) ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=2' status
intro=1
output=$(./utils.sh form looki null window22 0 window7 $i32bwindow) ;;

[p][l][a][c][e][c][o][g][c][l][o][c][k]) if [ $cog -eq 0 ] 
then
output=$(./utils.sh form uni place)
else
output=$(./utils.sh form looki null clock13 0)
fi ;;

[p][l][a][c][e][g][e][a][r][c][l][o][c][k]) if [ $gear -eq 0 ]
then
output=$(./utils.sh form uni place)
else
output=$(./utils.sh form looki null clock13 0)
fi ;;

[p][l][a][c][e][m][a][i][n][s][p][r][i][n][g][b][a][r][r][e][l][c][l][o][c][k])
if [ $mainspringbarrel -eq 0 ] 
then
output=$(./utils.sh form uni place)
else
output=$(./utils.sh form looki null clock13 0)
fi ;;

[p][l][a][c][e][s][p][r][o][c][k][e][t][c][l][o][c][k]) if [ $sprocket -eq 0 ]
then
output=$(./utils.sh form uni place)
else
output=$(./utils.sh form looki null clock13 0)
fi ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i32awindow -eq 0 ]
then
sed -i '/i32awindow=/c\i32awindow=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i32bwindow -eq 0 ]
then
sed -i '/i32bwindow=/c\i32bwindow=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#bedtime


#olfactory

[l][i][c][k][a][r][m][o][i][r]) output=$(./utils.sh form lick forest) ;;

[l][i][c][k][b][e][d]) output=$(./utils.sh form lick bed1) ;;

[l][i][c][k][c][l][o][c][k]) output=$(./utils.sh form lick clock1) ;;

[l][i][c][k][c][u][r][t][a][i][n][s]) output=$(./utils.sh form lick curtain1) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor5) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) if [ $i32awindow -eq 1 ] || [ $i32bwindow -eq 1 ]
then
output=$(./utils.sh form smell e)
else
output=$(./utils.sh form smell i23)
fi ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][a][r][m][o][i][r]) output=$(./utils.sh form smell foreste) ;;

[s][m][e][l][l][b][e][d]) output=$(./utils.sh form smell bed1) ;;

[s][m][e][l][l][c][l][o][c][k]) output=$(./utils.sh form smell clock1) ;;

[s][m][e][l][l][c][u][r][t][a][i][n][s]) output=$(./utils.sh form smell curtain1) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor5) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i32awindow -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window18 0 window7 $i32awindow) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor2 0) ;;

[l][o][o][k][f][o][r][e][s][t]) output=$(./utils.sh form looki null forest3 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form looki null hedge3 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form looki null rain4 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form looki null tree1 0) ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i32awindow -eq 0 ]
then
sed -i '/i32awindow=/c\i32awindow=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 2 ]
then

case $case1 in

#room commands

[g][o][s][o][u][t][h]) if [ $i32bwindow -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window22 0 window7 $i32bwindow) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor2 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form looki null rain4 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form looki null tree1 0) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i32bwindow -eq 0 ]
then
sed -i '/i32bwindow=/c\i32bwindow=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

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

