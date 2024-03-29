#!/bin/bash
#version=1.08.02

background() {
aux1= ; aux2= ; pic=
if [ $focus -eq 0 ] ; then comp=1 ; pic=10pic3a ; fi
if [ $focus -eq 1 ] ; then comp=3 ; pic=10pic4a ; fi

image=$(block/$block/./graphics.sh $pic
sidebar)
echo "$image"
}

sidebar(){
./utils.sh overlay "blank 3 1" 56 1 0 0
./utils.sh overlay "sidebar $block $cell $comp" 56 4 0 0
}

vars() {
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
}
helpcount=0
intro=0
sed -i '/focus=/c\focus=0' status

block=$(grep 'block=' status | cut -d "=" -f2)
cell=$(grep 'cell=' status | cut -d "=" -f2)
mvnt1=$(grep "mvnt1=" status | cut -d "=" -f2)
sed -i '/${block}${cell}=/c\\${block}${cell}=1' status
if [ $mvnt1 -eq 0 ]
then
sed -i '/mvnt2=/c\mvnt2=0' status
else
sed -i '/mvnt2=/c\mvnt2=0' status
fi


book11=$(grep 'book11=' status | cut -d "=" -f2)
book12=$(grep 'book12=' status | cut -d "=" -f2)
book13=$(grep 'book13=' status | cut -d "=" -f2)
book14=$(grep 'book14=' status | cut -d "=" -f2)
book15=$(grep 'book15=' status | cut -d "=" -f2)
book16=$(grep 'book16=' status | cut -d "=" -f2)
book17=$(grep 'book17=' status | cut -d "=" -f2)
book18=$(grep 'book18=' status | cut -d "=" -f2)
book19=$(grep 'book19=' status | cut -d "=" -f2)
book110=$(grep 'book110=' status | cut -d "=" -f2)
book111=$(grep 'book111=' status | cut -d "=" -f2)
book112=$(grep 'book112=' status | cut -d "=" -f2)
book113=$(grep 'book113=' status | cut -d "=" -f2)
book21=$(grep 'book21=' status | cut -d "=" -f2)
book22=$(grep 'book22=' status | cut -d "=" -f2)
book23=$(grep 'book23=' status | cut -d "=" -f2)
book24=$(grep 'book24=' status | cut -d "=" -f2)
book25=$(grep 'book25=' status | cut -d "=" -f2)
book26=$(grep 'book26=' status | cut -d "=" -f2)
book27=$(grep 'book27=' status | cut -d "=" -f2)
book28=$(grep 'book28=' status | cut -d "=" -f2)
book31=$(grep 'book31=' status | cut -d "=" -f2)
book32=$(grep 'book32=' status | cut -d "=" -f2)
book33=$(grep 'book33=' status | cut -d "=" -f2)
book34=$(grep 'book34=' status | cut -d "=" -f2)
book35=$(grep 'book35=' status | cut -d "=" -f2)
book36=$(grep 'book36=' status | cut -d "=" -f2)
book37=$(grep 'book37=' status | cut -d "=" -f2)
book38=$(grep 'book38=' status | cut -d "=" -f2)


./utils.sh events
cell=$(grep "cell=" status | cut -d "=" -f2)
if [[ $cell == null ]] ; then exit ; fi
sleep=$(grep "sleep=" status | cut -d "=" -f2)
sleepthreshold=$(grep "sleepthreshold=" status | cut -d "=" -f2)
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)

pendant=$(grep 'pendant=' status | cut -d "=" -f2)
if [ $pendant -eq 1 ]
then
./utils.sh cutscene i "ghost1 pendant" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
exit
fi

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
./utils.sh prompt "$last" "$bar" "$output" 6
read case1
last=("$case1")
case1=$(./utils.sh parser1 "$case1")

if [ $focus -eq 0 ]
then
case $case1 in

#room commands

[b][u][r][n][g][h][o][s][t]) if [ $lighter -eq 1 ]
then
./utils.sh cutscene i "ghost1 burn" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break 
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[g][o][w][e][s][t]) ./utils.sh cutscene i "ghost1 walk" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break ;;

