#!/bin/bash
echo "color=4" > status
if [[ $(tty) == *"ttyS"* ]] || [[ $(tty) == *"ttyUSB"* ]]
then
delay=.5
sdelay=3
else
sdelay=0
delay=.2
fi
delay2=1

constantcomm=(' [b][a][c][k]) if [ $focus -ne 0 ]\
then\
sed -i "/focus=/c\\focus=0" status\
intro=0\
else\
output=$(./utils.sh form uni back)\
fi ;;\
\
[b][u][r][n][b][o][o][k]) ./utils.sh clear\
if [ $lighter -eq 1 ]\
then\
output=$(./utils.sh form burnbooks4)\
else\
output=$(./utils.sh form uni ic)\
fi ;;\
\
[b][u][r][n][h][o][u][s][e]) if [ $lighter -eq 1 ]\
then\
if [ $block == i ]\
then\
./utils.sh colorset 2\
./utils.sh cutscene burnhouse2 Death frontb\
./utils.sh setdeath\
break\
fi\
if [ $block == e ]\
then\
if [[ "$cell" =~ ^(1|2|3|4|5|8|9|12|13|16|17|20|21|24|25|26|27|28)$ ]]\
then\
./utils.sh cutscene burnhouse2 VICTORY! frontb\
./utils.sh setdeath\
break\
else\
output=$(./utils.sh form uni burn)\
fi\
fi\
else\
output=$(./utils.sh form uni ic)\
fi ;;\
\
[h][e][l][p]) ./utils.sh reader help1\
intro=0 ;;\
\
[i][n][v][e][n][t][o][r][y]) ./utils.sh inventory\
intro=0 ;;\
\
[j][o][u][r][n][a][l]) ./utils.sh journal\
intro=0 ;;\
\
[l][i][c][k][m][e]) output=$(./utils.sh form lickme1) ;;\
\
[l][o][a][d]) output=$(./utils.sh form uni loadfail) ;;\
\
[s][a][v][e]) ./utils.sh save\
intro=0 ;;\
\
[e][x][i][t]) ./utils.sh setdeath\
break ;;\
\
[s][m][e][l][l][m][e]) output=$(./utils.sh form uni smellme) ;;\
\
[w][h][o][a][m][i]) output=$(./utils.sh form uni whoami) ;;\
\
[w][h][o][a][r][e][y][o][u]) output=$(./utils.sh form uni whoareyou) ;;\
\
[b][u][r][n]*) if [ $lighter -eq 1 ]\
then\
burnie=$(( $burnie + 1 ))\
sed -i "/burnie=/c\\burnie=$burnie" status\
output=$(./utils.sh form uni burn)\
else\
output=$(./utils.sh form uni ic)\
fi ;;\
\
[g][e][t]*) greed=$(( $greed + 1 ))\
sed -i "/greed=/c\\greed=$greed" status\
output=$(./utils.sh form uni get1) ;;\
\
[g][o]*) output=$(./utils.sh form uni go) ;;\
\
[l][o][o][k]*) output=$(./utils.sh form uni look) ;;\
\
[l][i][c][k]*) output=$(./utils.sh form uni lick1) ;;\
\
[p][l][a][c][e]*) output=$(./utils.sh form uni place) ;;\
\
[o][p][e][n]*) output=$(./utils.sh form uni open) ;;\
\
[r][e][a][d]*) output=$(./utils.sh form uni read) ;;\
\
[s][i][t]*) output=$(./utils.sh form uni sit) ;;\
\
[s][h][o][o][t]*) if [ $gun -eq 1 ]\
then\
if [ $ammo -gt 0 ]\
then\
output=$(./utils.sh form uni shoot1)\
ammo=$(( $ammo - 1 ))\
sed -i "/ammo=/c\\ammo=$ammo" status\
else\
output=$(./utils.sh form uni shoot2)\
fi\
else\
output=$(./utils.sh form uni ic)\
fi ;;\
\
[s][l][e][e][p]*) output=$(./utils.sh form uni sleep) ;;\
\
[s][m][a][s][h]*) output=$(./utils.sh form uni smash) ;;\
\
[s][m][e][l][l]*) output=$(./utils.sh form uni smell) ;;\
\
[w][i][n][d]*) output=$(./utils.sh form uni wind) ;;\
\
#debug\
[i][d][k][f][a]) inv=$(sed -n "/^#inveta/,/^#invetb/p;/^#invetb/q" status | sed "/#/d" | sed "/^[[:space:]]*$/d" | cut -d "=" -f1)\
for i in $inv ; do sed -i "/$i=/c\\\\$i=1" status ; done\
output=$(./utils.sh form debugfill);;\
\
[d][e][b][u][g][h][e][l][p]) output=$(./utils.sh form debughelp) ;;\
\
[d][e][b][u][g][r][e][l][o][a][d]) break ;;\
\
[m][o][v][e]*) debug1=$(sed "s/move//" <<< "$case1")\
debug2=$(cut -d "-" -f1 <<< "$debug1")\
debug3=$(cut -d "-" -f2 <<< "$debug1")\
if [[ $debug2 == e ]] && [[ "$debug3" =~ ^(01|02|03|04|05|06|07|09|10|11|12|14|15|17|18|19|23|24|26|28|29|33|34|35|36|37)$ ]]\
then\
sed -i "/cella=/c\\cella=$debug3" status \
debug3=ulc1\
fi\
if [[ $debug2 == i ]] && [[ "$debug3" =~ ^(33|34|35|36|39|40|42)$ ]]\
then\
sed -i "/cella=/c\\cella=$debug3" status \
debug3=ulc1\
fi\
if [[ -f "block//$debug2//$debug3.sh" ]]\
then\
sed -i "/cell=/c\\cell=$debug3" status\
sed -i "/block=/c\\block=$debug2" status\
break\
else\
output=$(./utils.sh form debugmove)\
fi ;;\
\
[s][t][a][t][e]*) debug1=$(sed "s/state//" <<< "$case1")\
debug2=$(grep "$debug1=" status | cut -d "=" -f2)\
debug3=$(echo "\${!debug1}")\
output=$(./utils.sh form debugstate $debug1 $debug2 $debug3) ;;\
\
[s][e][t][g][l][o][b][a][l]*) debug1=$(sed "s/set//" <<< "$case1")\
debug1=$(sed "s/global//" <<< "$debug1")\
debug2=$(cut -d "=" -f1 <<< "$debug1")\
debug3=$(cut -d "=" -f2 <<< "$debug1")\
sed -i "/$debug2=/c\\\\$debug2=$debug3" status ;;\
\
*) helpcount=$(( $helpcount + 1 ))\
if [ $helpcount -gt 5 ]\
then\
output=$(./utils.sh form uni help2)\
helpcount=0\
else\
output=$(./utils.sh form uni ic)\
fi ;;')

