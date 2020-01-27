#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
if [ $i19painting -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1a)
fi
if [ $i19painting -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1b)
fi
if [ $i19safe -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1c)
fi
echo "$image"
fi

if [ $focus -eq 1 ]
then
if [ $i19painting -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
echo "$image"
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2b)
echo "$image"
fi
if [ $i19safe -eq 1 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2c)
echo "$image"
if [ $book112 -eq 0 ] ; then ./utils.sh overlay book4 25 15 0 ; fi
fi
fi

}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book112=$(grep 'book112=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key4=$(grep 'key4=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i18=$(grep 'i18=' status | cut -d "=" -f2)
i20=$(grep 'i20=' status | cut -d "=" -f2)
i19painting=$(grep 'i19painting=' status | cut -d "=" -f2)
i19safe=$(grep 'i19safe=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 7
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $key4 -eq 1 ]
then
sed -i '/cell=/c\cell=20' status
break 
else
output=$(./utils.sh blockform uni doorlock)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=18' status ; break ;;

[l][o][o][k]) output=$(./utils.sh blockform looki i19) ;;

[l][o][o][k][e][a][s][t][d][o][o][r]) 
output=$(./utils.sh blockform lookdoor door1 door17 $i20 $key4) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) 
output=$(./utils.sh blockform lookdoor door1 door8 $i18 1) ;;

[l][o][o][k][b][o][o][k]) if [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][l][o][c][k])./lib.sh key4b
if [ $key4 -eq 0 ]
then
output=$(./utils.sh blockform uni doorlock)
else
output=$(./utils.sh blockform uni doorunlock)
fi ;;

[l][o][o][k][p][a][i][n][t][i][n][g]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $i19painting -eq 0 ]
then
output=$(./utils.sh blockform looki null painting1 0)
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 0 ]
then
output=$(./utils.sh blockform looki null painting2 0 painting6 0)
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 1 ]
then
output=$(./utils.sh blockform looki null painting3 0)
fi ;;

[l][o][o][k][s][a][f][e]) if [ $i19painting -eq 0 ]
then
output=$(./utils.sh blockform uni look)
else
sed -i '/focus=/c\focus=1' status
intro=1
if [ $i19painting -eq 1 ] && [ $i19safe -eq 0 ]
then
output=$(./utils.sh blockform looki null safe1 0)
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 1 ] && [ $book112 -eq 0 ]
then
output=$(./utils.sh blockform looki null safe2 0)
fi 
if [ $i19painting -eq 1 ] && [ $i19safe -eq 1 ] && [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform looki null safe3 0)
fi
fi ;;

[o][p][e][n][p][a][i][n][t][i][n][g]) if [ $i19painting -eq 1 ]
then
output=$(./utils.sh blockform looki null painting4 0)
fi
if [ $i19painting -eq 0 ]
then
sed -i "/i19painting=/c\i19painting=1" status
intro=1
output=$(./utils.sh blockform looki null painting5 0)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book112 -eq 1 ]
then
./utils.sh reader book112r
intro=1
else
output=$(./utils.sh blockform uni read)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh blockform looki null floor5 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh blockform looki null wall8 0) ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh blockform lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh blockform lick floor3) ;;

[l][i][c][k][p][a][i][n][t][i][n][g]) output=$(./utils.sh blockform lick painting1) ;;

[l][i][c][k][s][a][f][e]) if [ $i19painting -eq 1 ]
then
output=$(./utils.sh blockform lick safe1)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh blockform lick wall3) ;;

[s][m][e][l][l]) output=$(./utils.sh blockform smell i15) ;;

[s][m][e][l][l][e][a][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][w][e][s][t][d][o][o][r]) output=$(./utils.sh blockform smell door) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh blockform smell floor4) ;;

[s][m][e][l][l][p][a][i][n][t][i][n][g]) output=$(./utils.sh blockform smell painting1) ;;

[s][m][e][l][l][s][a][f][e]) if [ $i19painting -eq 1 ]
then
output=$(./utils.sh blockform smell safe1)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh blockform smell wall5) ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $i19safe -eq 1 ]
then
if [ $book112 -eq 0 ]
then
sed -i '/book112=/c\book112=1' status
output=$(./utils.sh blockform uni get2 book)
intro=1
else
output=$(./utils.sh blockform uni get1)
fi
else
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh blockform uni get1)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book112 -eq 0 ] || [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform uni book)
else
output=$(./utils.sh blockform uni look)
fi ;;

[l][o][o][k][p][a][i][n][t][i][n][g]) if [ $i19painting -eq 0 ]
then
output=$(./utils.sh blockform looki null painting1 0)
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 0 ]
then
output=$(./utils.sh blockform looki null painting2 0 painting6 0)
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 1 ]
then
output=$(./utils.sh blockform looki null painting3 0)
fi ;;

[l][o][o][k][s][a][f][e]) if [ $i19painting -eq 0 ]
then
output=$(./utils.sh blockform uni look)
else
sed -i '/focus=/c\focus=1' status
intro=1
if [ $i19painting -eq 1 ] && [ $i19safe -eq 0 ]
then
output=$(./utils.sh blockform looki null safe1 0)
fi
if [ $i19painting -eq 1 ] && [ $i19safe -eq 1 ] && [ $book112 -eq 0 ]
then
output=$(./utils.sh blockform looki null safe2 0)
fi 
if [ $i19painting -eq 1 ] && [ $i19safe -eq 1 ] && [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform looki null safe3 0)
fi
fi ;;

[o][p][e][n][p][a][i][n][t][i][n][g]) if [ $i19painting -eq 1 ]
then
output=$(./utils.sh blockform looki null painting4 0)
fi
if [ $i19painting -eq 0 ]
then
sed -i "/i19painting=/c\i19painting=1" status
intro=1
output=$(./utils.sh blockform looki null painting5 0)
fi ;;

[o][p][e][n][s][a][f][e]) if [ $i19safe -eq 1 ]
then
output=$(./utils.sh blockform looki null safe4 0)
fi
if [ $i19safe -eq 0 ]
then
while true ; do
output=$(./utils.sh blockform looki null safe5 0)
./utils.sh menu "$output" Passcode
read case2
case $case2 in
[0][7][-][2][0][-][4][3]) sed -i "/i19safe=/c\i19safe=1" status
intro=1
output=$(./utils.sh blockform looki null safe6 0) ;;

*) output=$(./utils.sh blockform looki null safe7 0) ;;
esac
break
done
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book112 -eq 0 ] || [ $book112 -eq 1 ]
then
./utils.sh reader book112r
intro=1
else
output=$(./utils.sh blockform uni read)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book112 -eq 0 ] || [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform lick book)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[l][i][c][k][s][a][f][e]) if [ $i19painting -eq 1 ]
then
output=$(./utils.sh blockform lick safe1)
else
output=$(./utils.sh blockform uni lick1)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $i19safe -eq 1 ] && [ $book112 -eq 0 ] || [ $book112 -eq 1 ]
then
output=$(./utils.sh blockform smell book)
else
output=$(./utils.sh blockform uni smell)
fi ;;

[s][m][e][l][l][p][a][i][n][t][i][n][g]) output=$(./utils.sh blockform smell painting1) ;;

[s][m][e][l][l][s][a][f][e]) if [ $i19painting -eq 1 ]
then
output=$(./utils.sh blockform smell safe1)
else
output=$(./utils.sh blockform uni smell)
fi ;;

#constantcomm

esac
fi


done

