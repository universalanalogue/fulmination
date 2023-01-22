#!/bin/bash
#version=1.08.01

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ]
then
pic=pic1a
tint=0
aux1=$(if [ $i7mirror -eq 1 ] ; then ./utils.sh overlay win8 35 10 0 0 ; fi)
fi

if [ $focus -eq 1 ]
then
./utils.sh colorset 6
tint=4
if [ $i7mirror -eq 0 ] ; then pic=pic2a ; fi
if [ $i7mirror -eq 1 ] ; then
pic=pic2b
aux1=$(if [ $lighter -eq 0 ] ; then ./utils.sh overlay unless 45 4 0 0 ; fi)
aux2=$(if [ $lighter -eq 0 ] ; then ./utils.sh overlay lighter 21 13 0 0 ; fi)
fi
fi

image=$(block/$block/./graphics.sh ${cell}$pic
sidebar
echo "$aux1")
echo "$image"
echo "$aux2"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 $tint
./utils.sh overlay "sidebar $block $cell 0" 56 4 0 $tint
}

vars(){
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
./utils.sh prompt "$last" "$bar" "$output" 4
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[g][e][t][b][o][o][k]) 
get=$(./utils.sh get book14 book $book14)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][e][t][k][e][y])
get=$(./utils.sh get key2 key $key2)
intro=$(sed "1q;d" <<< "$get")
output=$(tail -n 12 <<< "$get") ;;

[g][o][s][o][u][t][h]) sed -i '/cell=/c\cell=06' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i07) ;;

[l][o][o][k][b][o][o][k]) if [ $book14 -ne 2 ]
then
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][d][o][o][r]) output=$(./utils.sh form 1 lookdoor door1 door11 $i06 1) ;;

[l][o][o][k][c][a][b][i][n][e][t]) if [ $key2 -eq 0 ]
then
output=$(./utils.sh form 1 looki null cabinet1 0)
else
output=$(./utils.sh form 1 looki null cabinet2 0)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 looki null floor6 0) ;;

[l][o][o][k][k][e][y]) sidebar
./lib.sh keya key4
if [ $key2 -eq 0 ] ; then output=$(./utils.sh form 1 lookkey i07) ; fi
if [ $key2 -eq 1 ] ; then output=$(./utils.sh form 1 uni get3 key) ; fi ;;

[l][o][o][k][l][i][g][h][t][e][r]) if [ $lighter -eq 1 ]
then
sidebar
./lib.sh lighterg
output=$(./utils.sh form 1 looki null lighter4 0)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][m][i][r][r][o][r]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh form 1 looki null mirror1 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
output=$(./utils.sh form 1 looki null mirror2 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
output=$(./utils.sh form 1 looki null mirror3 0)
fi ;;

[l][o][o][k][t][o][i][l][e][t]) output=$(./utils.sh form 1 looki null toilet1 0) ;;

[l][o][o][k][t][u][b]) output=$(./utils.sh form 1 looki null tub1 0 tub2 $book14) ;;

[l][o][o][k][w][a][l][l]) output=$(./utils.sh form 1 looki null wall1 0) ;;

[r][e][a][d][b][o][o][k]) if [ $book14 -ne 2 ]
then
./utils.sh reader book14r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[s][m][a][s][h][m][i][r][r][o][r]) if [ $hammer -eq 1 ]
then
if [ $i7mirror -eq 0 ]
then
./utils.sh score 2
sidebar
sed -i '/i7mirror=/c\i7mirror=1' status
intro=1
output=$(./utils.sh form 1 uni smashmin1)
else
output=$(./utils.sh form 1 uni smashmir1)
fi
else
output=$(./utils.sh form 1 uni smash)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book14 -ne 2 ]
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][c][a][b][i][n][e][t]) output=$(./utils.sh form 1 lick cabinet1) ;;

[l][i][c][k][d][o][o][r]) output=$(./utils.sh form 1 lick cabinet1) ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor1) ;;

[l][i][c][k][k][e][y]) if [ $key2 -ne 2 ]
then
output=$(./utils.sh form 1 uni lickkey)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][l][i][g][h][t][e][r])if [ $lighter -eq 1 ]
then
output=$(./utils.sh form 1 lick light2)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][m][i][r][r][o][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh form 1 lick mirror1)
else
output=$(./utils.sh form 1 lick mirror2)
fi ;;

