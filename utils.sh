#!/bin/bash
#version=1.08.02

parser1() {
var1="$1"

var1=$(tr '[:upper:]' '[:lower:]' <<< "$var1")
var1=$(sed 's| a | |g' <<< "$var1")
var1=$(sed 's| an | |g' <<< "$var1")
var1=$(sed 's| at | |g' <<< "$var1")
var1=$(sed 's| in | |g' <<< "$var1")
var1=$(sed 's| on | |g' <<< "$var1")
var1=$(sed 's| out | |g' <<< "$var1")
var1=$(sed 's| the | |g' <<< "$var1")

#prespace removal
if [[ "$var1" == *"apparition"* ]] ; then var1=$(sed 's|apparition|ghost|' <<< "$var1") ; fi
if [[ "$var1" == *"bookshelf"* ]] ; then var1=$(sed 's|bookshelf|bookcase|' <<< "$var1") ; fi
if [[ "$var1" == *"books"* ]] ; then var1=$(sed 's|books|book|' <<< "$var1") ; fi
if [[ "$var1" == *"bullets"* ]] ; then var1=$(sed 's|bullets|ammo|' <<< "$var1") ; fi
if [[ "$var1" == *"check"* ]] ; then var1=$(sed 's|check|look|' <<< "$var1") ; fi
if [[ "$var1" == *"crate"* ]] ; then var1=$(sed 's|crate|box|' <<< "$var1") ; fi
if [[ "$var1" == *"examine"* ]] ; then var1=$(sed 's|examine|look|' <<< "$var1") ; fi
if [[ "$var1" == *"grass"* ]] ; then var1=$(sed 's|grass|floor|' <<< "$var1") ; fi
if [[ "$var1" == *"ground"* ]] ; then var1=$(sed 's|ground|floor|' <<< "$var1") ; fi
if [[ "$var1" == *"oven"* ]] ; then var1=$(sed 's|oven|hob|' <<< "$var1") ; fi
if [[ "$var1" == *"page"* ]] ; then var1=$(sed 's|page|book|' <<< "$var1") ; fi
if [[ "$var1" == *"paper"* ]] ; then var1=$(sed 's|paper|book|' <<< "$var1") ; fi
if [[ "$var1" == *"put"* ]] ; then var1=$(sed 's|put|place|' <<< "$var1") ; fi
if [[ "$var1" == *"self"* ]] ; then var1=$(sed 's|self|me|' <<< "$var1") ; fi
if [[ "$var1" == *"shrub"* ]] ; then var1=$(sed 's|shrub|bush|' <<< "$var1") ; fi
if [[ "$var1" == *"skeleton"* ]] ; then var1=$(sed 's|skeleton|body|' <<< "$var1") ; fi
if [[ "$var1" == *"sniff"* ]] ; then var1=$(sed 's|sniff|smell|' <<< "$var1") ; fi
if [[ "$var1" == *"stove"* ]] ; then var1=$(sed 's|stove|hob|' <<< "$var1") ; fi
if [[ "$var1" == *"take"* ]] ; then var1=$(sed 's|take|get|' <<< "$var1") ; fi
if [[ "$var1" == *"taste"* ]] ; then var1=$(sed 's|taste|lick|' <<< "$var1") ; fi
#removes spaces
var1=$(sed 's| ||g' <<< "$var1")
#post space removal
if ! [[ "$var1" =~ ^(*"set"*|*"state"*|*"debug"*)$ ]]
#if [[ "$var1" != *"set"* ]] || [[ "$var1" != *"state"* ]]  || [[ "$var1" != *"debug"* ]]
then
if [[ "$var1" == *"bookshelf"* ]] ; then var1=$(sed 's|bookshelf|bookcase|' <<< "$var1") ; fi
if [[ "$var1" == *"chairleg"* ]] ; then var1=$(sed 's|chairleg|leg|' <<< "$var1") ; fi
if [[ "$var1" == *"clockkey"* ]] ; then var1=$(sed 's|clockkey|key|' <<< "$var1") ; fi
if [[ "$var1" == *"flashlight"* ]] ; then var1=$(sed 's|flashlight|light|' <<< "$var1") ; fi
if [[ "$var1" == *"hallway"* ]] ; then var1=$(sed 's|hallway|corridor|' <<< $var1) ; fi
if [[ "$var1" == *"hedgerow"* ]] ; then var1=$(sed 's|hedgerow|hedge|' <<< "$var1") ; fi
if [[ "$var1" == *"idfa"* ]] ; then var1=$(sed 's|idfa|idkfa|' <<< "$var1") ; fi
if [[ "$var1" == *"mellon"* ]] ; then var1=$(sed 's|mellon|friend|' <<< "$var1") ; fi
if [[ "$var1" == *"pickup"* ]] ; then var1=$(sed 's|pickup|get|' <<< "$var1") ; fi
if [[ "$var1" == *"sleepbed"* ]] ; then var1=$(sed 's|sleepbed|gobed|' <<< "$var1" ) ; fi
if [[ "$var1" == *"treeline"* ]] ; then var1=$(sed 's|treeline|forest|' <<< "$var1") ; fi
if [[ "$var1" == *"quit"* ]] ; then var1=$(sed 's|quit|exit|' <<< "$var1") ; fi
fi

#shortcuts

if [ "$var1" == e ] ; then var1=(lookkey) ; fi
if [ "$var1" == f ] ; then var1=(looklock) ; fi
if [ "$var1" == g ] ; then var1=(getbook) ; fi
if [ "$var1" == h ] ; then var1=(help) ; fi
if [ "$var1" == j ] ; then var1=(journal) ; fi
if [ "$var1" == q ] ; then var1=(look) ; fi
if [ "$var1" == ls ] ; then var1=(look) ; fi
if [ "$var1" == r ] ; then var1=(readbook) ; fi
if [ "$var1" == t ] ; then var1=(getkey) ; fi
if [ "$var1" == z ] ; then var1=(inventory) ; fi
if [ "$var1" == ? ] ; then var1=(help) ; fi

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

if [ -z $var1 ] ; then var1=("pass") ; fi

echo "$var1"
}

