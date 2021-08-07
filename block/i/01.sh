#!/bin/bash
#version=1.08.01

background() {
aux1= ; aux2= ; pic=

if [ $focus -eq 0 ]
then
./utils.sh colorset 4
tint=0
pic="pic1a"
aux1=$(if [ $i1window -eq 1 ] ; then ./utils.sh overlay win1 34 3 0 0; fi)
aux2=$(if [ $key3 -eq 0 ] ; then ./utils.sh overlay key1 28 15 0 0; fi
if [ $book31 -eq 0 ] ; then ./utils.sh overlay book1 28 15 0 0; fi)

fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 1
tint=4
pic="pic2"
aux1=$(if [ $rain -eq 1 ] ; then ./utils.sh overlay rain1 3 3 1 0 ; fi
if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win1 14 3 0 0; fi
if [ $i1window -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 0; fi)
aux2=$(if [ $i9box -eq 1 ] ; then ./utils.sh overlay box1 5 6 0 0; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0 $tint
./utils.sh overlay "sidebar $block $cell 0" 56 4 0 $tint
echo "$aux1")

echo "$image"
echo "$aux2"

}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book31=$(grep 'book31=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key3=$(grep 'key3=' status | cut -d "=" -f2)
light=$(grep 'light=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep "block=" status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
i02=$(grep 'i02=' status | cut -d "=" -f2)
i06=$(grep 'i06=' status | cut -d "=" -f2)
i9box=$(grep 'i9box=' status | cut -d "=" -f2)
i1window=$(grep 'i1window=' status | cut -d "=" -f2)
i5bwindow=$(grep 'i5bwindow=' status | cut -d "=" -f2)
rain=$(grep 'rain=' status | cut -d "=" -f2)
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

#sleep



while true ; do

./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then break ; fi

if [ $intro -eq 2 ] ; then vars ; fi

if [ $intro -lt 2 ]
then
if [ $intro -eq 0 ] ; then output=$(./utils.sh form) ; fi
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

[g][e][t][b][o][o][k]) if [ $book31 -eq 2 ] 
then
output=$(./utils.sh form uni get1) 
fi
if [ "$book31" -eq 0 ]
then
sed -i '/book31/c\book31=1' status
intro=1
output=$(./utils.sh form uni get2 book)
fi
if [ "$book31" -eq 1 ]
then
output=$(./utils.sh form uni get3 book)
fi ;;

[g][e][t][k][e][y]) if [ $key3 -eq 0 ] 
then
sed -i '/key3=/c\key3=1' status
intro=1
output=$(./utils.sh form uni get2 key)
else
output=$(./utils.sh form uni get3 key)
fi ;;

[g][o][e][a][s][t]) if [ $light -eq 1 ] ; then
sed -i '/cell=/c\cell=06' status
break
else
./utils.sh colorset 2
./utils.sh cutscene i1a Death logo
./utils.sh setdeath
break
fi ;;

[g][o][n][o][r][t][h]) if [ $i1window -eq 1 ] ; then 
sed -i '/cell=/c\cell=09' status
sed -i '/focus=/c\focus=0' status
break
else output=$(./utils.sh form uni go) ; fi ;;

[g][o][w][e][s][t]) if [ $key3 -eq 1 ] 
then
sed -i '/cell=/c\cell=02' status
break 
else
output=$(./utils.sh form uni doorlock)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki i01 key1 $key3 book1 $book31 window1 $i1window) ;;

[l][o][o][k][b][o][o][k]) if [ $book31 -eq 0 ] || [ $book31 -eq 1 ] 
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][e][a][s][t][c][o][r][r][i][d][o][r]) output=$(./utils.sh form looki null corridor1 0) ;;

[l][o][o][k][w][e][s][t][d][o][o][r]) output=$(./utils.sh form lookdoor door1 door2 $i02 $key3) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][k][e][y]) ./lib.sh key3a
if [ $key3 -eq 0 ] ; then output=$(./utils.sh form lookkey i01) ; fi
if [ $key3 -eq 1 ] ; then output=$(./utils.sh form uni get3 key) ; fi ;;

[l][o][o][k][l][o][c][k]) ./lib.sh key3b
if [ $key3 -eq 0 ] 
then
output=$(./utils.sh form uni doorlock)
else
output=$(./utils.sh form uni doorunlock)
fi ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form looki null table1 0 key1 $key3 book1 $book31) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $rain -eq 1 ] ; then
output=$(./utils.sh form looki null window2 0 rain1 0)
else
output=$(./utils.sh form looki null window2 0 rain2 0 box1 $i9box window7 $i1window)
fi ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[r][e][a][d][b][o][o][k]) if [ $book31 -eq 0 ] || [ $book31 -eq 1 ]
then
./utils.sh reader book31r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i1window -eq 0 ]
then
sed -i '/i1window=/c\i1window=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book31 -eq 0 ] || [ $book31 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form lick door) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floori) ;;

[l][i][c][k][k][e][y]) if [ $key3 -eq 0 ] || [ $key3 -eq 1 ]
then
ouput=$(./utils.sh form lick key)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][t][a][b][l][e]) output=$(./utils.sh form lick table) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick wall) ;;

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) if [ $book31 -ne 0 ]
then
output=$(./utils.sh form smell i01 $i1window)
else
output=$(./utils.sh form smell book3)
fi ;;

[s][m][e][l][l][b][o][o][k]) if [ $book31 -eq 0 ] || [ $book31 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][c][o][r][r][i][d][o][o][r]) output=$(./utils.sh form smell corridor1) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh form smell door) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floori) ;;

[s][m][e][l][l][k][e][y]) if [ $key3 -eq 0 ] || [ $key3 -eq 1 ]
then
output=$(./utils.sh form smell key)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][t][a][b][l][e]) output=$(./utils.sh form smell table) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;
esac
fi

if [ $focus -eq 1 ]
then
case $case1 in

#room commands

[g][o][n][o][r][t][h]) if [ $i1window -eq 1 ] ; then 
sed -i '/cell=/c\cell=09' status
break
else output=$(./utils.sh form uni go) ; fi ;;

[l][o][o][k])if [ $rain -eq 1 ] ; then
output=$(./utils.sh form looki null window2 0 rain1 0)
else
output=$(./utils.sh form looki null window2 0 rain2 0 box1 $i9box window7 $i1window)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window1 $rain $i1window $i5bwindow $i9box) ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form looki null box2 0 box1 $i9box) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor2 0) ;;

[l][o][o][k][r][a][i][n]) if [ $rain -eq 1 ]
then
output=$(./utils.sh form looki null rain3 0)
else
output=$(./utils.sh form looki null rain4 0)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall5 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form looki null window22 0 window7 $i5bwindow) ;;

[o][p][e][n][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i1window -eq 0 ]
then
sed -i '/i1window=/c\i1window=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

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