[l][i][c][k][t][o][i][l][e][t]) if [ $licktoilet -eq 2 ]
then
./utils.sh score -200
sidebar
./utils.sh cutscene i toiletlick3 Death "graphpass i 07pic1a 2 2 0"
./utils.sh setdeath
break
fi
if [ $licktoilet -eq 1 ]
then
output=$(./utils.sh form 1 lick toilet2)
sed -i '/licktoilet=/c\licktoilet=2' status
fi
if [ $licktoilet -eq 0 ]
then
output=$(./utils.sh form 1 lick toilet1)
sed -i '/licktoilet=/c\licktoilet=1' status
fi ;;

[l][i][c][k][t][u][b]) output=$(./utils.sh form 1 lick tub1) ;;

[l][i][c][k][w][a][l][l]) output=$(./utils.sh form 1 lick wall1) ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i07) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book14 -ne 2 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][c][a][b][i][n][e][t]) output=$(./utils.sh form 1 smell cabinet1) ;;

[s][m][e][l][l][d][o][o][r]) output=$(./utils.sh form 1 smell door5) ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floor2) ;;

[s][m][e][l][l][k][e][y]) if [ $key2 -ne 2 ]
then
output=$(./utils.sh form 1 uni smellkey)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][l][i][g][h][t][e][r]) if [ $lighter -eq 1 ]
then
output=$(./utils.sh form 1 smell lighter)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][m][i][r][r][o][r]) output=$(./utils.sh form 1 smell mirror1) ;;

[s][m][e][l][l][t][o][i][l][e][t]) output=$(./utils.sh form 1 smell toilet1) ;;

[s][m][e][l][l][t][u][b]) output=$(./utils.sh form 1 smell tub1) ;;

[s][m][e][l][l][w][a][l][l]) output=$(./utils.sh form 1 smell wall1) ;;

*) case1=(system${case1}) ;;

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
./utils.sh score 2
sidebar
sed -i '/lighter=/c\lighter=1' status
intro=1
output=$(./utils.sh form 1 looki null lighter1 0)
else
output=$(./utils.sh form 1 looki null lighter2 0)
fi 
else
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form 1 uni get1)
fi ;;

[l][o][o][k]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh form 1 looki null mirror1 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
output=$(./utils.sh form 1 looki null mirror2 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
output=$(./utils.sh form 1 looki null mirror3 0)
fi ;;


[l][o][o][k][l][i][g][h][t][e][r]) if [ $i7mirror -eq 0 ]
then
sidebar
./lib.sh lighterg
output=$(./utils.sh form 1 uni look)
else
if [ $lighter -ne 2 ]
then
output=$(./utils.sh form 1 looki null lighter4 0)
else
output=$(./utils.sh form 1 uni look)
fi
fi ;;

[l][o][o][k][m][i][r][r][o][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh form 1 looki null mirror1 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 0 ]
then
output=$(./utils.sh form 1 looki null mirror2 0)
fi
if [ $i7mirror -eq 1 ] && [ $lighter -eq 1 ]
then
output=$(./utils.sh form 1 looki null mirror3 0)
fi ;;

[s][m][a][s][h][m][i][r][r][o][r]) if [ $hammer -eq 1 ]
then
if [ $i7mirror -eq 0 ]
then
./utils.sh score 2
sidebar
sed -i '/i7mirror=/c\i7mirror=1' status
intro=1
output=$(./utils.sh form 1 uni smashmin1)
else
output=$(./utils.sh form 1 uni smashmir1)
fi
else
output=$(./utils.sh form 1 uni smash)
fi ;;

#olfactory

[l][i][c][k][l][i][g][h][t][e][r]) if [ $i7mirror -eq 1 ] && [ $lighter -ne 2 ]
then
output=$(./utils.sh form 1 lick light2)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][m][i][r][r][o][r]) if [ $i7mirror -eq 0 ]
then
output=$(./utils.sh form 1 lick mirror1)
else
output=$(./utils.sh form 1 lick mirror2)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell mirror1) ;;

[s][m][e][l][l][l][i][g][h][t][e][r]) if [ $i7mirror -eq 1 ] && [ $lighter -ne 2 ]
then
output=$(./utils.sh form 1 smell lighter)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][m][i][r][r][o][r]) output=$(./utils.sh form 1 smell mirror1) ;;

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