clear() {
printf "\ec"
color=$(grep "color=" status | cut -d "=" -f2)
colorset $color
}

pause (){
if [ -z ${1+x} ] ; then a=Paused ; else a="$1" ; fi
read -p "$a"
}

colorset(){
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

posbar() {
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

events(){
greed=$(grep "greed=" status | cut -d "=" -f2)
if [ $greed -ge 50 ]
then
if [[ $block == i ]] ; then g=greed1 ; else g=greed2 ; fi
colorset 2
./utils.sh cutscene 1 greed3 Death $g
setdeath
break
fi

burnie=$(grep "burnie=" status | cut -d "=" -f2)
if [ $burnie -ge 50 ]
then
if [[ $block == i ]] ; then b=burnie1 ; else b=burnie2 ; fi
colorset 2
./utils.sh cutscene 1 burnie3 Death $b
setdeath
break
fi

sleep=$(grep "sleep=" status | cut -d "=" -f2)
sleep=$((sleep-1))
sed -i "/sleep=/c\sleep=$sleep" status
sleepthreshold=$(grep "sleepthreshold=" status | cut -d "=" -f2) 
sleepthresh50=$(( $sleepthreshold / 2 ))
sleepthresh20=$(( $sleepthreshold / 5 ))
sleepthresh10=$(( $sleepthreshold / 10 ))
if [[ $sleep -eq $sleepthresh50 ]] ; then ./utils.sh cutscene i sleepwarn1 Fatigue logo ; fi
if [[ $sleep -eq $sleepthresh20 ]] ; then ./utils.sh cutscene i sleepwarn2 Fatigue logo ; fi
if [[ $sleep -eq $sleepthresh10 ]] ; then ./utils.sh cutscene i sleepwarn3 Fatigue logo ; fi
if [ $sleep -eq 0 ]
then
./utils.sh colorset 2
./utils.sh cutscene i sleepdeath1 Death logo
./utils.sh setdeath
fi
}

setdeath(){
./utils.sh colorset 4
sed -i "/cell=/c\cell=null" status
sed -i "/cella=/c\cella=null" status
sed -i "/block=/c\block=i" status
sed -i "/focus=/c\focus=0" status
}

cutscene(){
#1 lib location | 2 lib text | 3 title | 4 graphics , null for none 
printf "\e[0;0H"
bar1=$(printf "%-74s" | tr ' ' "#")
text=(" Press Enter to Continue ")
bar2=$(printf "$bar1\e[73D$text")
if [[ $4 != null ]] ; then ./lib.sh $4 ; fi
output=$(form $1 $2)
printf "\e[23;0H"
a=$(printf '%-70s' "$3")
echo -e "# $a #\n$bar1\n$output\n$bar2\n$bar1"
printf "\e[37;26H"
read case1
}

cutscene2(){
printf "\e[0;0H"
bar1=$(printf "%-74s" | tr ' ' "#")
./lib.sh $1
printf "\e[23;0H"
a=$(printf '%-70s' "$2")
echo -e "# $a #\n$bar1\n$3\n$bar1\n$bar1"
}

menu(){
bar1=$(printf "%-74s" | tr ' ' "#")
var1=$(printf "# What will you do? : %-50s #")
printf "\e[23;0H"
a=$(printf '%-70s' "$2")
echo -e "# $a #\n$bar1\n$1\n$var1\n$bar1"
printf "\e[37;23H"
}

prompt(){
bar1=$(printf "%-74s" | tr ' ' "#")
var1=$(printf "# What will you do? : %-50s #")
last=$(printf '%-36s' "$1")
printf "\e[23;0H"
colorset $4
printf "\e[23;0H"
echo -e "# Fatigue: $2 # $last #\n$bar1\n$3\n$var1\n$bar1"
printf "\e[37;23H"
}

form() {
if [[ $1 == 1 ]] ; then
text=$(./lib.sh "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}")
else
text=$(block/$1/./lib.sh "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}")
fi
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

overlay(){
#$1 image $2 xaxis start $3 yaxis start $4 transparency $5 colorset

xaxis=$2 ; if [ $xaxis -eq 0 ] ; then xaxis=1 ; fi
yaxis=$3 ; if [ $yaxis -eq 0 ] ; then yaxis=1 ; fi
#sets color
if [ $5 -ne 0 ] ; then col=$(grep "color=" status | cut -d "=" -f2) ; colorset $5 ; fi

var1=$(./block/./overlay.sh $1 | sed 's|\\|\\\\|g')

var1=$(awk 1 ORS='nwlne' <<< "$var1" | sed "s/\(.*\)nwlne/\1/ ; s/nwlne/\\\\e[#layer;${xaxis}H/g")
mat=$(($(grep -o '#layer' <<< "$var1" | wc -l)+1))

var1=$(awk -v yaxis="$yaxis" -v v=1 -v mat="$mat" '{while( v < mat)
if($x~/#layer/){sub(/#layer/,v++ + yaxis)}}1' <<< "$var1")

if [ $4 -eq 1 ] ; then var1=$(sed 's/ /\\e[1C/g' <<< "$var1") ; fi

printf "\e[${yaxis};${xaxis}H${var1}"
#resets color
if [ $5 -ne 0 ] ; then colorset $col ; fi
}

save() {
while true ; do
save1=$(ls | grep ".save")
a=$(grep .save.1 <<< "$save1")
b=$(grep .save.2 <<< "$save1")
c=$(grep .save.3 <<< "$save1")
d=$(grep .save.4 <<< "$save1")
e=$(grep .save.5 <<< "$save1")
output=$(./utils.sh form 1 loadsave save $a $b $c $d $e)
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

reader () {
text=$(./lib.sh $1 | sed "1d")
givenname=$(./lib.sh $1 | sed '1q;d')
gap=$((70-$(wc -c <<< "$givenname")))
givenname=$(printf "# $givenname %-${gap}s #")
fill=$(printf '%-54s')
bar1=$(printf "%-74s" | tr ' ' '#')
prompt=$(printf "# : %-69s#")

txtlgth=$(wc -l <<< "$text")
total=28
totpage=$(printf '%-2s' $(((txtlgth / total)+1)))
curpage1=1


while true ; do
printf "\e[0;0H"
count=1
textvis1=$((curpage1 * total))
textvis2=$(head -n $textvis1 <<< "$text" | tail -n "$total")

form=$(while [ $count -le $total ] ; do
a1=$(printf '%-70s' "$(sed "${count}q;d" <<< "$textvis2")")
printf "# $a1 # \n"
count=$((count+1))
done)
curpage2=$(printf '%-2s' "$curpage1")

echo -e "$bar1\n$givenname\n$bar1\n$form\n$bar1
# page: $curpage2 / $totpage  # $fill#
$bar1
# Commands: n) next page # p) previous page # d) done reading            #
$bar1\n$prompt\n$bar1" 
printf "\e[37;5H" 
read case1
case $case1 in

[n]) if [ $curpage1 -lt "$totpage" ] ; then curpage1=$((curpage1 + 1)) ; fi ;;
[p]) if [ $curpage1 -ne 1 ] ; then curpage1=$((curpage1 -1)) ; fi ;;
[d]) break ;;

esac
done
}

inventory () {
num='^[0-9]+$'
lett=$(echo {a..k} | tr " " "\n")
intro1=1
intro2=1
bar1=$(printf "%-74s" | tr ' ' '#')
prompt=$(printf "# : %-69s#")
#select all within the #invet brackets in the status file
#remove comments, remove spaces, remove =0, remove =2, remove ammo=
inv=$(sed -n '/^#inveta/,/^#invetb/p;/^#invetb/q' status | sed '/#/d;/^$/d;/=0/d;/=2/d;/ammo=/d' | cut -d "=" -f1)

ammo=$(grep "ammo=" status | cut -d "=" -f2)
if [ $ammo -gt 0 ] ; then
inventory="ammo
$inv"
else
inventory="$inv"
fi

#remove whitespace in the list
inventory=$(sed '/^[[:space:]]*$/d' <<< "$inventory")
#total length of list
txtlgth=$(wc -l <<< "$inventory")
#total number of visible spots
total=11
#total pages at total visible spots
totpage=$(printf '%-2s' $(((txtlgth / total) + 1)))
#stuff to do with things working
curpage1=1



while true ; do
printf "\e[0;0H"
#clear key graphic
if [ $intro1 -eq 1 ] ; then intro1=2 ; ./lib.sh empty ; fi
#iface stuff
textvis1=$((curpage1 * total))
textvis2=$(sed '/^$/d' <<< "$inventory" | head -n $textvis1 | tail -n $total)
curpage2=$(printf '%-2s' "$curpage1")
count=1

for i in $lett ;do
#sets a1-k1 to the names of the items in the inventory
prime1="${i}1"
printf -v "${i}1" '%s' "$(sed "${count}q;d" <<< "$textvis2")"
prime1a=$(echo "${!prime1}")

if [[ ! -z ${prime1a} ]]
then
#give variable <letter>2 the value of givenname
givenname=$(grep 'givenname=' <<< $(./lib.sh $prime1a) | cut -d "=" -f2)
printf -v "${i}2" '%s' "$(printf '%-66s' "$givenname")"
else
printf -v "${i}2" '%s' "$(printf '%-66s')"
fi
count=$((count+1))
done



if [ $intro2 -eq 1 ]
then
intro2=2
printf "\e[23;0H"
echo -e "# 1) $a2  #
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
$bar1
# page: $curpage2 / $totpage Commands: n) next page # p) previous page # e) exit      #
$bar1\n$prompt\n$bar1" 
fi
printf '\e[37;5H        \e[37;5H'
read input

if ! [[ $input =~ $num ]] ; then case1=0 ; else case1=$input ; fi

if [ $case1 -ge 1 -a $case1 -le 11 ]
then
case2=run
#converts a number to <number value of number>1
input=$(echo "$(sed "${input}q;d" <<< "$lett")1")
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
printf '\e[37;5H        \e[37;5H'
read -n 1 case3
case $case3 in
[y]) ./utils.sh clear
reader $read 
./utils.sh clear
intro1=1
intro2=1
break ;;
[n]) printf "\e[5;2H Book not read"
printf '\e[37;5H        \e[37;5H' ; break ;;
esac
done 
fi 
fi ;;

[n]) if [ $curpage1 -lt "$totpage" ] ; then curpage1=$((curpage1 + 1)) ; intro2=1 ; fi ;;
[p]) if [ $curpage1 -ne 1 ] ; then curpage1=$((curpage1 -1)) ; intro2=1 ; fi ;;
[e]) ./utils.sh clear 
break ;;

