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
sidebar
echo "$aux1")
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 0
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
./utils.sh score 2
sidebar
sed -i '/book13=/c\book13=1' status
output=$(./utils.sh form 1 uni get2 book) 
else
output=$(./utils.sh form 1 uni get1)
fi
else
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form 1 uni get1)
fi ;;

[g][e][t][k][e][y]) if [ $i9box -eq 1 ]
then
if [ $key4 -eq 0 ]
then
./utils.sh score 2
sidebar
sed -i '/key4=/c\key4=1' status
output=$(./utils.sh form 1 uni get2 key)
else
output=$(./utils.sh form 1 uni get3 key)
fi 
else
output=$(./utils.sh form 1 uni get1)
fi ;;

[g][o][e][a][s][t]) if [ $i8awindow -eq 1 ]
then
sed -i '/cell=/c\cell=08' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][n][o][r][t][h]) if [ $i5bwindow -eq 1 ]
then
sed -i '/cell=/c\cell=05' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][s][o][u][t][h]) if [ $i1window -eq 1 ]
then
sed -i '/cell=/c\cell=01' status
break 
else
output=$(./utils.sh form 1 uni go)
fi ;;

[g][o][w][e][s][t]) sed -i '/cell=/c\cell=03' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i09 box3 $i9box box4 $i9box) ;;

[l][o][o][k][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -ne 2 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][b][o][x]) if [ $i9box -eq 0 ]
then
output=$(./utils.sh form 1 looki null box7 0)
else
output=$(./utils.sh form 1 looki null box1 0 key2 $key4 book7 $book13)
fi ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 lookdoor door1 door4 $i03 1) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor3 0) ;;

[l][o][o][k][k][e][y]) if [ $i9box -eq 1 ] && [ $key4 -ne 2 ]
then
sidebar
./lib.sh keya key6
output=$(./utils.sh form 1 lookkey i09) 
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][e][a][s][t][w][i][n][d][o][w]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 looki null window10 0 window7 $i8awindow) ;;

[l][o][o][k][n][o][r][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=2' status
intro=1
output=$(./utils.sh form 1 looki null window11 0 window7 $i5bwindow) ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=3' status
intro=1
output=$(./utils.sh form 1 looki null window12 0 window7 $i1window) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall5 0) ;;

[o][p][e][n][b][o][x]) if [ $i9box -eq 1 ]
then
output=$(./utils.sh form 1 looki null box8 0)
else
sed -i '/i9box=/c\i9box=1' status
intro=1
output=$(./utils.sh form 1 looki null box9 0)
fi ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[o][p][e][n][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w])
smash=$(./utils.sh smash i8awindow $hammer $i8awindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

[s][m][a][s][h][n][o][r][t][h][w][i][n][d][o][w]) 
smash=$(./utils.sh smash i5bwindow $hammer $i5bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i1window $hammer $i1window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

[r][e][a][d][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -ne 2 ]
then
./utils.sh reader book112r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;


#olfactory

[l][i][c][k][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][b][o][x]) output=$(./utils.sh form 1 lick box3) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form 1 lick door6) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[l][i][c][k][k][e][y]) if [ $i9box -eq 1 ] && [ $key7 -ne 2 ]
then
output=$(./utils.sh form 1 uni lickkey)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick door6) ;;

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[l][i][c][k][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $i9box -eq 1 ] && [ $book13 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][b][o][x]) output=$(./utils.sh form 1 smell box3) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh form 1 smell door2) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

[s][m][e][l][l][k][e][y]) if [ $i9box -eq 1 ] && [ $key4 -ne 2 ]
then
output=$(./utils.sh form 1 uni smellkey)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall2) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;


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
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null window10 0 window7 $i8awindow) ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 looki null door28 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[l][o][o][k][w][i][n][d][o][w]) output=$(./utils.sh form 1 looki null window24 0 figure1 $book31 window7 $1window) ;;

[o][p][e][n][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][e][a][s][t][w][i][n][d][o][w])
smash=$(./utils.sh smash i8awindow $hammer $i8awindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][e][a][s][t][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;


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
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null window11 0 window7 $i5bwindow) ;;

[l][o][o][k][b][o][x]) output=$(./utils.sh form 1 looki null box12 0) ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) output=$(./utils.sh form 1 looki null table2 0) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[o][p][e][n][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][n][o][r][t][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i5bwindow $hammer $i5bwindow )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][n][o][r][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

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
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki null window12 0 window7 $i1window) ;;

[l][o][o][k][b][o][o][k]) if [ $book31 -eq 0 ]
then
output=$(./utils.sh form 1 looki null book1 0)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor1 0) ;;

[l][o][o][k][t][a][b][l][e]) if [ $book31 -eq 0 ]
then
output=$(./utils.sh form 1 looki null book1 0)
else
output=$(./utils.sh form 1 looki null table2 0)
fi ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[l][o][o][k][s][o][u][t][h][w][i][n][d][o][w]) sed -i '/focus=/c\focus=3' status
intro=1
output=$(./utils.sh form 1 looki null window12 0 window7 $i1window) ;;

[o][p][e][n][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 uni openwin) ;;

[s][m][a][s][h][s][o][u][t][h][w][i][n][d][o][w])
smash=$(./utils.sh smash i1window $hammer $i1window )
intro=$(sed "1q;d" <<< "$smash")
output=$(tail -n 12 <<< "$smash") ;;

#olfactory

[l][i][c][k][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 lick window) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell window) ;;

[s][m][e][l][l][s][o][u][t][h][w][i][n][d][o][w]) output=$(./utils.sh form 1 smell window) ;;

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

