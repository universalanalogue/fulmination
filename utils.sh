#!/bin/bash

function parser1() {
var1="$1"

var1=$(tr '[:upper:]' '[:lower:]' <<< "$var1")
var1=$(sed 's| a ||g' <<< "$var1")
var1=$(sed 's| an ||g' <<< "$var1")
var1=$(sed 's| at ||g' <<< "$var1")
var1=$(sed 's| in ||g' <<< "$var1")
var1=$(sed 's| on ||g' <<< "$var1")
var1=$(sed 's| out ||g' <<< "$var1")
var1=$(sed 's| the ||g' <<< "$var1")

#prespace removal
if [[ "$var1" == *"apparition"* ]] ; then var1=$(sed 's|apparition|ghost|' <<< "$var1") ; fi
if [[ "$var1" == *"books"* ]] ; then var1=$(sed 's|books|book|' <<< "$var1") ; fi
if [[ "$var1" == *"bullets"* ]] ; then var1=$(sed 's|bullets|ammo|' <<< "$var1") ; fi
if [[ "$var1" == *"check"* ]] ; then var1=$(sed 's|check|look|' <<< "$var1") ; fi
if [[ "$var1" == *"crate"* ]] ; then var1=$(sed 's|crate|box|' <<< "$var1") ; fi
if [[ "$var1" == *"grass"* ]] ; then var1=$(sed 's|grass|floor|' <<< "$var1") ; fi
if [[ "$var1" == *"ground"* ]] ; then var1=$(sed 's|ground|floor|' <<< "$var1") ; fi
if [[ "$var1" == *"oven"* ]] ; then var1=$(sed 's|oven|hob|' <<< "$var1") ; fi
if [[ "$var1" == *"page"* ]] ; then var1=$(sed 's|page|book|' <<< "$var1") ; fi
if [[ "$var1" == *"paper"* ]] ; then var1=$(sed 's|paper|book|' <<< "$var1") ; fi
if [[ "$var1" == *"put"* ]] ; then var1=$(sed 's|put|place|' <<< "$var1") ; fi
if [[ "$var1" == *"self"* ]] ; then var1=$(sed 's|self|me|' <<< "$var1") ; fi
if [[ "$var1" == *"skeleton"* ]] ; then var1=$(sed 's|skeleton|body|' <<< "$var1") ; fi
if [[ "$var1" == *"sniff"* ]] ; then var1=$(sed 's|sniff|smell|' <<< "$var1") ; fi
if [[ "$var1" == *"stove"* ]] ; then var1=$(sed 's|stove|hob|' <<< "$var1") ; fi
if [[ "$var1" == *"take"* ]] ; then var1=$(sed 's|take|get|' <<< "$var1") ; fi
if [[ "$var1" == *"taste"* ]] ; then var1=$(sed 's|taste|lick|' <<< "$var1") ; fi
#removes spaces
var1=$(sed 's| ||g' <<< "$var1")
#post space removal
if [[ "$var1" != *"set"* ]] || [[ "$var1" != *"state"* ]]  || [[ "$var1" != *"debug"* ]]
then
if [[ "$var1" == *"bookshelf"* ]] ; then var1=$(sed 's|bookshelf|bookcase|' <<< "$var1") ; fi
if [[ "$var1" == *"chairleg"* ]] ; then var1=$(sed 's|chairleg|leg|' <<< "$var1") ; fi
if [[ "$var1" == *"clockkey"* ]] ; then var1=$(sed 's|clockkey|key|' <<< "$var1") ; fi
if [[ "$var1" == *"hallway"* ]] ; then var1=$(sed 's|hallway|corridor|' <<< $var1) ; fi
if [[ "$var1" == *"hedgerow"* ]] ; then var1=$(sed 's|hedgerow|hedge|' <<< "$var1") ; fi
if [[ "$var1" == *"idfa"* ]] ; then var1=$(sed 's|idfa|idkfa|' <<< "$var1") ; fi
if [[ "$var1" == *"mellon"* ]] ; then var1=$(sed 's|mellon|friend|' <<< "$var1") ; fi
if [[ "$var1" == *"pickup"* ]] ; then var1=$(sed 's|pickup|get|' <<< "$var1") ; fi
if [[ "$var1" == *"sleepbed"* ]] ; then var1=$(echo "$var1" | sed 's|sleepbed|gobed|') ; fi
fi

#shortcuts

if [ "$var1" == e ] ; then var1=(lookkey) ; fi
if [ "$var1" == f ] ; then var1=(looklock) ; fi
if [ "$var1" == g ] ; then var1=(getbook) ; fi
if [ "$var1" == h ] ; then var1=(help) ; fi
if [ "$var1" == j ] ; then var1=(journal) ; fi
if [ "$var1" == q ] ; then var1=(look) ; fi
if [ "$var1" == r ] ; then var1=(readbook) ; fi
if [ "$var1" == t ] ; then var1=(getkey) ; fi
if [ "$var1" == z ] ; then var1=(inventory) ; fi

if [ $mvnt2 -eq 0 ]
then
if [ "$var1" == w ] ; then var1=(gonorth) ; fi
if [ "$var1" == s ] ; then var1=(gosouth) ; fi
if [ "$var1" == d ] ; then var1=(goeast) ; fi
if [ "$var1" == a ] ; then var1=(gowest) ; fi
fi

if [ $mvnt2 -eq 1 ]
then
if [ "$var1" == w ] ; then var1=(goeast) ; fi
if [ "$var1" == s ] ; then var1=(gowest) ; fi
if [ "$var1" == d ] ; then var1=(gosouth) ; fi
if [ "$var1" == a ] ; then var1=(gonorth) ; fi
fi

if [ $mvnt2 -eq 2 ]
then
if [ "$var1" == w ] ; then var1=(gosouth) ; fi
if [ "$var1" == s ] ; then var1=(gonorth) ; fi
if [ "$var1" == d ] ; then var1=(gowest) ; fi
if [ "$var1" == a ] ; then var1=(goeast) ; fi
fi

if [ $mvnt2 -eq 3 ]
then
if [ "$var1" == w ] ; then var1=(gowest) ; fi
if [ "$var1" == s ] ; then var1=(goeast) ; fi
if [ "$var1" == d ] ; then var1=(gonorth) ; fi
if [ "$var1" == a ] ; then var1=(gosouth) ; fi
fi

if [ -z $var1 ] ; then var1=("You pass this turn") ; fi

echo "$var1"
}