esac
done
}

journal () {

fill=$(printf '%-54s')
journal=$(printf "# Journal %-62s #")
bar1=$(printf "%-74s" | tr ' ' '#')
prompt=$(printf "# : %-69s#")
total=28
curpage1=1

while true ; do
printf "\e[0;0H"
count=1
#these three grab the text and then get numbers out of them
#MUST be in this part of the loop due to them being refreshed after each line
text=$(sed -n '/^#journala/,/^#journalb/p;/^#journalb/q' status | sed '/#/d')
txtlgth=$(wc -l <<< "$text")
totpage=$(printf '%-2s' $(((txtlgth / total)+1)))

textvis1=$((curpage1 * total))
textvis2=$(head -n $textvis1 <<< "$text" | tail -n $total)

form=$(while [ $count -le $total ] ; do
a1=$(printf '%-70s' "$(sed "${count}q;d" <<< "$textvis2")")
printf "# $a1 # \n"
count=$((count+1))
done)

echo -e "$bar1\n$journal\n$bar1\n$form\n$bar1
# page: $curpage1 / $totpage  # $fill#
$bar1
# Commands: n) next page # p) previous page # d) Done Writing h) Help    #
$bar1\n$prompt\n$bar1"
printf "\e[37;5H" 
read -n 69 -e case1
if ! [[ "$case1" =~ ^(n|p|d|h| |)$ ]]
then
sed -i "/^#journalb/i $case1" status
fi
case $case1 in

[n]) if [ $curpage1 -lt "$totpage" ] ; then curpage1=$((curpage1 + 1)) ; fi ;;
[p]) if [ $curpage1 -ne 1 ] ; then curpage1=$(($curpage1 -1)) ; fi ;;
[h]) cutscene 1 journalhelp "Journal Help" null ;;
[d]) break ;;


