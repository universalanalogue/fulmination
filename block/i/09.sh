#!/bin/bash
#version=1.08.02

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
./utils.sh colorset 1
comp=1
pic=pic1a
aux1=$(if [ $i1window -eq 1 ] ; then ./utils.sh overlay win3 47 6 0 0; fi
if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win2 3 9 0 0; fi
if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win1 34 3 0 0; fi
if [ $i9box -eq 1 ] ; then ./utils.sh overlay box1 2 16 0 0; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 4
comp=1
pic=pic3a
aux1=$(if [ $i8awindow -eq 1 ] ; then ./utils.sh overlay win1b 3 3 1 0; fi)
fi

if [ $focus -eq 2 ]
then
./utils.sh colorset 4
comp=0
pic=pic2a
aux1=$(if [ $i5bwindow -eq 1 ] ; then ./utils.sh overlay win2b 3 3 1 0; fi)
fi

if [ $focus -eq 3 ]
then
./utils.sh colorset 4
comp=2
pic=pic4a
aux1=$(if [ $i1window -eq 1 ] ; then ./utils.sh overlay win3b 3 3 1 0; fi)
aux2=$(if [ $book31 -eq 0 ] ; then ./utils.sh overlay book6 39 12 0 0; fi)
fi

image=$(block/$block/./graphics.sh ${cell}$pic
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 0
echo "$aux1")
echo "$image"
echo "$aux2"
}

vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book13=$(grep 'book13=' status | cut -d "=" -f2)
book31=$(grep 'book31=' status | cut -d "=" -f2)
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
i03=$(grep 'i03=' status | cut -d "=" -f2)
i1window=$(grep 'i1window=' status | cut -d "=" -f2)
i5bwindow=$(grep 'i5bwindow=' status | cut -d "=" -f2)
i8awindow=$(grep 'i8awindow=' status | cut -d "=" -f2)
i9box=$(grep 'i9box=' status | cut -d "=" -f2)
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
./utils.sh prompt "$last" "$bar" "$output" 1
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][b][o][o][k]) if [ $i9box -eq 1 ]
then
if [ $book13 -eq 0 ]
then
sed -i '/book13=/c\book13=1' status
output=$(./utils.sh form uni get2 book) 
else
output=$(./utils.sh form uni get1)
fi
else
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form uni get1)
fi ;;

[g][e][t][k][e][y]) if [ $i9box -eq 1 ]
then
if [ $key4 -eq 0 ]
then
sed -i '/key4=/c\key4=1' status
output=$(./utils.sh form uni get2 key)
else
output=$(./utils.sh form uni get3 key)
fi 
else
output=$(./utils.sh form uni get1)
fi ;;

[g][o][e][a][s][t]) if [ $i8awindow -eq 1 ]
then
sed -i '/cell=/c\cell=08' status
break 
else
output=$(./utils.sh form uni go)
fi ;;

[g][o][n][o][r][t][h]) if [ $i5bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=05' status
break 
else
output=$(./utils.sh form uni go)
fi ;;

[g][o][s][o][u][t][h]) if [ $i1window -eq 1 ]
then
sed -i '/cell=/c\cell=01' status
break 
else
output=$(./utils.sh form uni go)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=03' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form looki i09 box3 $i9box box4 $i9box) ;;

[l][o][o][k][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -eq 0 ] || [ $book13 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][b][o][x]) if [ $i9box -eq 0 ]
then
output=$(./utils.sh form looki null box7 0)
else
output=$(./utils.sh form looki null box1 0 key2 $key4 book7 $book13)
fi ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form lookdoor door1 door4 $i03 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor3 0) ;;

[l][o][o][k][k][e][y]) if [ $i9box -eq 1 ] && [ $key4 -eq 0 ] || [ $key4 -eq 1 ]
then
./lib.sh key4a
output=$(./utils.sh form lookkey i09) 
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][e][a][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form looki null window10 0 window7 $i8awindow) ;;

[l][o][o][k][n][o][r][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=2' status
intro=1
output=$(./utils.sh form looki null window11 0 window7 $i5bwindow) ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=3' status
intro=1
output=$(./utils.sh form looki null window12 0 window7 $i1window) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall5 0) ;;

[o][p][e][n][b][o][x]) if [ $i9box -eq 1 ]
then
output=$(./utils.sh form looki null box8 0)
else
sed -i '/i9box=/c\i9box=1' status
intro=1
output=$(./utils.sh form looki null box9 0)
fi ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[o][p][e][n][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8awindow -eq 0 ]
then
sed -i '/i8awindow=/c\i8awindow=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

[s][m][a][s][h][n][o][r][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i5bwindow -eq 0 ]
then
sed -i '/i5bwindow=/c\i5bwindow=1' status
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

[r][e][a][d][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -eq 0 ] || [ $book13 -eq 1 ]
then
./utils.sh reader book112r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;


#olfactory

[l][i][c][k][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -eq 0 ] || [ $book13 -eq 1 ]
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][b][o][x]) output=$(./utils.sh form lick box3) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form lick door6) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor) ;;

[l][i][c][k][k][e][y]) if [ $i9box -eq 1 ] && [ $key7 -eq 0 ] || [ $key7 -eq 1 ]
then
output=$(./utils.sh form uni lickkey)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form lick door6) ;;

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[l][i][c][k][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -eq 0 ] || [ $book13 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][b][o][x]) output=$(./utils.sh form smell box3) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh form smell door2) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floore) ;;

[s][m][e][l][l][k][e][y]) if [ $i9box -eq 1 ] && [ $key4 -eq 0 ] || [ $key4 -eq 1 ]
then
output=$(./utils.sh form uni smellkey)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form smell wall2) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;


*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then

case $case1 in

#room commands

[g][o][e][a][s][t]) if [ $i8awindow -eq 1 ]
then
sed -i '/cell=/c\cell=08' status
break 
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window10 0 window7 $i8awindow) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form looki null door28 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form looki null window24 0 figure1 $book31 window7 $1window) ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i8awindow -eq 0 ]
then
sed -i '/i8awindow=/c\i8awindow=1' status
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

[g][o][n][o][r][t][h]) if [ $i5bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=05' status
break 
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window11 0 window7 $i5bwindow) ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form looki null box12 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[o][p][e][n][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][n][o][r][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
then
if [ $i5bwindow -eq 0 ]
then
sed -i '/i5bwindow=/c\i5bwindow=1' status
intro=1
output=$(./utils.sh form uni smashwin1)
else
output=$(./utils.sh form uni smashwin2)
fi
else
output=$(./utils.sh form uni smash)
fi ;;

#olfactory

[l][i][c][k][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form smell window) ;;

[s][m][e][l][l][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form smell window) ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 3 ]
then

case $case1 in

#room commands

[g][o][s][o][u][t][h]) if [ $i1window -eq 1 ]
then
sed -i '/cell=/c\cell=01' status
break 
else
output=$(./utils.sh form uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form looki null window12 0 window7 $i1window) ;;

[l][o][o][k][b][o][o][k]) if [ $book31 -eq 0 ]
then
output=$(./utils.sh form looki null book1 0)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) if [ $book31 -eq 0 ]
then
output=$(./utils.sh form looki null book1 0)
else
output=$(./utils.sh form looki null table2 0)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form looki null wall1 0) ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=3' status
intro=1
output=$(./utils.sh form looki null window12 0 window7 $i1window) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form uni openwin) ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w]) if [ $hammer -eq 1 ]
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