function clear {
printf "\ec"
color=$(grep "color=" status | cut -d "=" -f2)
colorset $color
}

function colorset(){
sed -i "/color=/c\color=${1}" status
#    green            outside        background    text     cursor
if [ $1 -eq 1 ] ; then printf '\e]11;black\a\e[0;32m\e]12;green\a\e[0;0H' ; fi
#      red
if [ $1 -eq 2 ] ; then printf '\e]11;black\a\e[0;31m\e]12;red\a\e[0;0H' ; fi
#      blue
if [ $1 -eq 3 ] ; then printf '\e]11;black\a\e[0;34m\e]12;blue\a\e[0;0H' ; fi
#      gold            main floor
if [ $1 -eq 4 ] ; then printf '\e]11;black\a\e[0;33m\e]12;gold\a\e[0;0H' ; fi
#     white
if [ $1 -eq 5 ] ; then printf '\e]11;black\a\e[0;37m\e]12;white\a\e[0;0H' ; fi
#     grey
if [ $1 -eq 6 ] ; then printf '\e]11;black\a\e[1;30m\e]12;grey\a\e[0;0H' ; fi
#                      basement
if [ $1 -eq 7 ] ; then printf '\e]11;grey\a\e[1;35m\e]12;magenta\a\e[0;0H' ; fi
#                       shed
if [ $1 -eq 8 ] ; then printf '\e]11;grey\a\e[1;34m\e]12;darkcyan\a\e[0;0H' ; fi
#
if [ $1 -eq 9 ] ; then printf '\e]11;grey\a\e[1;31m\e]12;red\a\e[0;0H' ; fi
}