esac
done
}


get(){
item=$1
type=$2
state=$3
intro=2
if [ "$state" -eq 2 ] 
then
greed=$(( $greed + 1 ))
sed -i "/greed=/c\greed=$greed" status
output=$(./utils.sh form 1 uni get1) 
fi
if [ "$state" -eq 0 ]
then
sed -i "/${item}=/c\\${item}=1" status
intro=1
score 2
output=$(./utils.sh form 1 uni get2 $type)
fi
if [ "$state" -eq 1 ]
then
output=$(./utils.sh form 1 uni get3 $type)
fi
echo "$intro"
echo "$output"
}

smash(){
item=$1
hammer=$2
state=$3
intro=2

if [ $hammer -eq 1 ]
then
if [ $state -eq 0 ]
then
sed -i "/$item=/c\\$item=1" status
intro=1
output=$(./utils.sh form 1 uni smashwin1)
else
output=$(./utils.sh form 1 uni smashwin2)
fi
else
output=$(./utils.sh form 1 uni smash)
fi
echo "$intro"
echo "$output"
}

evecom(){
block=$(grep "block=" status | cut -d "=" -f2)
cella=$(grep 'cella=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)

case1="$1"
case $case1 in
[b][u][r][n][h][o][u][s][e]) if [ $lighter -eq 1 ]
then
if [ $block == i ]
then
./utils.sh colorset 2
./utils.sh cutscene i burnhouse1 Death frontb
./utils.sh setdeath
break
fi
if [ $block == e ]
then
if [[ "$cell" =~ ^(08|13|16|20|21|25|27|)$ ]] || [[ "$cella" =~ ^(01|02|03|04|05|09|12|17|24|26|28)$ ]]
then
./utils.sh score 800
./sidebar
./utils.sh cutscene e burnhouse2 VICTORY! frontb
./utils.sh setdeath
break
else
output=$(./utils.sh form 1 uni burn)
fi
fi
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[h][e][l][p]) ./utils.sh reader help1
sed -i "/intro=/c\intro=0" status ;;

