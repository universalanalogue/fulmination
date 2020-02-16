#!/bin/bash

function background() {

if [ $focus -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic1
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0)
echo "$image"
fi

if [ $focus -eq 1 ]
then
if [ $mellon -eq 0 ]
then
image=$(block/$block/./graphics.sh ${cell}pic2a)
else
image=$(block/$block/./graphics.sh ${cell}pic2b)
fi
echo "$image"
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay "sidebar $block $cell 0" 56 4 0
fi
}

function vars() {

#inventory
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
book111=$(grep 'book111=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

#variables
block=$(grep 'block=' status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
e18=$(grep 'e18=' status | cut -d "=" -f2)
e21=$(grep 'e21=' status | cut -d "=" -f2)
e23=$(grep 'e23=' status | cut -d "=" -f2)
e29=$(grep 'e29=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
riddle=$(grep 'riddle=' status | cut -d "=" -f2)
wolflick=$(grep 'wolflick=' status | cut -d "=" -f2)
}
helpcount=0
intro=0
focus=0
sed -i '/focus=/c\focus=0' status
mellon=0

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

[g][o][e][a][s][t]) if [ $mellon -eq 1 ]
then
./utils.sh cutscene "greyrootmisc slump" Go "graphpass e 22pic2a 1 1"
fi
sed -i '/cella=/c\cella=23' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][n][o][r][t][h]) if [ $mellon -eq 1 ]
then
./utils.sh cutscene "greyrootmisc slump" Go "graphpass e 22pic2a 1 1"
fi
sed -i '/cella=/c\cella=29' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][s][o][u][t][h]) if [ $mellon -eq 1 ]
then
./utils.sh cutscene "greyrootmisc slump" Go "graphpass e 22pic2a 1 1"
fi
sed -i '/cella=/c\cella=18' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][w][e][s][t])if [ $mellon -eq 1 ]
then
./utils.sh cutscene "greyrootmisc slump" Go "graphpass e 22pic2a 1 1"
fi
 sed -i '/cell=/c\cell=21' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form elook 22) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form elookdir east $e23 9) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form elookdir north $e29 1) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form elookdir south $e18 1) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form elookdir west $e21 5) ;;

[l][o][o][k][b][o][o][k]) if [ $book111 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh form elooka house west) ;;

[l][o][o][k][t][r][e][e]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $mellon -eq 0 ]
then
output=$(./utils.sh form greyrootmisc tree1)
else
output=$(./utils.sh form greyrootmisc tree2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book111 -eq 1 ]
then
./utils.sh reader book111r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

[s][m][a][s][h][t][r][e][e]) if [ $hammer -eq 1 ]
then 
./utils.sh cutscene smashent Go "graphpass e 22pic2b 1 1"
./utils.sh setdeath
sed -i '/cell=/c\cell=null' status
break
else
output=$(./utils.sh form uni ic)
fi ;;


#olfactory

[l][i][c][k][b][o][o][k]) if [ $book111 -eq 1 ] 
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor) ;;

[l][i][c][k][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form greyrootmisc lick)
else
output=$(./utils.sh form lick tree)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book111 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floore) ;;

[s][m][e][l][l][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form greyrootmisc smell)
else
output=$(./utils.sh form smell treee)
fi ;;

#constantcomm

esac
fi

if [ $focus -eq 1 ]
then
case $case1 in

