#!/bin/bash
#version=1.08.01

if [[ $(tty) == *"ttyS"* ]] || [[ $(tty) == *"ttyUSB"* ]]
then
sed -i "/term=/c\term=1" status
fi
if [[ $(tty) == *"pts"* ]]
then
sed -i "/term=/c\term=2" status
fi
if [[ $(tty) == *"tty"* ]] && [[ $(tty) != *"ttyS"* ]]
then
sed -i "/term=/c\term=3" status
fi

./utils.sh colorset 4
./utils.sh clear
output=$(./utils.sh form)
./utils.sh cutscene2 logo "Scriptures of Fulmination" "$output"
if [[ $(tty) == *"ttyS"* ]] || [[ $(tty) == *"ttyUSB"* ]]
then
sleep 3
else
sleep .5
fi

image=$(./lib.sh frontr)
intro=1

while true ;do

last=$(printf '%-36s' "$last")

if [ $intro -eq 1 ]
then
printf "\e[0;0H"
echo "$image"
intro=2
fi
output=$(./utils.sh form openingui)
./utils.sh menu "$output" "Scriptures of Fulmination"
read case1

if [[ $case1 == 1 ]] ; then mode=1 ; fi
if [[ $case1 == 2 ]] ; then case1=1 ; mode=2 ; fi

case $case1 in

[1]) #new game
load=1
if [ $mode -eq 1 ] ; then
cp status.new status
cell=01
cella=01
block=i
sed -i "/cell=/c\cell=01" status
sed -i "/cella=/c\cella=01" status
sed -i "/block=/c\block=i" status
./utils.sh cutscene opening Begining logo
fi

#load game
if [ $mode -eq 2 ] ; then
load1=$(ls | grep ".save.")
a=$(grep "save.1" <<< "$load1") ; b=$(grep "save.2" <<< "$load1")
c=$(grep "save.3" <<< "$load1") ; d=$(grep "save.4" <<< "$load1")
e=$(grep "save.5" <<< "$load1")
while true; do
output=$(./utils.sh form loadsave load $a $b $c $d $e)
./utils.sh menu "$output" "Load"


read case2
case $case2 in
[1]) if [ -f status.save.1 ] ; then load=1 ; break ; fi ;;
[2]) if [ -f status.save.2 ] ; then load=2 ; break ; fi ;;
[3]) if [ -f status.save.3 ] ; then load=3 ; break ; fi ;;
[4]) if [ -f status.save.4 ] ; then load=4 ; break ; fi ;;
[5]) if [ -f status.save.5 ] ; then load=5 ; break ; fi ;;
[c]) load=null ; break ;; 

esac
done
if [ -f status.save.$load ] ; then
cp status.save.$load status
fi

color=$(grep 'color=' status | cut -d "=" -f2)
cell=$(grep 'cell=' status | cut -d "=" -f2)
cella=$(grep 'cella=' status | cut -d :"=" -f2 )
block=$(grep 'block=' status | cut -d "=" -f2)
./utils.sh colorset $color
fi

#running part
if [[ $load != null ]] ; then
while [[ $cell != "null" ]] ; do 
block/$block/./$cell.sh
cell=$(grep 'cell=' status | cut -d "=" -f2)
cella=$(grep 'cella=' status | cut -d "=" -f2)
block=$(grep 'block=' status | cut -d "=" -f2)
done 
fi 
intro=1 ;;

[3]) ./utils.sh reader help1 
intro=1 ;;

[4]) while true ; do
output=$(./utils.sh form options1)
./utils.sh menu "$output" "Options 1"

read case2

case $case2 in

[1]) while true ; do
output=$(./utils.sh form options2)
./utils.sh menu "$output" "Options 2"

read case3
case $case3 in

[1]) sed -i '/mvnt1=/c\mvnt1=0' status
./utils.sh cutscene options3 Options2 frontr ;;

[2]) sed -i '/mvnt1=/c\mvnt1=1' status
./utils.sh cutscene options4 Options2 frontr ;;

[b]) break ;;


esac
done ;;

[b] ) break ;;


esac
done ;;

[5]) ./utils.sh reader readme
intro=1 ;;

[6]) ./utils.sh clear
./lib.sh universalana
intro=1 ;;


[e]) break ;;

[b][u][r][n][t][e][s][t])./utils.sh clear
cp status.new status
sed -i '/block=/c\block=test' status
sed -i '/cell=/c\cell=test' status
for i in $( find block | grep -v graphics.sh | grep -v blank.sh | grep -v overlay.sh | sort -n )  ; do
if [[ "$i" == "block" ]] ; then i=null ; fi
if [[ "$i" == 'block/e' ]] ; then i=null ; fi
if [[ "$i" == 'block/i' ]] ; then i=null ; fi
if [[ "$i" != null ]]
then
read -p "$i"
"$i"
fi
done
read -p "press enter to continue"
./utils.sh clear
intro=1
;;



esac
done
