#!/bin/bash
#version=1.08.01

background() {
pic=
if [ $focus -eq 0 ] ; then pic=ext2
aux1=$(./utils.sh overlay tree4 9 8 0 0) ; fi

if [ $focus -eq 1 ]
then
aux1=
if [ $mellon -eq 0 ] ; then pic=${cell}pic2a ; else pic=${cell}pic2b ; fi
fi

image=$(block/$block/./graphics.sh $pic
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

[g][o][e][a][s][t]) if [ $mellon -eq 1 ]
then
./utils.sh cutscene e "greyrootmisc slump" Go "graphpass e 22pic2a 1 1 0"
fi
sed -i '/cella=/c\cella=23' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][n][o][r][t][h]) if [ $mellon -eq 1 ]
then
./utils.sh cutscene e "greyrootmisc slump" Go "graphpass e 22pic2a 1 1 0"
fi
sed -i '/cella=/c\cella=29' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][s][o][u][t][h]) if [ $mellon -eq 1 ]
then
./utils.sh cutscene e "greyrootmisc slump" Go "graphpass e 22pic2a 1 1 0"
fi
sed -i '/cella=/c\cella=18' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[g][o][w][e][s][t])if [ $mellon -eq 1 ]
then
./utils.sh cutscene e "greyrootmisc slump" Go "graphpass e 22pic2a 1 1 0"
fi
sed -i '/cella=/c\cella=21' status
sed -i '/cell=/c\cell=ulc1' status ; break ;;

[l][o][o][k]) output=$(./utils.sh form 1 elook 22) ;;

[l][o][o][k][e][a][s][t]) output=$(./utils.sh form 1 elookdir east $e23 9) ;;

[l][o][o][k][n][o][r][t][h]) output=$(./utils.sh form 1 elookdir north $e29 1) ;;

[l][o][o][k][s][o][u][t][h]) output=$(./utils.sh form 1 elookdir south $e18 1) ;;

[l][o][o][k][w][e][s][t]) output=$(./utils.sh form 1 elookdir west $e21 5) ;;

[l][o][o][k][b][o][o][k]) if [ $book111 -eq 1 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][f][l][o][o][r]) output=$(./utils.sh form 1 elooka floor) ;;

[l][o][o][k][h][o][u][s][e]) output=$(./utils.sh form 1 elooka house west) ;;

[l][o][o][k][t][r][e][e]) sed -i '/focus=/c\focus=1' status
intro=1
if [ $mellon -eq 0 ]
then
output=$(./utils.sh form e greyrootmisc tree1)
else
output=$(./utils.sh form e greyrootmisc tree2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book111 -eq 1 ]
then
./utils.sh reader book111r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[s][m][a][s][h][t][r][e][e]) if [ $hammer -eq 1 ]
then
./utils.sh cutscene e smashent Go "graphpass e 22pic2b 2 2 0"
./utils.sh setdeath
sed -i '/cell=/c\cell=null' status
break
else
output=$(./utils.sh form 1 uni ic)
fi ;;


#olfactory

[l][i][c][k][b][o][o][k]) if [ $book111 -eq 1 ] 
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[l][i][c][k][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form e greyrootmisc lick)
else
output=$(./utils.sh form 1 lick tree)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book111 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

[s][m][e][l][l][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form e greyrootmisc smell)
else
output=$(./utils.sh form 1 smell treee)
fi ;;

*) case1=(system${case1}) ;;

esac
fi

if [ $focus -eq 1 ]
then
case $case1 in

[f][r][i][e][n][d])
./utils.sh cutscene e "entfriend 1" Mellon "graphpass e 22pic2b 1 1 0"
mellon=1

if [[ "$riddle" =~ ^(1|2|3)$ ]] ; then ./utils.sh cutscene e "entfriend 2" Mellon null ; fi


if [ $riddle -eq 0 ]
then
if [ $wolflick -eq 0 ] ; then ./utils.sh cutscene e "entfriend 3" Mellon null ; fi
if [ $wolflick -eq 1 ] ; then ./utils.sh cutscene e "entfriend 4" Mellon null ; fi 

sed -i "/riddle=/c\riddle=1" status
vars
./utils.sh cutscene e "entfriend 5" Mellon null
fi