[f][r][i][e][n][d]) ./utils.sh cutscene "entfriend 1" Mellon "graphpass e 22pic2b 1 1"
mellon=1
if [ $riddle -eq 1 ] || [ $riddle -eq 2 ] || [ $riddle -eq 3 ]
then
./utils.sh cutscene "entfriend 2" Mellon "graphpass e 22pic2b 1 1"
fi
if [ $riddle -eq 0 ]
then
if [ $wolflick -eq 0 ]
then
./utils.sh cutscene "entfriend 3" Mellon "graphpass e 22pic2b 1 1"
fi
if [ $wolflick -eq 1 ]
then
./utils.sh cutscene "entfriend 4" Mellon "graphpass e 22pic2b 1 1"
fi 
sed -i "/riddle=/c\riddle=1" status
vars
./utils.sh cutscene "entfriend 5" Mellon "graphpass e 22pic2b 1 1"
fi
if [ $riddle -eq 1 ]
then 
while true ; do
output=$(./utils.sh form entfriend 6) 
./utils.sh menu "$output" Mellon
read case2
case $case2 in 
[h][o][l][e]) sed -i "/riddle=/c\riddle=2" status
vars
./utils.sh cutscene "greyrootmisc correct" Mellon "graphpass e 22pic2b 1 1"
break ;;
*) ./utils.sh cutscene "greyrootmisc incorrect" Mellon "graphpass e 22pic2b 1 1"
break ;;
esac
done
fi
if [ $riddle -eq 2 ]
then
while true ; do
output=$(./utils.sh form entfriend 7) 
./utils.sh menu "$output" Mellon
read case2
case $case2 in 
[t][i][m][e]) sed -i "/riddle=/c\riddle=3" status
vars
./utils.sh cutscene "greyrootmisc correct" Mellon "graphpass e 22pic2b 1 1"
break ;;
*) ./utils.sh cutscene "greyrootmisc incorrect" Mellon "graphpass e 22pic2b 1 1"
break ;;
esac
done
fi
if [ $riddle -eq 3 ]
then
while true ; do
output=$(./utils.sh form entfriend 8) 
./utils.sh menu "$output" Mellon
read case2
case $case2 in 
[s][e][c][r][e][t]) sed -i "/riddle=/c\riddle=4" status
vars
./utils.sh cutscene "greyrootmisc correct" Mellon "graphpass e 22pic2b 1 1"
break ;;
*) ./utils.sh cutscene "greyrootmisc incorrect" Mellon "graphpass e 22pic2b 1 1"
break ;;
esac
done
fi
if [ $riddle -eq 4 ]
then
sed -i "/riddle=/c\riddle=5" status
sed -i "/book111=/c\book111=1" status
./lib.sh journal1 7
vars
./utils.sh cutscene "entfriend 9" Mellon "graphpass e 22pic2b 1 1"
fi
if [ $riddle -eq 5 ]
then
output=$(./utils.sh form entfriend 10) 
./utils.sh cutscene "entfriend 10" Mellon "graphpass e 22pic2b 1 1"
fi ;;

[l][o][o][k]) if [ $mellon -eq 0 ]
then
output=$(./utils.sh form greyrootmisc tree1)
else
output=$(./utils.sh form greyrootmisc tree2)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book111 -eq 1 ]
then
output=$(./utils.sh form uni book)
else
output=$(./utils.sh form uni look)
fi ;;

[l][o][o][k][t][r][e][e]) if [ $mellon -eq 0 ]
then
output=$(./utils.sh form greyrootmisc tree1)
else
output=$(./utils.sh form greyrootmisc tree2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book111 -eq 1 ]
then
./utils.sh reader book111r
intro=0
else
output=$(./utils.sh form uni read)
fi ;;

[s][m][a][s][h][t][r][e][e]) if [ $hammer -eq 1 ]
then 
./utils.sh cutscene smashent Go "graphpass e 22pic2b 1 1"
./utils.sh setdeath
sed -i '/cell=/c\cell=null' status
break
else
output=$(./utils.sh form uni ic)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book111 -eq 1 ] 
then
output=$(./utils.sh form lick book)
else
output=$(./utils.sh form uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form lick floor) ;;

[l][i][c][k][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form greyrootmisc lick)
else
output=$(./utils.sh form lick tree)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book111 -eq 1 ]
then
output=$(./utils.sh form smell book)
else
output=$(./utils.sh form uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form smell floore) ;;

[s][m][e][l][l][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form greyrootmisc smell)
else
output=$(./utils.sh form smell treee)
fi ;;

#constantcomm

esac
fi


done