[l][o][o][k]) output=$(./utils.sh form 1 looki i10a) ;;

[l][o][o][k][g][h][o][s][t]) output=$(./utils.sh form i ghost1 look) ;;

[l][o][o][k][f][i][r][e][p][l][a][c][e]) sed -i '/focus=/c\focus=1' status
intro=1
output=$(./utils.sh form 1 looki null fireplace1 0) ;;

[s][h][o][o][t][g][h][o][s][t]) if [ $gun -eq 1 ]
then
if [ $ammo -gt 0 ]
then
./utils.sh score -2
sidebar
./utils.sh cutscene i "ghost1 shoot1" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break
else
./utils.sh cutscene i "ghost1 shoot2" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break
fi 
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[s][m][a][s][h][g][h][o][s][t]) ./utils.sh cutscene i "ghost1 smash" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break ;;

#olfactory

[l][i][c][k][g][h][o][s][t]) ./utils.sh score -800
sidebar
./utils.sh cutscene i "ghost1 lick1" Victory "graphpass i 10pic3a 4 4 1"
./utils.sh cutscene 1 victory Victory front
./utils.sh setdeath
break ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell i10) ;;

[s][m][e][l][l][g][h][o][s][t]) output=$(./utils.sh form 1 ghost1 smell) ;;

[s][h][o][o][t]*) if [ $gun -eq 1 ]
then
if [ $ammo -gt 0 ]
then
./utils.sh score -2
sidebar
output=$(./utils.sh form 1 uni shoot1)
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\\ammo=$ammo" status
else
output=$(./utils.sh form 1 uni shoot2)
fi
else
output=$(./utils.sh form 1 uni ic)
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then
case $case1 in

[l][o][o][k]) output=$(./utils.sh form 1 looki null fireplace8 0) ;;

[b][u][r][n][b][o][o][k]) if [ $lighter -eq 1 ]
then
if [ $book11 -eq 1 ] && [ $book12 -eq 1 ] && [ $book13 -eq 1 ] && [ $book14 -eq 1 ] \
&& [ $book15 -eq 1 ] && [ $book16 -eq 1 ] && [ $book17 -eq 1 ] && [ $book18 -eq 1 ] \
&& [ $book19 -eq 1 ] && [ $book110 -eq 1 ] && [ $book111 -eq 1 ] && [ $book112 -eq 1 ] \
&& [ $book113 -eq 1 ] && [ $book21 -eq 1 ] && [ $book22 -eq 1 ] && [ $book23 -eq 1 ] \
&& [ $book24 -eq 1 ] && [ $book25 -eq 1 ] && [ $book26 -eq 1 ] && [ $book27 -eq 1 ] \
&& [ $book28 -eq 1 ] && [ $book31 -eq 1 ] && [ $book32 -eq 1 ] && [ $book33 -eq 1 ] \
&& [ $book35 -eq 1 ] && [ $book36 -eq 1 ] && [ $book37 -eq 1 ] && [ $book38 -eq 1 ]
then
./utils.sh score 20
sidebar
./utils.sh cutscene i burnbooks3 Victory "graphpass i 10pic3a 4 4 1"
./utils.sh cutscene 1 victory Victory front
./utils.sh setdeath
break
else
./utils.sh cutscene i burnbooks2 Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break
fi
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[s][h][o][o][t]*) if [ $gun -eq 1 ]
then
if [ $ammo -gt 0 ]
then
./utils.sh score -2
sidebar
output=$(./utils.sh form 1 uni shoot1)
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\\ammo=$ammo" status
else
output=$(./utils.sh form 1 uni shoot2)
fi
else
output=$(./utils.sh form 1 uni ic)
fi ;;



*) case1=(system${case1}) ;;
esac
fi

if [[ $case1 == *"system"*  ]]
then
case1=$(sed "s/system//" <<< $case1)
case $case1 in