if [ $riddle -eq 1 ]
then 
while true ; do
output=$(./utils.sh form e entfriend 6) 
./utils.sh menu "$output" Mellon
read case2
case $case2 in 
[h][o][l][e]) sed -i "/riddle=/c\riddle=2" status
vars
./utils.sh cutscene e "greyrootmisc correct" Mellon null
./utils.sh score 2
sidebar
break ;;
[b][a][c][k]) 
./utils.sh cutscene e "greyrootmisc unknown" Mellon null
intro=0
break ;;

*) ./utils.sh cutscene e "greyrootmisc incorrect" Mellon null ;;
esac
done
fi

if [ $riddle -eq 2 ]
then
while true ; do
output=$(./utils.sh form e entfriend 7) 
./utils.sh menu "$output" Mellon
read case2
case $case2 in 
[t][i][m][e]) sed -i "/riddle=/c\riddle=3" status
vars
./utils.sh cutscene e "greyrootmisc correct" Mellon null
./utils.sh score 2
sidebar
break ;;
[b][a][c][k]) 
./utils.sh cutscene e "greyrootmisc unknown" Mellon null
intro=0
break ;;

*) ./utils.sh cutscene e "greyrootmisc incorrect" Mellon null ;;
esac
done
fi

if [ $riddle -eq 3 ]
then
while true ; do
output=$(./utils.sh form e entfriend 8) 
./utils.sh menu "$output" Mellon
read case2
case $case2 in 
[s][e][c][r][e][t]) sed -i "/riddle=/c\riddle=4" status
vars
./utils.sh cutscene e "greyrootmisc correct" Mellon null
./utils.sh score 2
sidebar
break ;;
[b][a][c][k]) 
./utils.sh cutscene e "greyrootmisc unknown" Mellon null
intro=0
break ;;

*) ./utils.sh cutscene e "greyrootmisc incorrect" Mellon null ;;
esac
done
fi
if [ $riddle -eq 4 ]
then
./utils.sh score 10
sidebar
sed -i "/riddle=/c\riddle=5" status
sed -i "/book111=/c\book111=1" status
./lib.sh journal1 7
vars
./utils.sh cutscene e "entfriend 9" Mellon null
fi
if [ $riddle -eq 5 ]
then
output=$(./utils.sh form e entfriend 10) 
./utils.sh cutscene e "entfriend 10" Mellon null
fi
;;

[l][o][o][k]) if [ $mellon -eq 0 ]
then
output=$(./utils.sh form e greyrootmisc tree1)
else
output=$(./utils.sh form e greyrootmisc tree2)
fi ;;

[l][o][o][k][b][o][o][k]) if [ $book111 -eq 1 ]
then
sidebar
./lib.sh bookg
output=$(./utils.sh form 1 uni book)
else
output=$(./utils.sh form 1 uni look)
fi ;;

[l][o][o][k][t][r][e][e]) if [ $mellon -eq 0 ]
then
output=$(./utils.sh form e greyrootmisc tree1)
else
output=$(./utils.sh form e greyrootmisc tree2)
fi ;;

[r][e][a][d][b][o][o][k]) if [ $book111 -eq 1 ]
then
./utils.sh reader book111r
intro=0
else
output=$(./utils.sh form 1 uni read)
fi ;;

[s][m][a][s][h][t][r][e][e]) if [ $hammer -eq 1 ]
then 
./utils.sh cutscene e smashent Go "graphpass e 22pic2b 2 2 0"
./utils.sh setdeath
sed -i '/cell=/c\cell=null' status
break
else
output=$(./utils.sh form 1 uni ic)
fi ;;

#olfactory

[l][i][c][k][b][o][o][k]) if [ $book111 -eq 1 ] 
then
output=$(./utils.sh form 1 lick book)
else
output=$(./utils.sh form 1 uni lick1)
fi ;;

[l][i][c][k][f][l][o][o][r]) output=$(./utils.sh form 1 lick floor) ;;

[l][i][c][k][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form e greyrootmisc lick)
else
output=$(./utils.sh form 1 lick tree)
fi ;;

[s][m][e][l][l]) output=$(./utils.sh form 1 smell e) ;;

[s][m][e][l][l][b][o][o][k]) if [ $book111 -eq 1 ]
then
output=$(./utils.sh form 1 smell book)
else
output=$(./utils.sh form 1 uni smell)
fi ;;

[s][m][e][l][l][f][l][o][o][r]) output=$(./utils.sh form 1 smell floore) ;;

[s][m][e][l][l][t][r][e][e]) if [ $mellon -eq 1 ]
then
output=$(./utils.sh form e greyrootmisc smell)
else
output=$(./utils.sh form 1 smell treee)
fi ;;

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