function posbar() {
# $1 - numerator | $2 - denominator | $3 - size of bar
a=$1 && b=$2 && c=$3
if [ $b -le 0 ] ; then b=1 ; fi
if [ $a -gt $b ] ; then a=$b ; fi
if [ $a -lt 0 ] ; then a=0 ; fi
d=$(((a*c)/b))
e=$((c-d))
posbar=$(printf "[%-${d}s" | tr ' ' '#'
printf "%-${e}s]" | tr ' ' '-')

echo "$posbar" | tr -d '\r'
}

function events(){
greed=$(grep "greed=" status | cut -d "=" -f2)
if [ $greed -ge 50 ]
then
if [[ $block == i ]] ; then g=greed1 ; else g=greed2 ; fi
colorset 2
./utils.sh cutscene greed3 Death $g
setdeath
break
fi

burnie=$(grep "burnie=" status | cut -d "=" -f2)
if [ $burnie -ge 50 ]
then
if [[ $block == i ]] ; then b=burnie1 ; else b=burnie2 ; fi
colorset 2
./utils.sh cutscene burnie3 Death $b
setdeath
break
fi
}

function setdeath(){
./utils.sh colorset 4
sed -i "/cell=/c\cell=null" status
sed -i "/block=/c\block=i" status
sed -i "/focus=/c\focus=0" status
}

function cutscene(){
printf "\e[0;0H"
if [[ $3 != null ]] ; then ./lib.sh $3 ; fi
output=$(form ./lib.sh $1)
printf "\e[23;0H"
a=$(printf '%-70s' "$2")
echo "# $a #
##########################################################################
$output
# Press Enter to continue ################################################
##########################################################################"
printf "\e[37;26H"
read case1
}

function cutscene2(){
printf "\e[0;0H"
./lib.sh $1
printf "\e[23;0H"
a=$(printf '%-70s' "$2")
echo "# $a #
##########################################################################
$3
##########################################################################
##########################################################################"
}

function menu(){
printf "\e[23;0H"
a=$(printf '%-70s' "$2")
echo "# $a #
##########################################################################
$1
# What will you do? :                                                    #
##########################################################################"
printf "\e[37;23H"
}

function prompt(){
last=$(printf '%-36s' "$1")
printf "\e[23;0H"
colorset $4
printf "\e[23;0H"
echo "# Fatigue: $2 # $last #
##########################################################################
$3
# What will you do? :                                                    #
##########################################################################"
printf "\e[37;23H"
}

function overlay(){
#$1 image $2 xaxis start $3 yaxis start $4 transparency
xaxis=$2
yaxis=$3

var1=$(./block/./overlay.sh $1 | sed 's|\\|\\\\|g')

var1=$(awk 1 ORS='nwlne' <<< "$var1" | sed 's/nwlne/\\e[#layer;#xaxisH/g')
var1=$(sed "s/#xaxis/$xaxis/g" <<< "$var1")
mat=$(grep -o '#layer' <<< "$var1" | wc -l )

var1=$(awk -v yaxis="$yaxis" -v v=1 -v mat="$mat" '{while( v < mat)if($x~/#layer/){sub(/#layer/,v++ + yaxis)}}1' <<< "$var1")

if [ $4 -eq 1 ] ; then var1=$(sed 's/ /\\e[1C/g' <<< "$var1") ; fi

if [[ "$var1" == *"#layer"* ]]
then
var1=$(sed "s/\[#layer;${xaxis}H//" <<< "$var1" | sed 's/\(.*\)\\e/\1/')
fi

printf "\e[${yaxis};${xaxis}H${var1}"
}