[i][n][v][e][n][t][o][r][y]) ./utils.sh inventory
sed -i "/intro=/c\intro=0" status ;;

[j][o][u][r][n][a][l]) ./utils.sh journal
sed -i "/intro=/c\intro=0" status ;;

[s][a][v][e]) ./utils.sh save
sed -i "/intro=/c\intro=0" status ;;

[e][x][i][t]) ./utils.sh setdeath ;;
esac
}

concom(){
ammo=$(grep 'ammo=' status | cut -d "=" -f2)
gun=$(grep 'gun=' status | cut -d "=" -f2)
hammer=$(grep 'hammer=' status | cut -d "=" -f2)
lighter=$(grep 'lighter=' status | cut -d "=" -f2)

block=$(grep "block=" status | cut -d "=" -f2)
burnie=$(grep 'burnie=' status | cut -d "=" -f2)
cell=$(grep "cell=" status | cut -d "=" -f2)
focus=$(grep 'focus=' status | cut -d "=" -f2)
greed=$(grep 'greed=' status | cut -d "=" -f2)
helpc1=$(grep 'helpc1=' status | cut -d "=" -f2)
helpc2=$(grep 'helpc2=' status | cut -d "=" -f2)

output=$(./utils.sh form 1)
case1="$1"
state=1
intro=2
case $case1 in


[b][a][c][k]) if [ $focus -ne 0 ]
then
sed -i "/focus=/c\focus=0" status
intro=0
else
output=$(./utils.sh form 1 uni back)
fi ;;