[b][u][r][n][h][o][u][s][e]) if [ $lighter -eq 1 ]
then
if [ $block == i ]
then
./utils.sh colorset 2
./utils.sh cutscene i burnhouse2 Death frontb
./utils.sh setdeath
break
fi
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[h][e][l][p]) ./utils.sh reader help1
intro=0 ;;

[i][n][v][e][n][t][o][r][y]) ./utils.sh inventory
intro=0 ;;

[l][i][c][k][m][e]) ./utils.sh cutscene i "ghost1 lick2" Death "graphpass i 10pic3a 2 2 1"
./utils.sh setdeath
break ;;

[l][o][a][d]) output=$(./utils.sh form 1 uni loadfail) ;;

[s][a][v][e]) ./utils.sh save
intro=0 ;;

[e][x][i][t]) ./utils.sh setdeath
break ;;

[s][m][e][l][l][m][e]) output=$(./utils.sh form 1 uni smellme) ;;

[w][h][o][a][m][i]) output=$(./utils.sh form 1 uni whoami) ;;

[w][h][o][a][r][e][y][o][u]) output=$(./utils.sh form 1 uni whoareyou) ;;

[b][u][r][n]*) if [ $lighter -eq 1 ]
then
burnie=$(( $burnie + 1 ))
sed -i "/burnie=/c\burnie=$burnie" status
output=$(./utils.sh form 1 uni burn)
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[g][e][t]*) greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form 1 uni get1) ;;

[g][o]*) output=$(./utils.sh form 1 uni go) ;;

[l][o][o][k]*) output=$(./utils.sh form 2 ghost1 look2) ;;

[l][i][c][k]*) output=$(./utils.sh form 2 ghost1 lick3) ;;

[p][l][a][c][e]*) output=$(./utils.sh form 2 uni place) ;;

[o][p][e][n]*) output=$(./utils.sh form 2 uni open) ;;

[r][e][a][d]*) output=$(./utils.sh form 2 uni read) ;;

[s][i][t]*) output=$(./utils.sh form 2 uni sit) ;;

[s][l][e][e][p]*) output=$(./utils.sh form 2 uni sleep) ;;

[s][m][a][s][h]*) output=$(./utils.sh form 2 uni smash) ;;

[s][m][e][l][l]*) output=$(./utils.sh form 2 ghost1 smell2) ;;

[w][i][n][d]*) output=$(./utils.sh form 2 uni wind) ;;

#debug
[i][d][k][f][a]) inv=$(sed -n "/^#inveta/,/^#invetb/p;/^#invetb/q" status | sed "/#/d" | sed "/^[[:space:]]*$/d" | cut -d "=" -f1)
for i in $inv ; do sed -i "/$i=/c\\$i=1" status ; done
output=$(./utils.sh form 1 debugfill);;

[d][e][b][u][g][h][e][l][p]) output=$(./utils.sh form 1 debughelp) ;;

[m][o][v][e]*) debug1=$(echo "$case1" | sed "s/move//")
debug2=$(echo "$debug1" | cut -d "-" -f1)
debug3=$(echo "$debug1" | cut -d "-" -f2)
if [[ -f "block//$debug2//$debug3.sh" ]]
then
sed -i "/cell=/c\cell=$debug3" status
sed -i "/block=/c\block=$debug2" status
break
else
output=$(./utils.sh form 1 debugmove)
fi ;;

[s][t][a][t][e]*) debug1=$(sed "s/state//" <<< "$case1")
debug2=$(grep "$debug1=" status | cut -d "=" -f2)
output=$(./utils.sh form 1 debugstate $debug1 $debug2) ;;

[s][e][t]*) debug1=$(echo "$case1" | sed "s/set//")
debug2=$(echo "$debug1" | cut -d "=" -f1)
debug3=$(echo "$debug1" | cut -d "=" -f2)
sed -i "/$debug2=/c\\$debug2=$debug3" status ;;

*) helpcount=$(( $helpcount + 1 ))
if [ $helpcount -gt 5 ]
then
output=$(./utils.sh form 1 uni help2)
helpcount=0
else
output=$(./utils.sh form 1 uni ic)
fi ;;


esac
fi

done
