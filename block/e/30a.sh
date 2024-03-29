#!/bin/bash
#version=1.08.01

background() {

aux1=$(if [ $wolf -eq 1 ] ; then ./utils.sh overlay wolf2 15 10 1 2 ;fi
if [ $wolf -eq 2 ] ; then ./utils.sh overlay wolf1 9 8 1 2 ; fi)
image=$(block/$block/./graphics.sh 30pic1
sidebar
echo "$aux1")
echo "$image"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0 0
}

vars() {
#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
key8=$(grep 'key8=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e23=$(grep 'e23=' status | cut -d "=" -f2)
e29=$(grep 'e29=' status | cut -d "=" -f2)
e37=$(grep 'e37=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
wolf=$(grep 'wolf=' status | cut -d "=" -f2)
}
helpcount=0
intro=0

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

case $case1 in

#room commands

[g][o][n][o][r][t][h]) ./utils.sh colorset 2
./utils.sh cutscene e "wolf1 1" Death logo
./utils.sh setdeath ; break ;;

[g][o][s][o][u][t][h]) ./utils.sh colorset 2
./utils.sh cutscene e "wolf1 2" Death logo
./utils.sh setdeath ; break ;;


[g][o][w][e][s][t]) ./utils.sh colorset 2
./utils.sh cutscene e "wolf1 3" Death logo
./utils.sh setdeath ; break ;;

[g][o][s][h][e][d]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 4" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni doorlock)
fi ;;

[g][o][d][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 4" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni doorlock)
fi ;;

[l][o][o][k]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 5" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elook 30 wolf $wolf) 
fi ;;

[l][o][o][k][d][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 6" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elooka door3)
fi ;;

[l][o][o][k][e][a][s][t]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 7" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elookdir east 1 9) ; fi ;;

[l][o][o][k][n][o][r][t][h]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 8" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elookdir north $e37 3) ; fi ;;

[l][o][o][k][s][o][u][t][h]) ./utils.sh clear
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 9" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elookdir south $e23 1) ; fi ;;

[l][o][o][k][w][e][s][t]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 10" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elookdir $e29 1) ; fi ;;

[l][o][o][k][f][l][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 11" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elooka floor) ; fi ;;

[l][o][o][k][f][o][r][e][s][t]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 12" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elooka forest)
fi ;;

[l][o][o][k][h][o][u][s][e]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 13" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
./utils.sh cutscene e "elooka house southwest" "Look House" back
intro=1
fi ;;

[l][o][o][k][s][h][e][d]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 14" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elooka shed1)
fi ;;

[l][o][o][k][w][o][l][f]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 15" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 elooka wolf1)
fi ;;

[s][h][o][o][t][w][o][l][f]) if [ $gun -eq 1 ]
then
if [ $ammo -eq 0 ]
then
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 16" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni shoot2)
fi
fi
if [ $ammo -gt 0 ]
then
if [ $wolf -eq 1 ]
then
./utils.sh score 5
sidebar
sed -i "/wolf=/c\wolf=0" status
sed -i "/wolflick=/c\wolflick=0" status
sed -i "/key7=/c\key7=0" status
sed -i "/key6=/c\key6=0" status
sed -i "/key8=/c\key8=0" status
sed -i "/book22=/c\book22=0" status
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\ammo=$ammo" status
./lib.sh journal1 4
intro=1
./utils.sh cutscene e "wolf2 2" "Wolf Defeated" logo
sed -i '/cell=/c\cell=30' status
break
fi
if [ $wolf -eq 2 ]
then
./utils.sh score -2
sidebar
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form e wolf2 3)
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\ammo=$ammo" status
fi
fi
else
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 17" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni ic)
fi
fi ;;
#olfactory

[l][i][c][k][d][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 18" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 lick door3 0)
fi ;;

[l][i][c][k][f][l][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 19" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 lick floor)
fi ;;

[l][i][c][k][f][o][r][e][s][t]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 20" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 lick forest)
fi ;;

[l][i][c][k][s][h][e][d]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 21" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 lick shed)
fi ;;


[l][i][c][k][w][o][l][f]) if [ $wolf -eq 1 ]
then
./utils.sh score 10
sidebar
./utils.sh cutscene e lickwolf1 "Wolf Defeated" null
./utils.sh cutscene e lickwolf2 "Wolf Defeated" null
sed -i "/key7=/c\key7=0" status
sed -i "/key6=/c\key6=0" status
sed -i "/key8=/c\key8=0" status
sed -i "/book22=/c\book22=0" status
sed -i "/wolf=/c\wolf=0" status
sed -i "/wolflick=/c\wolflick=1" status
./lib.sh journal1 5
sed -i "/cell=/c\cell=30" status
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni far)
fi ;;

[s][m][e][l][l][d][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 22" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 smell blank blank blank 0)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 23" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 smell floore)
fi ;;

[s][m][e][l][l][f][o][r][e][s][t]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 24" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 smell foreste)
fi ;;

[s][m][e][l][l][s][h][e][d]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 25" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 smell shede)
fi ;;

[s][m][e][l][l][w][o][l][f]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 26" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni far)
fi ;;

#constants

[h][e][l][p]) ./utils.sh reader help1
intro=0 ;;

[i][n][v][e][n][t][o][r][y]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 27" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 wolf3 1)
fi ;;

[l][i][c][k][m][e]) if [ $lickme -lt 2 ]
then
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 28" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 wolf3 2)
fi
fi ;;

[l][o][a][d]) output=$(./utils.sh form 1 uni loadfail) ;;

[s][a][v][e]) ./utils.sh save
intro=0 ;;

[e][x][i][t]) ./utils.sh setdeath
break ;;

[s][m][e][l][l][m][e]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 29" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni smellme)
fi ;;

[w][h][o][a][m][i]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 30" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni whoami)
fi ;;

[w][h][o][a][r][e][y][o][u]) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 30" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni whoareyou)
fi;;

[g][e][t]*) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 31" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form 1 uni get1)
fi ;;

[g][o]*) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 32" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni go)
fi ;;

[l][o][o][k]*) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 33" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni look)
fi ;;

[l][i][c][k]*) if [ $lickme -lt 2 ]
then
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 34" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni lick1)
fi
fi ;;

[s][h][o][o][t]*) if [ $gun -eq 1 ]
then
if [ $ammo -eq 0 ]
then
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 35" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni shoot2)
fi
fi
if [ $ammo -gt 0 ]
then
if [ $wolf -eq 1 ]
then
./utils.sh score -2
sidebar
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\ammo=$ammo" status
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 36" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni shoot1)
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\ammo=$ammo" status
fi
fi
else
if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 17" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni ic)
fi
fi ;;

[s][m][e][l][l]*) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 36" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni smell)
fi ;;

*) if [ $wolf -eq 1 ]
then
./utils.sh colorset 2
./utils.sh cutscene e "wolf1 17" Death logo
./utils.sh setdeath
break
fi
if [ $wolf -eq 2 ]
then
sed -i "/wolf=/c\wolf=1" status
intro=1
output=$(./utils.sh form 1 uni ic)
helpcount=$(( $helpcount + 1 ))
if [ $helpcount -gt 5 ]
then
output=$(./utils.sh form 1 uni help2)
helpcount=0
fi 
fi ;;

esac
done