sleep=('sleepnum=$(grep "sleepnum=" status | cut -d "=" -f2)\
sleep=$(grep "sleep=" status | cut -d "=" -f2)\
sleep=$(( "$sleep" - 1 ))\
sed -i "/sleep=/c\\sleep=$sleep" status\
if [ $sleepnum -eq 1 ] ; then sleepthreshold=200 ; fi\
if [ $sleepnum -eq 2 ] ; then sleepthreshold=100 ; fi\
if [ $sleepnum -eq 3 ] ; then sleepthreshold=75 ; fi\
if [ $sleepnum -eq 4 ] ; then sleepthreshold=50 ; fi\
if [ $sleepnum -eq 5 ] ; then sleepthreshold=10 ; fi\
\
sleepthresh50=$(( $sleepthreshold / 2 ))\
sleepthresh20=$(( $sleepthreshold / 5 ))\
sleepthresh10=$(( $sleepthreshold / 10 ))\
if [[ $sleep -eq $sleepthresh50 ]] ; then ./utils.sh cutscene sleepwarn1 Fatigue logo ; fi\
if [[ $sleep -eq $sleepthresh20 ]] ; then ./utils.sh cutscene sleepwarn2 Fatigue logo ; fi\
if [[ $sleep -eq $sleepthresh10 ]] ; then ./utils.sh cutscene sleepwarn3 Fatigue logo ; fi\
if [ $sleep -eq 0 ]\
then\
./utils.sh colorset 2\
./utils.sh cutscene sleepdeath1 Death logo\
./utils.sh setdeath\
exit\
fi\
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)')


bedtime=(' [g][o][b][e][d]) if [ $sleepnum -eq 5 ]\
then\
./utils.sh colorset 2\
./utils.sh cutscene sleep5 Death logo\
./utils.sh setdeath\
break\
fi\
if [ $sleepnum -eq 4 ]\
then\
./utils.sh cutscene sleep4 Sleep logo\
sed -i "/sleepnum=/c\\sleepnum=5" status\
sed -i "/sleep=/c\\sleep=10" status\
sleep=10\
sleepthreshold=10\
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)\
intro=0\
fi\
\
if [ $sleepnum -eq 3 ]\
then\
./utils.sh cutscene sleep3 Sleep logo\
sed -i "/book33=/c\\book33=0" status\
sed -i "/sleepnum=/c\\sleepnum=4" status\
sed -i "/sleep=/c\\sleep=50" status\
sleep=50\
sleepthreshold=50\
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)\
intro=0\
fi\
\
if [ $sleepnum -eq 2 ]\
then\
./utils.sh cutscene sleep2 Sleep logo\
sed -i "/book110=/c\\book110=0" status\
sed -i "/sleepnum=/c\\sleepnum=3" status\
sed -i "/sleep=/c\\sleep=75" status\
sleep=75\
sleepthreshold=75\
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)\
intro=0\
fi\
\
if [ $sleepnum -eq 1 ]\
then\
./utils.sh cutscene sleep1 Sleep logo\
sed -i "/book24=/c\\book24=0" status\
sed -i "/sleepnum=/c\\sleepnum=2" status\
sed -i "/sleep=/c\\sleep=100" status\
sleep=100\
sleepthreshold=100\
bar=$(./utils.sh posbar $sleep $sleepthreshold 20)\
intro=0\
fi ;;')