function overlayold(){
#$1 image $2 xaxis start $3 yaxis start $4 transparency
xaxis=$2
yaxis=$3

var1=$(./block/./overlay.sh $1 | sed 's|\\|\\\\|g')

var1=$(awk 1 ORS='nwlne' <<< "$var1" | sed 's/nwlne/\\e[#layer;#xaxisH/g')
var1=$(sed "s/#xaxis/$xaxis/g" <<< "$var1")
match=$(grep -o '#layer' <<< "$var1" | wc -l )
match=$((match+yaxis))
count=$yaxis
while [ $count -ne $match ] ; do count=$((count+1)) ; var1=$(sed "s/#layer/$count/" <<< "$var1") ; done

if [ $4 -eq 1 ] ; then var1=$(sed 's/ /\\e[1C/g' <<< "$var1") ; fi

if [[ "$var1" == *"#layer"* ]]
then
var1=$(sed "s/\[#layer;${xaxis}H//" <<< "$var1" | sed 's/\(.*\)\\e/\1/')
fi

printf "\e[${yaxis};${xaxis}H${var1}"
}

function save() {
while true ; do
save1=$(ls | grep ".save")
a=$(grep .save.1 <<< "$save1")
b=$(grep .save.2 <<< "$save1")
c=$(grep .save.3 <<< "$save1")
d=$(grep .save.4 <<< "$save1")
e=$(grep .save.5 <<< "$save1")
output=$(./utils.sh form loadsave save $a $b $c $d $e)
./utils.sh menu "$output" Save
read case1

case $case1 in
[1]) cp status status.save.1 ; break ;;
[2]) cp status status.save.2 ; break ;;
[3]) cp status status.save.3 ; break ;;
[4]) cp status status.save.4 ; break ;;
[5]) cp status status.save.5 ; break ;;
[c]) break ;;
esac
done
}

function form() {
text=$(./lib.sh "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}")
total=11
count=1
form=$(while [ $count -le $total ] ; do
a1=$(printf '%-70s' "$(sed "${count}q;d" <<< "$text")")
printf "# $a1 #\n"
count=$((count+1))
done)
bar1=$(printf "%-74s" | tr ' ' "#")
echo "$form
$bar1"
}

function reader () {
text=$(./lib.sh $1 | sed "1d")
givenname=$(./lib.sh $1 | sed '1q;d')
givenname=$(printf '%-71s' "$givenname")
fill=$(printf '%-54s')
while true ; do
printf "\e[0;0H"
page5=$(wc -l <<< "$text")
page2=$(wc -w <<< "$page1")
if [ $page2 -eq 0 ] ; then page1=1 ; fi
total=28
count=1
page3=$((page1 * total))
page6=$(head -n $page3 <<< "$text" | tail -n "$total")
form=$(while [ $count -le $total ] ; do
a1=$(printf '%-70s' "$(sed "${count}q;d" <<< "$page6")")
printf "# $a1 # \n"
count=$((count+1))
done)
page1p=$(printf '%-2s' "$page1")
page5p=$(printf '%-2s' $(((page5 / total)+1)))

echo "##########################################################################
# $givenname#
##########################################################################
$form
##########################################################################
# page: $page1p / $page5p  # $fill#
##########################################################################
# Commands: n) next page # p) previous page # d) done reading            #
##########################################################################
# :                                                                      #
##########################################################################" 
printf "\e[37;5H" 
read case1
case $case1 in

[n]) if [ $page1 -lt "$page5p" ] ; then page1=$((page1 + 1)) ; fi ;;
[p]) if [ $page1 -ne 1 ] ; then page1=$(($page1 -1)) ; fi ;;
[d]) break ;;

esac
done
}