[b][u][r][n][b][o][o][k])
if [ $lighter -eq 1 ]
then
output=$(./utils.sh form 1 burnbooks4)
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[l][i][c][k][m][e]) output=$(./utils.sh form lickme1) ;;

[l][o][a][d]) output=$(./utils.sh form uni loadfail) ;;

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

[l][o][o][k]*) output=$(./utils.sh form 1 uni look) ;;

[l][i][c][k]*) output=$(./utils.sh form 1 uni lick1) ;;

[p][l][a][c][e]*) output=$(./utils.sh form 1 uni place) ;;

[o][p][e][n]*) output=$(./utils.sh form 1 uni open) ;;

[r][e][a][d]*) output=$(./utils.sh form 1 uni read) ;;

[s][i][t]*) output=$(./utils.sh form 1 uni sit) ;;

[s][h][o][o][t]*) if [ $gun -eq 1 ]
then
if [ $ammo -gt 0 ]
then
./utils.sh score -2
output=$(./utils.sh form 1 uni shoot1)
ammo=$(( $ammo - 1 ))
sed -i "/ammo=/c\ammo=$ammo" status
else
output=$(./utils.sh form 1 uni shoot2)
fi
else
output=$(./utils.sh form 1 uni ic)
fi ;;

[s][l][e][e][p]*) output=$(./utils.sh form 1 uni sleep) ;;

