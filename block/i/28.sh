#!/bin/bash
#version=1.08.02

background() {
aux1= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 5
pic=pic1a
aux1=$(if [ $i28window -eq 1 ] ; then ./utils.sh overlay win5 25 4 0 ; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
pic=pic2a
aux1=$(if [ $i28window -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 ; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 3" 56 4 0
echo -e "$aux1")
echo "$image"

}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book24=$(grep 'book24=' status | cut -d "=" -f2)
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
i41=$(grep 'i41=' status | cut -d "=" -f2)
i28window=$(grep 'i28window=' status | cut -d "=" -f2)
i1window=$(grep 'i1window=' status | cut -d "=" -f2)
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

[g][e][t][b][o][o][k]) if [ $book24 -eq 0 ]
then
sed -i '/book24=/c\book24=1' status
output=$(./utils.sh form uni get2 book) 
else
output=$(./utils.sh form uni get1)
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
fi ;;

[g][e][t][c][o][g]) if [ $cog -eq 1 ]
then
output=$(./utils.sh form uni get3 cog)
fi 
if [ $cog -eq 0 ]
then
sed -i '/cog=/c\cog=1' status
intro=1
output=$(./utils.sh form uni get2 cog)
fi
if [ $cog -eq 2 ]
then
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form uni get1)
fi ;;

[g][o][e][a][s][t]) sed -i '/cell=/c\cell=41' status ; break ;;

[g][o][w][e][s][t]) if [ $i28window -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki i28 curtain1 0 window1 $i28window) ;;

[l][o][o][k][a][r][m][o][i][r][e]) output=$(./utils.sh form looki null armoire1 0) ;;

[l][o][o][k][b][e][d]) output=$(./utils.sh form looki null bed1 0 book12 $book24) ;;

[l][o][o][k][b][o][o][k]) if [ $book24 -eq 0 ] || [ $book24 -eq 1 ] 
then
output=$(./utils.sh form uni book)
else 
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form looki null bookcase1 0) ;;

[l][o][o][k][c][l][o][c][k])if [ $cog -eq 0 ]
then
output=$(./utils.sh form looki null cog1 0)
else
output=$(./utils.sh form looki null cog2 0)
fi ;;

[l][o][o][k][c][o][g]) if [ $cog -eq 0 ] || [ $cog -eq 1 ]
then
output=$(./utils.sh form looki null cog3 0)
else 
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][c][u][r][t][a][i][n][s]) output=$(./utils.sh form looki null curtains2 0) ;;

[l][o][o][k][e][a][s][t][d][o][o][r])
output=$(./utils.sh form lookdoor door1 door18 $i41 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor7 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][w][e][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form looki null window21 0 window7 $i28window) ;;

[p][l][a][c][e][c][o][g][c][l][o][c][k])
if [ $cog -eq 0 ] 
then
output=$(./utils.sh form uni place)
else
output=$(./utils.sh form looki null clock13 0)
fi ;;

[p][l][a][c][e][g][e][a][r][c][l][o][c][k]) 
if [ $gear -eq 0 ] 
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

[p][l][a][c][e][s][p][r][o][c][k][e][t][c][l][o][c][k]) 
if [ $sprocket -eq 0 ] 
then
output=$(./utils.sh form uni place)
else
output=$(./utils.sh form looki null clock13 0)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book24 -eq 0 ] || [ $book24 -eq 1 ]
then
./utils.sh reader book24r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i28window -eq 0 ]
then
sed -i '/i28window=/c\i28window=1' status
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

[l][i][c][k][b][o][o][k]) if [ $book24 -eq 0 ] || [ $book24 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][b][o][o][k][c][a][s][e]) output=$(./utils.sh form lick forest) ;;

[l][i][c][k][c][l][o][c][k]) output=$(./utils.sh form lick clock) ;;

[l][i][c][k][c][o][g]) if [ $cog -eq 0 ] || [ $cog -eq 1 ]
then
output=$(./utils.sh form lick peg)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][c][u][r][t][a][i][n][s]) output=$(./utils.sh form lick curtain1) ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor5) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) if [ $i28window -eq 1 ]
then
output=$(./utils.sh form smell e)
else
output=$(./utils.sh form smell i23)
fi ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh form smell foreste) ;;

[s][m][e][l][l][a][r][m][o][i][r]) output=$(./utils.sh form smell foreste) ;;

[s][m][e][l][l][b][e][d]) output=$(./utils.sh form smell bed1) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book24 -eq 0 ] || [ $book24 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][b][o][o][k][c][a][s][e]) output=$(./utils.sh form smell foreste) ;;

[s][m][e][l][l][c][l][o][c][k]) output=$(./utils.sh form smell clock1) ;;

[s][m][e][l][l][c][o][g]) if [ $cog -eq 0 ] || [ $cog -eq 1 ]
then
output=$(./utils.sh form smell peg)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][c][u][r][t][a][i][n][s]) output=$(./utils.sh form smell curtain1) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floor5) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][w][e][s][t]) if [ $i28window -eq 1 ]
then 
./utils.sh cutscene windowfall Death logo
./utils.sh setdeath
break
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window21 0 window7 $i28window) ;;

[l][o][o][k][d][r][i][v][e]) output=$(./utils.sh form looki null drive1 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor2 0) ;;

[l][o][o][k][g][a][t][e]) output=$(./utils.sh form looki null gate1 0) ;;

[l][o][o][k][h][e][d][g][e]) output=$(./utils.sh form looki null hedge1 0) ;;

[l][o][o][k][r][a][i][n]) output=$(./utils.sh form looki null rain4 0) ;;

[l][o][o][k][r][o][a][d]) output=$(./utils.sh form looki null road1 0) ;;

[l][o][o][k][t][r][e][e]) output=$(./utils.sh form looki null tree1 0) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i28window -eq 0 ]
then
sed -i '/i28window=/c\i28window=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][w][e][s][t][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

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

