#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
if [ $i7mirror -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
else
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
echo "$image"
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 6
if [ $i7mirror -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2b)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2c)
fi
echo "$image"

fi
}

function vars(){

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book14=$(grep 'book14=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key2=$(grep 'key2=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i06=$(grep 'i06=' status | cut -d "=" -f2)
i7mirror=$(grep 'i7mirror=' status | cut -d "=" -f2)
licktoilet=$(grep 'licktoilet=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $book14 -eq 0 ]
then
sed -i '/book14=/c\book14=1' status
output=$(./utils.sh blockform uni get2 book) 
else
output=$(./utils.sh blockform uni get1)
fi ;;

[g][e][t][k][e][y]) if [ $key2 -eq 0 ]
then
sed -i '/key2=/c\key2=1' status
output=$(./utils.sh blockform uni get2 key)
else
output=$(./utils.sh blockform uni get3 key)
fi ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=06' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i07) ;;

[l][o][o][k][b][o][o][k]) if [ $book14 -eq 0 ] || [ $book14 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh blockform lookdoor door1 door11 $i06 1) ;;

[l][o][o][k][c][a][b][i][n][e][t]) if [ $key2 -eq 0 ]
then
output=$(./utils.sh blockform looki null cabinet1 0)
else
output=$(./utils.sh blockform looki null cabinet2 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor6 0) ;;

[l][o][o][k][k][e][y]) ./lib.sh key2a
if [ $key2 -eq 0 ] ; then output=$(./utils.sh blockform lookkey i07) ; fi
if [ $key2 -eq 1 ] ; then output=$(./utils.sh blockform uni get3 key) ; fi ;;

[l][o][o][k][l][i][g][h][t][e][r]) if [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform looki null lighter4 0)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][m][i][r][r][o][r]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror1 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror2 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform looki null mirror3 0)
fi ;;

[l][o][o][k][t][o][i][l][e][t]) output=$(./utils.sh blockform looki null toilet1 0) ;;

[l][o][o][k][t][u][b]) output=$(./utils.sh blockform looki null tub1 0 tub2 $book14) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book14 -eq 0 ] || [ $book14 -eq 1 ]
then
./utils.sh reader book14r
intro=0
else
output=$(./utils.sh blockform uni read)
fi ;;

[s][m][a][s][h][m][i][r][r][o][r]) if [ $hammer -eq 1 ]
then
if [ $i7mirror -eq 0 ]
then
sed -i '/i7mirror=/c\i7mirror=1' status
intro=1
output=$(./utils.sh blockform uni smashmin1)
else
output=$(./utils.sh blockform uni smashmir1)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book14 -eq 0 ] || [ $book14 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][c][a][b][i][n][e][t]) output=$(./utils.sh blockform lick cabinet1) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh blockform lick cabinet1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor1) ;;

[l][i][c][k][k][e][y]) if [ $key2 -eq 0 ] || [ $key2 -eq 1 ]
then
output=$(./utils.sh blockform uni lickkey)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][l][i][g][h][t][e][r])if [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform lick light2)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][m][i][r][r][o][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh blockform lick mirror1)
else
output=$(./utils.sh blockform lick mirror2)
fi ;;

[l][i][c][k][t][o][i][l][e][t]) if [ $licktoilet -eq 2 ]
then
./utils.sh cutscene toiletlick3 Death "graphpass i 07pic1a"
./utils.sh setdeath
break
fi
if [ $licktoilet -eq 1 ]
then
output=$(./utils.sh blockform lick toilet2)
sed -i '/licktoilet=/c\licktoilet=2' status
fi
if [ $licktoiliet -eq 0 ]
then
output=$(./utils.sh blockform lick toilet1)
sed -i '/licktoilet=/c\licktoilet=1' status
fi ;;

[l][i][c][k][t][u][b]) output=$(./utils.sh blockform lick tub1) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall1) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i07) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book14 -eq 0 ] || [ $book14 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][c][a][b][i][n][e][t]) output=$(./utils.sh blockform smell cabinet1) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh blockform smell door5) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floor2) ;;

[s][m][e][l][l][k][e][y]) if [ $key2 -eq 0 ] || [ $key2 -eq 1 ]
then
output=$(./utils.sh blockform uni smellkey)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][l][i][g][h][t][e][r]) if [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform smell lighter)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][m][i][r][r][o][r]) output=$(./utils.sh blockform smell mirror1) ;;

[s][m][e][l][l][t][o][i][l][e][t]) output=$(./utils.sh blockform smell toilet1) ;;

[s][m][e][l][l][t][u][b]) output=$(./utils.sh blockform smell tub1) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall1) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][l][i][g][h][t][e][r]) if [ $i7mirror -eq 1 ]
then
if [ $lighter -eq 0 ]
then
sed -i '/lighter=/c\lighter=1' status
intro=1
output=$(./utils.sh blockform looki null lighter1 0)
else
output=$(./utils.sh blockform looki null lighter2 0)
fi 
else
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh blockform uni get1)
fi ;;

[l][o][o][k]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror1 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror2 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform looki null mirror3 0)
fi ;;


[l][o][o][k][l][i][g][h][t][e][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh blockform uni look)
else
if [ $lighter -eq 0 ] || [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform looki null lighter4 0)
else
output=$(./utils.sh blockform uni look)
fi
fi ;;

[l][o][o][k][m][i][r][r][o][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror1 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
output=$(./utils.sh blockform looki null mirror2 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform looki null mirror3 0)
fi ;;

[s][m][a][s][h][m][i][r][r][o][r]) if [ $hammer -eq 1 ]
then
if [ $i7mirror -eq 0 ]
then
sed -i '/i7mirror=/c\i7mirror=1' status
intro=1
output=$(./utils.sh blockform uni smashmin1)
else
output=$(./utils.sh blockform uni smashmir1)
fi
else
output=$(./utils.sh blockform uni smash)
fi ;;

#olfactory

[l][i][c][k][l][i][g][h][t][e][r]) if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ] || [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform lick light2)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][m][i][r][r][o][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh blockform lick mirror1)
else
output=$(./utils.sh blockform lick mirror2)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell mirror1) ;;

[s][m][e][l][l][l][i][g][h][t][e][r]) if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ] || [ $lighter -eq 1 ]
then
output=$(./utils.sh blockform smell lighter)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][m][i][r][r][o][r]) output=$(./utils.sh blockform smell mirror1) ;;

#constantcomm

esac
fi

done