[s][m][a][s][h]*) output=$(./utils.sh form 1 uni smash) ;;

[s][m][e][l][l]*) output=$(./utils.sh form 1 uni smell) ;;

[w][i][n][d]*) output=$(./utils.sh form 1 uni wind) ;;

#debug
[i][d][k][f][a]) inv=$(sed -n "/^#inveta/,/^#invetb/p;/^#invetb/q" status | sed "/#/d" | sed "/^[[:space:]]*$/d" | cut -d "=" -f1)
for i in $inv ; do sed -i "/$i=/c\\$i=1" status ; done
output=$(./utils.sh form 1 debugfill);;

[d][e][b][u][g][h][e][l][p]) output=$(./utils.sh form 1 debughelp) ;;

[d][e][b][u][g][r][e][l][o][a][d]) state=2
output=$(./utils.sh form 1) ;;

[m][o][v][e]*) #move <block> <cell> 
debug1=$(sed "s/move//" <<< "$case1")
debug2=$(cut -d "-" -f1 <<< "$debug1")
debug3=$(cut -d "-" -f2 <<< "$debug1")
if [[ $debug2 == e ]] && [[ "$debug3" =~ ^(01|02|03|04|05|06|07|09|10|11|12|14|15|17|18|19|21|23|24|26|27|28|29|33|34|35|36|37)$ ]]
then
sed -i "/cella=/c\cella=$debug3" status 
debug3=ulc1
fi
if [[ $debug2 == i ]] && [[ "$debug3" =~ ^(13|14|15|16|17|18|20|21|33|34|35|36|39|40|42)$ ]]
then
sed -i "/cella=/c\cella=$debug3" status 
debug3=ulc1
fi
if [[ -f "block/$debug2/$debug3.sh" ]]
then
sed -i "/cell=/c\cell=$debug3" status
sed -i "/block=/c\block=$debug2" status
state=2
else
output=$(./utils.sh form 1 debugmove)
fi ;;

[s][t][a][t][e]*) debug1=$(sed "s/state//" <<< "$case1")
debug2=$(grep "$debug1=" status | cut -d "=" -f2)
output=$(./utils.sh form 1 debugstate $debug1 $debug2) ;;

[s][e][t]*) #set <variable>=<value>
debug1=$(sed "s/set//" <<< "$case1")
debug2=$(cut -d "=" -f1 <<< "$debug1")
debug3=$(cut -d "=" -f2 <<< "$debug1")
sed -i "/$debug2=/c\\$debug2=$debug3" status
output=$(./utils.sh form 1) ;;



[p][a][s][s]) output=$(./utils.sh form 1 uni pass1) ;;

*) helpc1=$((helpc1 + 1))
if [ $helpc2 -gt 0 ] ; then t=20 ; else t=5 ; fi
if [ $helpc1 -gt $t ]
then
output=$(./utils.sh form 1 uni help2)
helpc1=0
helpc2=1
else
output=$(./utils.sh form 1 uni ic)
fi
sed -i "/helpc1=/c\helpc1=$helpc1" status
sed -i "/helpc2=/c\helpc2=$helpc2" status ;;
esac

echo "$state"
echo "$intro"
echo "$output"
}

score(){
score=$(grep "score=" status | cut -d "=" -f2)
score=$((score+$1))
sed -i "/score=/c\score=$score" status
}


mvnt2=$(grep "mvnt2=" status | cut -d "=" -f2 )

"$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}" "${12}"