function inventory () {
inv=$(sed -n '/^#inveta/,/^#invetb/p;/^#invetb/q' status | sed '/#/d' | sed '/^[[:space:]]*$/d')
ammo=$(grep "ammo=" status | cut -d "=" -f2)

if [ $ammo -gt 0 ] ; then inventory=ammo ; else inventory= ; fi

for i in $inv ; do
ivara1=$(cut -d "=" -f1 <<< "$i")
ivarb1=$(cut -d "=" -f2 <<< "$i")

if [ $ivarb1 -eq 1 ]
then
inventory=("$inventory
$ivara1")
fi
done
inventory=$(sed '/^[[:space:]]*$/d' <<< "$inventory")
./utils.sh clear
intro1=1
intro2=1
while true ; do

page5=$(wc -l <<< "$inventory")
page2=$(wc -w <<< "$page1")
if [ $page2 -eq 0 ] ; then page1=1 ; fi

page3=$(($page1 * 11))
page6=$(sed '/^$/d' <<< "$inventory" | head -n $page3 | tail -n 11)
a1=$(sed '1q;d' <<< "$page6") && a1=$(printf '%-70s' "$a1")
b1=$(sed '2q;d' <<< "$page6") && b1=$(printf '%-70s' "$b1")
c1=$(sed '3q;d' <<< "$page6") && c1=$(printf '%-70s' "$c1")
d1=$(sed '4q;d' <<< "$page6") && d1=$(printf '%-70s' "$d1")
e1=$(sed '5q;d' <<< "$page6") && e1=$(printf '%-70s' "$e1")
f1=$(sed '6q;d' <<< "$page6") && f1=$(printf '%-70s' "$f1")
g1=$(sed '7q;d' <<< "$page6") && g1=$(printf '%-70s' "$g1")
h1=$(sed '8q;d' <<< "$page6") && h1=$(printf '%-70s' "$h1")
i1=$(sed '9q;d' <<< "$page6") && i1=$(printf '%-70s' "$i1")
j1=$(sed '10q;d' <<< "$page6") && j1=$(printf '%-70s' "$j1")
k1=$(sed '11q;d' <<< "$page6") && k1=$(printf '%-70s' "$k1")
page1p=$(printf '%-2s' "$page1")
page5p=$(((page5 / 11) + 1))
page5p=$(printf '%-2s' "$page5p") 

menu=("a
b
c
d
e
f
g
h
i
j
k")

for i in $menu ; do
prime1="${i}1"
prime1a=$(echo "${!prime1}") 

if [[ ! -z ${prime1a} ]]
then
status=$(./lib.sh $prime1a)
givenname=$(grep 'givenname=' <<< "$status" | cut -d "=" -f2)
declare "${i}2=$(printf '%-66s' "$givenname")"
else
declare "${i}2=printf '%-66s'"
fi
done
if [ $intro1 -eq 1 ]
then
intro1=$(( $intro1 + 1 ))
./lib.sh empty
fi
if [ $intro2 -eq 1 ]
then
intro2=$((intro2+1))
printf "\e[23;0H"
echo "# 1) $a2  #
# 2) $b2  #
# 3) $c2  #
# 4) $d2  #
# 5) $e2  #
# 6) $f2  #
# 7) $g2  #
# 8) $h2  #
# 9) $i2  #
# 10) $j2 #
# 11) $k2 #
##########################################################################
# page: ${page1p}/ ${page5p}Commands: n) next page # p) previous page # e) exit        #
##########################################################################
# :                                                                      #
##########################################################################" 
fi
printf "\e[37;5H" ; echo '        ' ; printf "\e[37;5H"
read input


num='^[0-9]+$'

if ! [[ $input =~ $num ]] ; then case1=0 ; else case1=$input ; fi

if [ $case1 -ge 1 -a $case1 -le 15 ]
then
case2=run
lett="a
b
c
d
e
f
g
h
i
j
k"
input=$(sed "${input}q;d" <<< "$lett")
input=$(echo "${input}1")
input=$(echo "${!input}")
else
case2="$input"
fi

case $case2 in

[r][u][n]) status=$(./lib.sh "$input")
if [ -z "$status" ]
then
look=()
graphics=null
read=null
exists=null
else
read=$(grep 'read=' <<< "$status" | cut -d "=" -f2)
graphics=$(grep 'graphics=' <<< "$status" | cut -d "=" -f2)
givenname=$(grep 'givenname=' <<< "$status" | cut -d "=" -f2)
exists=$(grep 'exists=' <<< "$status" | cut -d "=" -f2)
look=$(echo "$status" | sed -n '/^#looka/,/^#lookb/p;/^#lookb/q' | sed '/#/d' | sed '/^[[:space:]]*$/d')
fi
if [[ $exists != null ]]
then
printf "\e[0;0H"
./lib.sh empty
if [[ $graphics != null ]] ; then ./lib.sh $graphics ; fi
printf "\e[2;2H $givenname \e[3;2H $look"
if [[ $read != null ]]
then
while true; do 
printf  "\e[4;2H Would you like to read the book [y]/[n] : " 
printf "\e[37;5H" ; echo '        ' ; printf "\e[37;5H"
read -n 1 case3
case $case3 in
[y]) ./utils.sh clear
reader $read 
./utils.sh clear
intro1=1
intro2=1
break ;;
[n]) printf "\e[5;2H Book not read"
printf "\e[37;5H" ; echo '        ' ; printf "\e[37;5H" ; break ;;
esac
done 
fi 
fi ;;