#total cell count
count1=$(find block/e | grep -v graphics.sh | grep -v blank.sh | sort -n \
 && find block/i | grep -v graphics.sh | grep -v blank.sh | sort -n)
count2=$(echo "$count1" | wc -l)
count3=$((count2 - 2))

./utils.sh clear

output=$(./utils.sh form installer1 1)
image=$(./utils.sh cutscene2 "graphpass i 02pic2b 4 4" Installing "$output"
./utils.sh overlay "blank 3 1" 56 1 0)
echo "$image"
sleep $sdelay
bar2=$(./utils.sh posbar 1 4 20)
printf "\e[25;3H installing module 1\e[28;3H modules installed 0/3\e[29;3H $bar2"

for i in $( find block | grep -v graphics.sh | grep -v blank.sh | grep -v overlay.sh | sort -n ) ; do
if [[ "$i" == "block" ]] ; then i=null ; fi
if [[ "$i" == 'block/e' ]] ; then i=null ; fi
if [[ "$i" == 'block/i' ]]  ; then i=null ; fi
if [[ "$i" != null ]]
then
makebuild=$(grep "#constantcomm" "$i" | wc -m)
if [ $makebuild -gt 1 ]
then
count4=$(grep -n "$i" <<< "$count1" | cut -d ":" -f1)
bar1=$(./utils.sh posbar "$count4" "$count3" 20)
printf "\e[26;3H patching: $i     \e[27;3H $bar1"

sed -i "/#constantcomm/a $constantcomm" $i
sed -i '/#constantcomm/c\#constanta' $i
sleep $delay
fi
fi
done

printf "\e[0;0H"

output=$(./utils.sh form installer1 2)
image=$(./utils.sh cutscene2 "graphpass i 38pic2a 4 4" Installing "$output"
./utils.sh overlay "blank 3 1" 56 1 0)
echo "$image"

sleep $sdelay
bar2=$(./utils.sh posbar 2 4 20)
printf "\e[25;3H installing module 2\e[28;3H modules installed 1/3\e[29;3H $bar2"
for i in $( find block | grep -v graphics.sh | grep -v blank.sh | grep -v overlay.sh | sort -n )  ; do
if [[ "$i" == "block" ]] ; then i=null ; fi
if [[ "$i" == 'block/e' ]] ; then i=null ; fi
if [[ "$i" == 'block/i' ]] ; then i=null ; fi
if [[ "$i" != null ]]
then
makebuild=$(grep "#sleep" "$i" | wc -m)
if [ $makebuild -gt 1 ]
then
count4=$(grep -n "$i" <<< "$count1" | cut -d ":" -f1)
bar1=$(./utils.sh posbar "$count4" "$count3" 20)
printf "\e[26;3H patching: $i     \e[27;3H $bar1" 

sed -i "/#sleep/a $sleep" $i
sed -i '/#sleep/c\#asleep' $i
sleep $delay
fi
fi
done

mod4count=0
printf "\e[0;0H"

output=$(./utils.sh form installer1 3)
image=$(./utils.sh cutscene2 "graphpass i 05pic2b 4 4" Installing "$output"
./utils.sh overlay "blank 3 1" 56 1 0
./utils.sh overlay spec1 16 5 0 )
echo "$image"

sleep $sdelay
bar2=$(./utils.sh posbar 3 4 20)
printf "\e[25;3H installing module 3\e[28;3H modules installed 2/3\e[29;3H $bar2"
for i in $( find block/i | grep -v graphics.sh | grep -v blank.sh | grep -v overlay.sh | sort -n )  ; do
if [[ "$i" == "block" ]] ; then i=null ; fi
if [[ "$i" == 'block/i' ]] ; then i=null ; fi
if [[ "$i" != null ]]
then
makebuild=$(grep "#bedtime" "$i" | wc -m)
if [ $makebuild -gt 1 ]
then
bar1=$(./utils.sh posbar "$mod4count" 6 20)
printf "\e[26;3H patching: $i     \e[27;3H $bar1"

sed -i "/#bedtime/a $bedtime" $i
sed -i '/#bedtime/c\#beddybyboozetimeagain' $i
sleep $delay2
mod4count=$(($mod4count + 1 ))
fi
fi
done

printf "\e[0;0H"
output=$(./utils.sh form installer2)
./utils.sh cutscene2 frontr "Installation Complete!" "$output"