[n]) if [ $page3 -le $page5 ]
then
page1=$((page1 + 1)) 
intro2=1
fi ;;
[p]) if [ $page1 -ne 1 ]
then
page1=$(($page1 -1))
intro2=1
fi  ;;
[e]) ./utils.sh clear 
break ;;

esac
done
}

function journal () {
fill=$(printf '%-54s')
./utils.sh clear
while true ; do 
text=$(sed -n '/^#journala/,/^#journalb/p;/^#journalb/q' status | sed '/#/d')
page5=$(wc -l <<< "$text")
page2=$(wc -w <<< "$page1")
if [ $page2 -eq 0 ] ; then page1=1 ; fi
total=28
count=1
page3=$((page1 * total))
page6=$(echo "$text" | head -n $page3 | tail -n $total)
form=$(while [ $count -le $total ] ; do
a1=$(printf '%-70s' "$(sed "${count}q;d" <<< "$page6")")
printf "# $a1 # \n"
count=$((count+1))
done)
page1p=$(printf '%-2s' "$page1")
page5p=$(printf '%-2s' $(((page5 / total)+1)))

lineremove=$((linep + (total * page1p)))

echo "##########################################################################
# Journal                                                                #
##########################################################################
$form
##########################################################################
# page: $page1p / $page5p  # $fill#
##########################################################################
# Commands: n) next page # p) previous page # d) Done Writing h) Help    #
##########################################################################
# :                                                                      #
##########################################################################"
printf "\e[37;5H" 
read -n 69 -e case1
if ! [[ "$case1" =~ ^(n|p|d|h| |)$ ]]
then
sed -i "/^#journalb/i $case1" status
fi
case $case1 in

[n]) if [ $page1 -lt "$page5p" ] ; then page1=$((page1 + 1)) ; fi
./utils.sh clear ;;
[p]) if [ $page1 -ne 1 ] ; then page1=$(($page1 -1)) ; fi 
./utils.sh clear ;;
[h]) ui null " " Journal journalhelp 4 2
./utils.sh clear ;;
[d]) break ;;
*) ./utils.sh clear ;;

esac
done
}


function music(){


if [[ $1 == 1 ]]
then
sed -i '/music1=/c\music1=01.ogg' status
music1=$(grep "music1=" status | cut -d "=" -f2)
mocp -v 75 -o r -l $music1

fi

if [[ $1 == 2 ]]
then
music1=$(grep "music1=" status | cut -d "=" -f2)
sed -i '/music2=/c\music2=$music1' status
mupos=$(mocp -i | grep CurrentTime | cut -d " " -f2)
sed -i '/mupos=/c\mupos=$mupos' status
mocp -v 60
sleep .2
mocp -v 50
sleep .2
mocp -v 40
sleep .2
mocp -v 30
sleep .2
mocp -v 20
sleep .2
mocp -v 10
sleep .2
mocp -v 0
sleep .2
mocp -s

sed -i '/music1=/c\music1=02.ogg' status
music1=$(grep "music1=" status | cut -d "=" -f2)
mocp -v 75 -o r -l $music1
fi

if [[ $1 == 3 ]]
then
mocp -s
fi


}


mvnt2=$(grep "mvnt2=" status | cut -d "=" -f2 )

"$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}" "${12}"

