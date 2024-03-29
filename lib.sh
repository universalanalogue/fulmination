#!/bin/bash
#version=1.08.01

#graphics---------------------------------------------------------------

logo () {
image=$(empty
./utils.sh overlay logo 20 5 0 0)
echo "$image"
}

empty () {
image=$(./utils.sh overlay "blank 0" 1 1 0 0
./utils.sh overlay "blank 3 0" 56 1 0 0)
echo "$image"
}

graphpass(){
#1 block | 2 cell | 3 color in | 4 color out | 5 dir bit
if [[ $3 != 0 ]] ; then ./utils.sh colorset $3 ; fi
block/$1/./graphics.sh $2
./utils.sh overlay "blank 3 1" 56 1 0 $3
./utils.sh overlay "sidebar $1 $2 $5" 56 4 0 $3

if [[ $4 != 0 ]] ; then ./utils.sh colorset $4 ; fi
}

back () {
image=$(
echo '_______________________________________________________
|                          _                          |
|        _________________|_|____________             |
|       /                     _          \            |
|      /                     | |          \           |
|     /                      | |           \          |
|    /                       | |            \         |
|   /|_______________________|_|____________|\        |
|____|   ___       ___      /   \      ___  |_________|
|    |   | |       | |      |   |      | |  |\  \    W|
|    |   |_|       |_|      |   |      |_|  ||  |  WWW|
|    |                     WWWWW|           ||  |WWWWW|
|    |           ___ __ _WWWWWWWWW          ||  | WWWW|
|    |           || |  |WWWWWWWWWWW         ||  |  WWW|
|    |           || | o| WWWWWWWWW          ||  |   | |
|    |___________||_|__|_||WWWWW|___________||  |   | |
|                           | |              |  |___|_|
|                           | |              |        |
|                           | |              |        |
|                           | |              |        |
|                                            |________|
|_____________________________________________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

front () {
image=$(
echo '_______________________________________________________
|             | |                                     |
|        _____|_|________________________             |
|       /           _                    \            |
|      /           | |                    \           |
|     /            | |                     \          |
|  w /             | |                      \ w  w w  |
|www/|_____________|_|______________________|\wwwwwwww|
|__|_|   ___      /   \      ___       ___  |_|__|_|__|
|/  /|   | |      |   |      | |       | |  |         |
||  ||   |_|      |   |      |_|       |_|  |         |
||  ||            |   |                     | WWWWW   |
||  ||   ___      |   |                ___  WWWWWWWWW |
||  ||   | |      |   |       _        | | WWWWWWWWWWW|
||  ||   |_|      |   |      | |       |_|  WWWWWWWWW |
||  ||____________|___|______|_|____________| WWWWW   |
|\  \________________                          | |    |
| \________________  \                         | |    |
|                  \  \________                | |    |
|                   \______    \               | |    |
|                          \    \                     |
|___________________________|___|_____________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

frontb () {
image=$(
echo '_______________________________________________________
|                                                     |
|                                                     |
|                                                     |
|                                                     |
|                                                     |
|  w  w w  w  w w w w  w  w w  w  w   w  w  w  w  w w |
|wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww|
|__|__|_|__|__|_|_|_|__|__|_|__|__|___|__|__|__|__|_|_|
|/  /                                                 |
||  ||\                                               |
||  ||#\                                   /| WWWWW   |
||  ||##|         _____                   /#WWWWWWWWW |
||  ||##| /|     /|###|\  /\___      ___ /#WWWWWWWWWWW|
||  ||##|/#|____/#|###|#\/###| \____/###\|##WWWWWWWWW |
||  ||############|###|######|_|############| WWWWW   |
|\  \________________                          | |    |
| \________________  \                         | |    |
|                  \  \________                | |    |
|                   \______    \               | |    |
|                          \    \                     |
|___________________________|___|_____________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

frontr() {
image=$(
echo '_______________________________________________________
|  /   /  /  /| |/  / /  /    /   / /   //  /   /    /|
| /   /  /__/_|_/__/_/__/____/___/_/___//  /   /    / |
|/   /  /  /   /  / /| /    /   / /   // \/   /    /  |
|   /  /  /   /  / / |/    /   / /   //  /\  /    /   |
|  /  /  /   /  / /| /    /   / /   //  /  \/    /   /|
| /w /  /   /  / / |/|   /   / /   //  /   /\  w/   / |
|/ww/|_/___/__/_/__/_|__/___/_/___//__/___/_|\w/www/ww|
|__/_|/  _/_ / /  /   \/   / /__ //  / __/  |_/|__/_|/|
|// //   / |/ /  /|   /   / /| |//  /  |/|  |/   /  / |
|/  /|  /|_/ /  / |  /|  / / |_//  /   /_|  /   /  /  |
|| /|| /  / /  /  | / | / /   //  /   /    /| W/WW/  /|
||/ ||/  /_/  /   |/  |/ /   //  /   / ___/ WW/WW/WW/ |
|/  |/  /|/| /    /   / /   //_ /   /  | / WW/WW/WW/WW|
||  /| / /_|/    /|  /|/   //| /   /   |/|  /WW/WW/WW |
|| /||/_/__/____/_|_/_/___//_|/|__/____/___/| /WW/W   |
|\/ \/_/__/____/___/_/   //  /   /    /   /  / |/|    |
|/\_/_/__/____/___/ /\  /   /   /    /   /  /  / |    |
|  / /  /    /   / /  \/___/___/    /   /  /  /| |    |
| / /  /    /   / / \_/___/_  /\   /      /  / | |    |
|     /        /     /   / \    \ /      /  /         |
|___________________________|___|_____________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

side () {
image=$(
echo '_______________________________________________________
|             /                               \       |
|            /                                 \      |
|           /                                   \     |
|          /_____________________________________\    |
|         /|  _____                              |\   |
|          |  |/ \|                              |    |
|          |  |\ /|                              |    |
|          |                                     |    |
|          |                                     |    |
|       www|                             www     |    |
|      wwwww                            wwwww    |    |
|_____wwwwwww__________________________wwwwwww___|____|
|       | |                              | |          |
|    ___| |______________________________| |__________|
|    |,,| |,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,| |,,,,,,,,,,|
|    |,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|    |,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|    |,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|    |,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|____|,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|_____________________________________________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

burnie1() {
image=$(
echo '_______________________________________________________
|         |                                 |         |
|         |                                 |         |
|         |                                 |         |
|         |              ***                |         |
|         |          ******                 |         |
|         |             ********            |         |
|         |        ****0***0***             |         |
|         |          *************          |         |
|         |     *************               |         |
|         |        ****MMMM*****            |         |
|         |______  ***<    >*****___________|         |
|         /      ******WWWW******           \         |
|        /            ***************        \        |
|       /      **************                 \       |
|      /               ************            \      |
|     /          ************                   \     |
|    /               *****************           \    |
|   /         *****************                   \   |
|  /                 ***************               \  |
| /                                                 \ |
|/___________________________________________________\|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

burnie2() {
image=$(
echo '_______________________________________________________
|                                                     |
|                                                     |
|                                                     |
|                          ***                        |
|                      ******                         |
|                         ********                    |
|                    ****0***0***                     |
|______________________*************__________________|
|,,,,,,,,,,,,,,,,,*************,,,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,****MMMM*****,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,***<    >*****,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,******WWWW******,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,,***************,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,**************,,,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,,,************,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,************,,,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,*****************,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,*****************,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,***************,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|_____________________________________________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

greed1() {
image=$(
echo '_______________________________________________________
|         |                                 |         |
|         |                                 |         |
|         |                                 |         |
|         |              ###                |         |
|         |          ######                 |         |
|         |             ########            |         |
|         |        ####0###0###             |         |
|         |          #############          |         |
|         |     #############               |         |
|         |        ####MMMM#####            |         |
|         |______  ###<    >#####___________|         |
|         /      ######WWWW######           \         |
|        /            ###############        \        |
|       /      ##############                 \       |
|      /               ############            \      |
|     /          ############                   \     |
|    /               #################           \    |
|   /         #################                   \   |
|  /                 ###############               \  |
| /                                                 \ |
|/___________________________________________________\|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}

greed2() {
image=$(
echo '_______________________________________________________
|                                                     |
|                                                     |
|                                                     |
|                          ###                        |
|                      ######                         |
|                         ########                    |
|                    ####0###0###                     |
|______________________#############__________________|
|,,,,,,,,,,,,,,,,,#############,,,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,####MMMM#####,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,###<    >#####,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,######WWWW######,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,,###############,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,##############,,,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,,,############,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,############,,,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,#################,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,#################,,,,,,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,###############,,,,,,,,,,,,,,,,|
|,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
|_____________________________________________________|'
./utils.sh overlay "blank 3 1" 56 1 0 0)
echo "$image"
}


#cutscene---------------------------------------------------------------

opening() {
echo "You awake, unsure of self or place.  You seem to
be in an abandoned mansion, sparsely furnished and grungy.
All you have with you is your strong sense of true north,
and your weird ability to judge what a key does.  Outside 
you hear the trailing end of a storm.  You decide to go take a look."
}

installer2() {
echo "Scriptures of Fulmination is now installed!
type ./start.sh to begin!"
}

openingui(){
echo "Main Menu
1) New Game
2) load game
3) help
4) options
5) Readme
6) credits
e) Exit "
}

victory(){
echo "Congratulations, you have survived the whole ordeal!
You have won!"
}

burnie3(){
echo 'As you try to commit another petty arson,
you feel an oppressing heat from behind you.  You look
Behind you and you see a massive inferno who swallows
you up.
You are Dead'
}

greed3(){
echo 'As you grip at the air for possessions
you feel a shadow creep up behind you.  You look behind
you and you see a massive specter who swallows you up
You are Dead'
}



#cellcommands-----------------------------------------------------------

#E----------------------------------------------------------------------

elookdir() {
remainder=
direct=("$1")
view=("$2")
object=("$3")
if [[ $object == 1 ]] ; then object=("lawn") ; fi
if [[ $object == 2 ]] ; then object=("an impenetrable hedgerow") ; fi
if [[ $object == 3 ]] ; then object=("a tree") ; fi
if [[ $object == 4 ]] ; then object=("the house") ; fi
if [[ $object == 5 ]] ; then object=("the door into the house") ; fi
if [[ $object == 6 ]] ; then object=("the forest and the hedgerow") ; fi
if [[ $object == 7 ]] ; then object=("the point where the hedgerow meets the forest") ; fi
if [[ $object == 8 ]] ; then object=("an impenetrable hedgerow with a locked gate") ; fi
if [[ $object == 9 ]] ; then object=("the great forest") ; fi
if [[ $object == 10 ]] ; then object=("a shed") ; fi
if [[ $object == 11 ]] ; then object=("a rock") ; fi
if [[ $object == 12 ]] ; then object=("the gate and driveway") ; fi
if [[ $object == 13 ]] ; then object=("is a tree and the east end chimney") ; fi
if [[ $object == 14 ]] ; then object=("the house and the chimney") ; fi
if [[ $object == 15 ]] ; then object=("the gate and the driveway") ; fi

if [ $view -eq 1 ]
then
remainder=("to the $direct is $object")
fi
echo "you are outside
$remainder"
}

elooka(){

if [[ $1 == bush ]] ; then object=("The bush is well kept.") ; fi
if [[ $1 == bush1 ]] ; then object=("The bush is ratty and poorly trimmed.") ; fi
if [[ $1 == chimney1 ]] ; then object=("It is a masonry chimney.") ; fi
if [[ $1 == chimney2 ]] ; then object=("there is a hole in the chimney.") ; fi
if [[ $1 == drive ]] ; then object=("the driveway is concrete.") ; fi
if [[ $1 == door1 ]] ; then object=("the door is boarded and nailed shut.") ; fi
if [[ $1 == door2 ]] ; then object=("the door is unlocked and leads into the house") ; fi
if [[ $1 == door3 ]] ; then object=("the door is made of a sturdy corrugated steel sheet.") ; fi
if [[ $1 == eyes1 ]] ; then object=("you see a pair of red eyes glaring at you
from the tree line.") ; fi
if [[ $1 == floor ]] ; then object=("the grass is still damp from the rain.") ; fi
if [[ $1 == forest ]] ; then object=("the forest is nearly impenetrable.") ; fi
if [[ $1 == forest1 ]] ; then object=("An impenetrable forest is to the north.") ; fi
if [[ $1 == forest2 ]] ; then object=("As you try to pass between the trees,
an unforseen force prevents you from proceeding."); fi
if [[ $1 == foundation1 ]] ; then object=("There is a small hole in the foundation of the
house.") ; fi
if [[ $1 == gate1 ]] ; then object=("As you try to climb the gate,
the bars become uncofortably hot to the touch and you are
forced to let go.") ; fi
if [[ $1 == hedge ]] ; then object=("The hedgerow is impenetrable.") ; fi
if [[ $1 == hedge2 ]] ; then object=("the hedgerow is impenetrable,
there is a small hole in the hedgerow") ; fi
if [[ $1 == hedge3 ]] ; then object=("As you try to climb the branches of the
hedgerow, the branches collapse under your weight.") ; fi
if [[ $1 == hole1 ]] ; then object=("there is a piece of paper in the hole") ; fi
if [[ $1 == hole2 ]] ; then object=("the hole is empty") ; fi
if [[ $1 == house ]] ; then object=("the house is to the $2. it is a large two story
dwelling.") ; fi
if [[ $1 == house2 ]] ; then object=("You are on the outside looking in through the window") ; fi
if [[ $1 == rock ]] ; then object=("it is a rock.") ; fi
if [[ $1 == rock1 ]] ; then object=("it is a medium sized rock with a page beneath it.") ; fi
if [[ $1 == rock2 ]] ; then object=("It is a medium sized rock.") ; fi
if [[ $1 == shed ]] ; then object=("There is a shed to the $2.") ; fi
if [[ $1 == shed1 ]] ; then object=("It is a small steel shed") ; fi
if [[ $1 == tree ]] ; then object=("the tree is wet from the rain.") ; fi
if [[ $1 == tree2 ]] ; then object=("it is a large pine tree.") ; fi
if [[ $1 == gate ]] ; then object=("the gate is locked solid") ; fi
if [[ $1 == mail1 ]] ; then object=("there is a small key in it") ; fi
if [[ $1 == mail2 ]] ; then object=("it is empty") ; fi
if [[ $1 == wolf1 ]] ; then object=('there is a wolf approaching you from the north') ; fi
if [[ $1 == window1 ]] ; then object=("You see a broken chair") ; fi
if [[ $1 == window2 ]] ; then object=("you see a dining room with a window") ; fi
if [[ $1 == window3 ]] ; then object=("you see a staircase and a door across the way") ; fi

echo "$object"
}

elook(){

if [[ $1 == 30 ]] ; then
if [[ $2 == wolf ]] ; then if [[ $3 == 2 ]] ; then wolf=("there is a wolf eyeing you up
in the distance.") ; fi ; fi
else
if [[ $2 == wolf ]] ; then if [[ $3 == 2 ]] ; then wolf=("you see a pair of red eyes glaring at you
from the tree line.") ; fi ; fi ; fi

if [[ $1 == 01 ]] ; then object=("to the north is the house, to the south
and west is an impenetrable hedgerow.") ; fi
if [[ $1 == 02 ]] ; then object=("to the south is an impenetrable hedgerow
there is a bush.") ; fi
if [[ $1 == 03 ]] ; then object=("to the south is an impenetrable hedgerow
there is a bush.") ; fi
if [[ $1 == 04 ]] ; then object=("to the south is an impenetrable hedgerow
To the north is the house.") ; fi
if [[ $1 == 05 ]] ; then object=("to the north west is the house, to the south
is an impenetrable hedgerow. ") ; fi
if [[ $1 == 07 ]] ; then object=("to the west is the house, to the south
and east is an impenetrable hedgerow.") ; fi
if [[ $1 == 08 ]] ; then object=("to the east is the house, to the west
is an impenetrable hedgerow. to the north is the gate there is a tree.") ; fi
if [[ $1 == 09 ]] ; then object=("to the west is the house.") ; fi
if [[ $1 == 10 ]] ; then object=("there is a tree.  the forest and the hedgerow
are to the east.") ; fi
if [[ $1 == 11 ]] ; then object=("you have reached the line where the 
hedgerow meets the forest.") ; fi
if [[ $1 == 12 ]] ; then object=("To the east is the house, on the house
is a mailbox. there is an impenetrable hedgerow to the west.
the gate is to the south the driveway runs by.") ; fi
if [[ $1 == 13 ]] ; then object=("to the west is the door to the house") ; fi
if [[ $1 == 14 ]] ; then object=("in the distance you can see the great
expance of the forest there is a bush") ; fi
if [[ $1 == 15 ]] ; then object=("you have reached the eastern boundary at
the great forest.") ; fi
if [[ $1 == 16 ]] ; then object=("The house is to the east.  there is an
impenetrable hedgerow to the west.  The chimney is in
the wall. the driveway runs through.") ; fi
if [[ $1 == 17 ]] ; then object=("There is a tree.  on the side of the
house is the east chimney.") ; fi
if [[ $1 == 18 ]] ; then object=("to the north is a tree.") ; fi
if [[ $1 == 19 ]] ; then object=("You are at the edge of the great forest,
there is a bush.") ; fi
if [[ $1 == 20 ]] ; then object=("The house is to the east. there is an impenetrable
hedgerow to the west. the driveway runs through.") ; fi
if [[ $1 == 21 ]] ; then object=("You are near the house, a tree is in the distance.") ; fi
if [[ $1 == 22 ]] ; then object=("There is a tree.") ; fi
if [[ $1 == 23 ]] ; then object=("You are at the edge of the great forest
to the north is a shed.") ; fi
if [[ $1 == 24 ]] ; then object=("You have reached the northwestern corner of the house.
there is a tree. there is an impenetrable hedgerow to the west the
driveway runs through from the south to the east.") ; fi
if [[ $1 == 25 ]] ; then object=("the driveway runs through, you see a rock up against
the house.  There is a bush.") ; fi
if [[ $1 == 26 ]] ; then object=(" the driveway runs through. to the south is the house
to the north is the northern hedgerow.") ; fi
if [[ $1 == 27 ]] ; then object=("The driveway runs through, to the west is a tree
to the south is the house.") ; fi
if [[ $1 == 28 ]] ; then object=("there is a tree. the driveway widens out and ends.") ; fi
if [[ $1 == 29 ]] ; then object=("You see a shed to the east.") ; fi
if [[ $1 == 30 ]] ; then object=("There is a large metal shed.") ; fi
if [[ $1 == 31 ]] ; then object=("You have reached the north west corner of the property.") ; fi
if [[ $1 == 32 ]] ; then object=("you see the hedgerow to the north and a 
rock in the middle of the yard.") ; fi
if [[ $1 == 33 ]] ; then object=("to the south is the house, the driveway, and a tree.") ; fi
if [[ $1 == 35 ]] ; then object=("You are at the edge of the great forest.") ; fi
if [[ $1 == 36 ]] ; then object=("the great forest is to the north. there is a bush.") ; fi
if [[ $1 == 37 ]] ; then object=("You are at the north east corner of the property. 
to the south is the shed.") ; fi

echo "You are outside, the rain has stopped
falling. $object
The smell of fresh rain hangs in the air.
$wolf"
}


lick(){

if [[ $1 == ammo1 ]] ; then object=("You shouldn't put that in your mouth") ; fi
if [[ $1 == ashes1 ]] ; then object=("You wish you hadn't done that") ; fi
if [[ $1 == bed1 ]] ; then object=("Tastes like a good nights sleep") ; fi
if [[ $1 == body1 ]] ; then object=("No, have some respect for the dead") ; fi
if [[ $1 == body2 ]] ; then object=("Have some respect for the dead already.") ; fi
if [[ $1 == book ]] ; then object=("it is musty old paper, use your
imagination please.") ; fi
if [[ $1 == box1 ]] ; then object=("The best tasting box you've ever licked") ; fi
if [[ $1 == box2 ]] ; then object=("This box doesn't taste particularly good.") ; fi
if [[ $1 == box3 ]] ; then object=("The box is quite moist") ; fi
if [[ $1 == box4 ]] ; then object=("It is a dusty old box") ; fi
if [[ $1 == cabinet1 ]] ; then object=("Tastes like the inside of a bathroom") ; fi
if [[ $1 == chair1 ]] ; then object=("Tastes like its going to fall apart at any moment") ; fi
if [[ $1 == chair2 ]] ; then object=("Tastes like a fine chair.") ; fi
if [[ $1 == clock1 ]] ; then object=("Tastes like time flies") ; fi
if [[ $1 == curtains1 ]] ; then object=("They taste clean and fresh") ; fi
if [[ $1 == door ]] ; then object=("It tastes of dusty walnut.") ; fi
if [[ $1 == door2 ]] ; then object=("The door tastes barred.") ; fi
if [[ $1 == door3 ]] ; then object=("it has a corrugated taste") ; fi
if [[ $1 == door4 ]] ; then object=("Tastes nailed shut") ; fi
if [[ $1 == door5 ]] ; then object=("Tastes off") ; fi
if [[ $1 == door6 ]] ; then object=("Tastes like fresh rain") ; fi
if [[ $1 == door7 ]] ; then object=("The big walnut door is covered in soot") ; fi
if [[ $1 == drive ]] ; then object=("It tastes gritty.") ; fi
if [[ $1 == floor ]] ; then object=("The grass tastes fresh and green.") ; fi
if [[ $1 == floori ]] ; then object=("you experience something which can only be
understood by one who has licked a carpet that hasn't been vacuumed
in decades.") ; fi


if [[ $1 == floor1 ]] ; then object=("Yummy, the floor of a bathroom.") ; fi
if [[ $1 == floor2 ]] ; then object=("The cold tiles are covered in a thick layer of soot") ; fi
if [[ $1 == floor3 ]] ; then object=("Tastes like dirt.") ; fi
if [[ $1 == floor4 ]] ; then object=("The floor tastes just like every other bit of dirt
you've ever licked.") ; fi
if [[ $1 == floor5 ]] ; then object=("Tastes like a clean carpet") ; fi
if [[ $1 == fireplace1 ]] ; then object=("It tastes as though it has been cold a long time") ; fi
if [[ $1 == fireplace2 ]] ; then object=("The old fireplace is covered in soot.") ; fi
if [[ $1 == forest ]] ; then object=("it tastes like wood.") ; fi
if [[ $1 == grass1 ]] ; then object=("there is a large plot of grass that fills the courtyard") ; fi
if [[ $1 == hammer1 ]] ; then object=("Tastes like a fine hammer") ; fi
if [[ $1 == hatch1 ]] ; then object=("It tastes of cold iron covered in soot.") ; fi
if [[ $1 == hedge ]] ; then object=("Tastes brambly.") ; fi
if [[ $1 == hob ]] ; then object=("The stove tastes covered in soot") ; fi
if [[ $1 == house ]] ; then object=("it tastes old, with a hint of fresh rain.") ; fi
if [[ $i == hole ]] ; then object=("no") ; fi
if [[ $1 == chest1 ]] ; then object=("Tastes covered in soot") ; fi
if [[ $1 == key ]] ; then object=("it tastes of a fine brass.") ; fi
if [[ $1 == light1 ]] ; then object=("It tastes like plastic") ; fi
if [[ $1 == light2 ]] ; then object=("Tastes like there is still butane in it") ; fi
if [[ $1 == painting1 ]] ; then object=("It tastes defaced.") ; fi
if [[ $1 == painting2 ]] ; then object=("Doesn't taste like a quip about its subject.") ; fi
if [[ $1 == peg1 ]] ; then object=("Tastes like brass") ; fi
if [[ $1 == pendant1 ]] ; then object=("It tastes like silver.") ; fi
if [[ $1 == rock ]] ; then object=("tastes like rock.") ; fi
if [[ $1 == mail ]] ; then object=("tastes like steel.") ; fi
if [[ $1 == mirror1 ]] ; then object=("You dont taste as good as you would imagine.") ; fi
if [[ $1 == mirror2 ]] ; then object=("Tastes like broken glass") ; fi
if [[ $1 == mirror3 ]] ; then object=("you taste the remarkable taste of soot.
The mirror is now a little bit cleaner, but you don't feel doing
it again will really help.") ; fi
if [[ $1 == mirror4 ]] ; then object=("You cut your tongue on the broken mirror") ; fi


if [[ $1 == safe1 ]] ; then object=("Tastes like secrets.") ; fi
if [[ $1 == shed ]] ; then object=("Tastes corrugated") ; fi
if [[ $1 == stairs1 ]] ; then object=("Tastes like stairs.") ; fi
if [[ $1 == table ]] ; then object=("a fine vintage of oak, with a thick 
vainer of dust.") ; fi
if [[ $1 == tree ]] ; then object=("The tree is damp.") ; fi
if [[ $1 == toilet1 ]] ; then object=("I strongly recommend against that.") ; fi
if [[ $1 == toilet2 ]] ; then object=("No really, you don't want that.") ; fi
if [[ $1 == tub1 ]] ; then object=("Tastes like every other tub you've ever licked") ; fi
if [[ $1 == wall ]] ; then object=("Nothing quite like plaster.") ; fi
if [[ $1 == wall1 ]] ; then object=("Yummy, the wall of a bathroom.") ; fi
if [[ $1 == wall2 ]] ; then object=("The walls taste entirely of soot.") ; fi
if [[ $1 == wall3 ]] ; then object=("Tastes like concrete.") ; fi
if [[ $1 == window ]] ; then object=("tastes like glass.") ; fi
if [[ $1 == window1 ]] ; then object=("The window tastes unnaturally warm.") ; fi
if [[ $1 == window2 ]] ; then object=("it has a heavy taste of soot") ; fi
if [[ $2 == 1 ]] ; then door=("Tastes unlocked") ; fi
if [[ $2 == 0 ]] || [[ $2 == 2 ]] ; then door=("Tastes locked") ; fi
echo "$object
$door"
}

lookilib(){
thresh=0

if [[ $1 == ammo1 ]] ; then libindex=("You picked up 3 bullets.") ; fi
if [[ $1 == ammo2 ]] ; then libindex=("You already have the bullets.") ; fi
if [[ $1 == ammo3 ]] ; then libindex=("You see bullets") ; fi
if [[ $1 == ammo4 ]] ; then libindex=("There are 3 silver rounds of 38S&W") ; fi
if [[ $1 == armoire1 ]] ; then libindex=("The armoire is empty.") ; fi
if [[ $1 == ashes1 ]] ; then libindex=("You eagerly scoop up the ashes and put them in your
pocket.  You very quickly regret this decision and promptly remove
as many as you can.") ; fi
if [[ $1 == ashes2 ]] ; then libindex=("They are ashes from a long forgotten fire.") ; fi
if [[ $1 == bed1 ]] ; then libindex=("The four post bed is immaculately maintained, and made.") ; fi
if [[ $1 == body1 ]] ; then libindex=("It has been here for a long
time.  It is clear that the body of a man has been severally
eviscerated to the bone.  The cuts into the bone are clean and
meticulous.") ; fi
if [[ $1 == body2 ]] ; then libindex=("You look at the body.  It is one of a young girl.  You
can not be sure of the cause of her death, however you can tell she
that she was subjected to extreme heat.") ; fi
if [[ $1 == book1 ]] ; then libindex=('you see a page on the table') ; fi
if [[ $1 == book2 ]] ; then libindex=("there is a paper nailed to the wall.") ; fi
if [[ $1 == book3 ]] ; then libindex=("There is a page in his hand") ; fi
if [[ $1 == book4 ]] ; then libindex=("There seems to be a page of a journal sticking
out of the damaged leg of the chair leg.  it is quite tattered and
burned.") ; fi
if [[ $1 == book5 ]] ; then libindex=("You have already removed the page from the chair leg.") ; fi
if [[ $1 == book6 ]] ; then libindex=("You see a book") ; fi
if [[ $1 == book7 ]] ; then libindex=("Inside is a single piece of paper.") ; fi
if [[ $1 == book8 ]] ; then libindex=("You can see a corner of a paper sticking out of the ground.") ; fi
if [[ $1 == book9 ]] ; then libindex=("It is a small  piece of paper with some old writing on it.") ; fi
if [[ $1 == book10 ]] ; then libindex=("There is a single folded piece of paper stuffed into the compartment.") ; fi
if [[ $1 == book11 ]] ; then libindex=("there is a piece of paper inside.") ; fi
if [[ $1 == book12 ]] ; then libindex=("You look in between the sheets and you see
a single tattered piece of paper.") ; fi
if [[ $1 == book13 ]] ; then libindex=("Inside the hole, appears to be a page.") ; fi
if [[ $1 == book14 ]] ; then libindex=("In the branches, a scrap of paper is stuck.") ; fi
if [[ $1 == book15 ]] ; then libindex=("You see the corner of a paper under the box.") ; fi
if [[ $1 == bookcase1 ]] ; then libindex=("The empty bookcase is scorched and covered in soot.") ; fi
if [[ $1 == bookcase2 ]] ; then libindex=("There is one lonely page on the scorched shelf") ; fi
if [[ $1 == bookcase3 ]] ; then libindex=("All of the shelves have been scorched.") ; fi

if [[ $1 == box1 ]] ; then thresh=1 && libindex=("the box is open") ; fi
if [[ $1 == box2 ]] ; then libindex=("there is a small wooden crate across the courtyard") ; fi
if [[ $1 == box3 ]] ; then libindex=("There is a small closed box to the west.") ; fi
if [[ $1 == box4 ]] ; then thresh=1 && libindex=("There is a small open box to the west") ; fi
if [[ $1 == box5 ]] ; then libindex=("You see no way of opening it with your bare hands.") ; fi
if [[ $1 == box6 ]] ; then libindex=("The box is empty") ; fi
if [[ $1 == box7 ]] ; then libindex=("the box is closed.") ; fi
if [[ $1 == box8 ]] ; then libindex=("The box is already open.") ; fi
if [[ $1 == box9 ]] ; then libindex=("You open the box.") ; fi
if [[ $1 == box10 ]] ; then libindex=("It is a box that you crawled through to get here.") ; fi
if [[ $1 == box11 ]] ; then libindex=("the box is already open.") ; fi
if [[ $1 == box12 ]] ; then libindex=("It is an open box.") ; fi
if [[ $1 == box13 ]] ; then libindex=("It is a sealed crate") ; fi
if [[ $1 == bush1 ]] ; then libindex=("There is a small bush in the yard.") ; fi
if [[ $1 == bush2 ]] ; then libindex=("The bush is ratty and poorly trimmed.") ; fi
if [[ $1 == cabinet1 ]] ; then libindex=("Inside the cabinet there is a key") ; fi
if [[ $1 == cabinet2 ]] ; then libindex=("The cabinet is empty") ; fi
if [[ $1 == chair1 ]] ; then libindex=("The chair looks like it will topple over at any second.") ; fi
if [[ $1 == chair2 ]] ; then libindex=("The chair has toppled.  Inside one of the legs there
appears to be a hole with something in it.") ; fi
if [[ $1 == chair3 ]] ; then libindex=("The chair has toppled.  Inside one of the legs there
appears to be a hole.") ; fi
if [[ $1 == chair4 ]] ; then libindex=("There is a rolled up piece of paper in the chair leg.") ; fi
if [[ $1 == chair5 ]] ; then libindex=("There is a hollow in the chair leg.") ; fi
if [[ $1 == chair6 ]] ; then libindex=("it is a comfortable wingback chair.") ; fi
if [[ $1 == chair7 ]] ; then libindex=("The chair has fallen apart.") ; fi
if [[ $1 == chest1 ]] ; then libindex=("The cooling ice within melted long ago.") ; fi
if [[ $1 == chimney1 ]] ; then libindex=("There is a hole in the chimney") ; fi
if [[ $1 == clock1 ]] ; then libindex=("The clock is together correctly") ; fi
if [[ $1 == clock2 ]] ; then libindex=("It is a small wind up mantel clock") ; fi
if [[ $1 == clock3 ]] ; then libindex=("The clock is missing parts.") ; fi
if [[ $1 == clock4 ]] ; then libindex=("The clock is ready to be wound.") ; fi
if [[ $1 == clock5 ]] ; then libindex=("The clock is running.") ; fi
if [[ $1 == clock6 ]] ; then libindex=("you attach it to the inside of the clock") ; fi
if [[ $1 == clock7 ]] ; then libindex=("The clock is now ready to be wound.") ; fi
if [[ $1 == clock8 ]] ; then libindex=("It does not fit into the clock.") ; fi
if [[ $1 == clock9 ]] ; then libindex=("the clock is broken and cant be wound") ; fi
if [[ $1 == clock10 ]] ; then libindex=("the clock is already wound and running") ; fi
if [[ $1 == clock11 ]] ; then libindex=("You wind the clock and its starts running.
as it ticks away, a small compartment opens up in the fireplace.") ; fi
if [[ $1 == clock12 ]] ; then libindex=("the insides have been completely removed.") ; fi
if [[ $1 == clock13 ]] ; then libindex=("The clocks insides are completely missing and there
is nothing to install the parts into.") ; fi
if [[ $1 == clock14 ]] ; then libindex=("You look at the face of the clock, and there is just
a hole where the peg should be.") ; fi
if [[ $1 == clock15 ]] ; then libindex=("You do not have the key to wind it.") ; fi
if [[ $1 == clock16 ]] ; then libindex=("The clock has fallen over on its back.") ; fi
if [[ $1 == clock17 ]] ; then libindex=("The clocks insides are completely ruined.") ; fi
if [[ $1 == clock18 ]] ; then libindex=("the only thing of any use inside is a single main spring barrel.") ; fi
if [[ $1 == clockkey1 ]] ; then libindex=("in one of the lower branches you can see
a small brass clock key.") ; fi
if [[ $1 == cog1 ]] ; then libindex=("The only thing of any use inside is a single cog.") ; fi
if [[ $1 == cog2 ]] ; then libindex=("The clocks insides are completely ruined.") ; fi
if [[ $1 == cog3 ]] ; then libindex=("It is a small cog from a clock") ; fi
if [[ $1 == corridor1 ]] ; then libindex=("the corridor is black as sin") ; fi
if [[ $1 == corridor2 ]] ; then thresh=1 && libindex=("the hallway leads to the main dining room") ; fi
if [[ $1 == corridor3 ]] ; then thresh=1 && libindex=("It is a dark corridor that wraps to the north") ; fi
if [[ $1 == corridor4 ]] ; then libindex=("It is a dark corridor") ; fi
if [[ $1 == corridor5 ]] ; then thresh=1 && libindex=("This corridor leads to an empty hallway") ; fi
if [[ $1 == corridor6 ]] ; then thresh=1 && libindex=("This corridor leads to the stairs down") ; fi
if [[ $1 == corridor7 ]] ; then thresh=1 && libindex=("This corridor leads to a hallway with a window") ; fi
if [[ $1 == cupboard1 ]] ; then libindex=("The cupboard is closed") ; fi
if [[ $1 == cupboard2 ]] ; then libindex=("There is a paper nailed to the wall of the cupboard.") ; fi
if [[ $1 == cupboard3 ]] ; then libindex=("You see a small gear on the floor in the cupboard.") ; fi
if [[ $1 == cupboard4 ]] ; then libindex=("The cupboard is empty") ; fi
if [[ $1 == cupboard5 ]] ; then libindex=("There is a cupboard underneath.") ; fi
if [[ $1 == cupboard6 ]] ; then libindex=("You open the cupboard") ; fi
if [[ $1 == cupboard7 ]] ; then libindex=("The cupboard is already open") ; fi
if [[ $1 == curtains1 ]] ; then libindex=("There are curtains on the windows.") ; fi
if [[ $1 == curtains2 ]] ; then libindex=("Unlike the rooms on the first floor, there are curtains on the windows.") ; fi

if [[ $1 == door1 ]] ; then libindex=("It is a solid walnut door.") ; fi
if [[ $1 == door2 ]] ; then thresh=1 && libindex=("the door leads to the sitting room") ; fi
if [[ $1 == door3 ]] ; then thresh=1 && libindex=("this leads to the small room where you awoke") ; fi
if [[ $1 == door4 ]] ; then thresh=1 && libindex=("This leads to the foyer of the house") ; fi
if [[ $1 == door5 ]] ; then thresh=1 && libindex=("This leads to the court yard") ; fi
if [[ $1 == door6 ]] ; then thresh=1 && libindex=("This leads to a living room") ; fi
if [[ $1 == door7 ]] ; then thresh=1 && libindex=("This leads to a small dining room.") ; fi
if [[ $1 == door8 ]] ; then thresh=1 && libindex=("This leads to the stairs up.") ; fi
if [[ $1 == door9 ]] ; then thresh=1 && libindex=("This leads to a dining room") ; fi
if [[ $1 == door10 ]] ; then thresh=1 && libindex=("This leads to a bathroom") ; fi
if [[ $1 == door11 ]] ; then thresh=1 && libindex=("This leads to a dark hallway") ; fi
if [[ $1 == door12 ]] ; then thresh=1 && libindex=("This door leads outside") ; fi
if [[ $1 == door13 ]] ; then thresh=1 && libindex=("to the east is a hallway") ; fi
if [[ $1 == door14 ]] ; then thresh=1 && libindex=("This door to the basement stairs") ; fi
if [[ $1 == door15 ]] ; then thresh=1 && libindex=("This door leads to an empty hallway") ; fi
if [[ $1 == door16 ]] ; then thresh=1 && libindex=("it is the steel door of the shed") ; fi
if [[ $1 == door17 ]] ; then thresh=1 && libindex=("This door leads to an empty room") ; fi
if [[ $1 == door18 ]] ; then thresh=1 && libindex=("This door leads to a hallway with a window") ; fi
if [[ $1 == door19 ]] ; then thresh=1 && libindex=("This door leads to a bedroom") ; fi
if [[ $1 == door20 ]] ; then thresh=1 && libindex=("This door leads to a library") ; fi
if [[ $1 == door21 ]] ; then thresh=1 && libindex=("This door leads to a desheveled bedroom") ; fi
if [[ $1 == door22 ]] ; then libindex=("It is boarded up.") ; fi
if [[ $1 == door23 ]] ; then libindex=("The door is boarded up, it would take an army to breach it.") ; fi
if [[ $1 == door24 ]] ; then libindex=("There appears to be a paper stuffed under the door.") ; fi
if [[ $1 == door25 ]] ; then libindex=("The door is barred from the other side, it
like everything else, is covered in a thick coat of soot.") ; fi
if [[ $1 == door26 ]] ; then thresh=1 && libindex=("It leads to an empty room.") ; fi
if [[ $1 == door27 ]] ; then thresh=1 && libindex=("It is a door into the courtyard.") ; fi
if [[ $1 == door28 ]] ; then libindex=("It is a door out of the house.") ; fi
if [[ $1 == door29 ]] ; then libindex=("The door leads to the inside of the shed.") ; fi
if [[ $1 == door30 ]] ; then libindex=("the door is made of a sturdy corrugated steel sheet.") ; fi
if [[ $1 == drawer1 ]] ; then libindex=("there is a key in the drawer") ; fi
if [[ $1 == drawer2 ]] ; then libindex=("the drawer is empty") ; fi
if [[ $1 == drive1 ]] ; then libindex=("the driveway runs from the front of the house
to a gate in the hedgerow.") ; fi

if [[ $1 == figure1 ]] ; then libindex=("you see a small shadowy figure in the window
across the courtyard") ; fi
if [[ $1 == gate1 ]] ; then libindex=("A gate sits in the middle of the hedgerow.") ; fi
if [[ $1 == gear1 ]] ; then libindex=("It is a small gear from a clock.") ; fi
if [[ $1 == gun1 ]] ; then libindex=("You picked up the gun") ; fi
if [[ $1 == gun2 ]] ; then libindex=("You already have the gun.") ; fi
if [[ $1 == gun3 ]] ; then libindex=("You see a gun.") ; fi
if [[ $1 == gun4 ]] ; then libindex=("It is an Enfield NO2 revolver in 38S&W.") ; fi
if [[ $1 == gun5 ]] ; then thresh=1 ; libindex=("You load the gun.") ; fi
if [[ $1 == figure1 ]] ; then libindex=("you see a small shadowy figure in the window
across the courtyard") ; fi
if [[ $1 == fireplace1 ]] ; then libindex=("your hand is on the fireplace.  it is empty.") ; fi
if [[ $1 == fireplace2 ]] ; then libindex=("There are ashes from some long forgotten fire.") ; fi
if [[ $1 == fireplace3 ]] ; then libindex=("There appears to be a paper inside the fireplace.") ; fi
if [[ $1 == fireplace4 ]] ; then libindex=("there is a small key inside the fireplace.") ; fi
if [[ $1 == fireplace5 ]] ; then libindex=("The fireplace is full of ashes and is otherwise
completely covered in soot.  on closer inspection, you see that the
flue is plugged.") ; fi
if [[ $1 == fireplace6 ]] ; then thresh=1 libindex=("a small compartment is opened at the base.") ; fi
if [[ $1 == fireplace7 ]] ; then libindex=("There is a fireplace across the room.") ; fi
if [[ $1 == fireplace8 ]] ; then libindex=("You stare right into the heart of the fireplace.") ; fi
if [[ $1 == floor1 ]] ; then libindex=("It is an old worn carpet") ;fi
if [[ $1 == floor2 ]] ; then libindex=("There is a grass courtyard in the middle of the house") ;fi
if [[ $1 == floor3 ]] ; then libindex=("There is wall to wall grass.  it is still damp from the fresh rain.") ; fi
if [[ $1 == floor4 ]] ; then libindex=("the cold tiles are covered in a thick layer of soot.") ; fi
if [[ $1 == floor5 ]] ; then libindex=("The floor is made of loose dirt.") ; fi
if [[ $1 == floor6 ]] ; then libindex=("The floor is of cold tiles.") ; fi
if [[ $1 == floor7 ]] ; then libindex=("The carpet is clean") ; fi
if [[ $1 == floor8 ]] ; then libindex=("the floor is wood planks with a ladder in the middle.") ; fi
if [[ $1 == floor9 ]] ; then libindex=("The floor is unfinished wood planks.") ; fi
if [[ $1 == forest1 ]] ; then libindex=("You see the tree line of the great forest.") ; fi
if [[ $1 == forest2 ]] ; then libindex=("You see the northern edge of the sprawling great forest.") ; fi
if [[ $1 == forest3 ]] ; then libindex=("You see the vast eastern expanse of the great forest") ; fi
if [[ $1 == forest4 ]] ; then libindex=("The forest is nearly impenetrable.") ; fi
if [[ $1 == hatch1 ]] ; then libindex=("You open the hatch and see a page") ; fi
if [[ $1 == hatch2 ]] ; then libindex=("you open the hatch and see only ashes") ; fi
if [[ $1 == hammer1 ]] ; then libindex=("There is a hammer on the wall of the shed.") ; fi
if [[ $1 == hammer2 ]] ; then libindex=("It is an old weathered ball peen hammer.") ; fi
if [[ $1 == hedge1 ]] ; then libindex=("A large hedge seems to surround the house.") ; fi
if [[ $1 == hedge2 ]] ; then libindex=("It is the northern edge of the hedgerow.") ; fi
if [[ $1 == hedge3 ]] ; then libindex=("It is the eastern edge of the hedgerow.") ; fi
if [[ $1 == hob1 ]] ; then libindex=("The stove is covered in soot.  it has a small hatch.") ; fi
if [[ $1 == hole1 ]] ; then libindex=("It is a small hole in the wall.") ; fi
if [[ $1 == hole2 ]] ; then libindex=("It is a small hole in the wall, It is empty") ; fi
if [[ $1 == hole3 ]] ; then libindex=("there is a piece of paper inside.") ; fi
if [[ $1 == hole4 ]] ; then libindex=("There is a pendant inside.") ; fi
if [[ $1 == key1 ]] ; then libindex=('you see a key on the table') ; fi
if [[ $1 == key2 ]] ; then libindex=("Inside is a key.") ; fi
if [[ $1 == ladder1 ]] ; then libindex=("It is a ladder down to the mysterious room.") ; fi
if [[ $1 == light1 ]] ; then libindex=("You picked up the light.") ; fi
if [[ $1 == light2 ]] ; then libindex=("You already have the light.") ; fi
if [[ $1 == light3 ]] ; then libindex=("You see a light.") ; fi
if [[ $1 == light4 ]] ; then libindex=("It is a dynamo powered flashlight.") ; fi
if [[ $1 == lighter1 ]] ; then libindex=("you picked up the lighter") ; fi
if [[ $1 == lighter2 ]] ; then libindex=("you already have the lighter") ; fi
if [[ $1 == lighter3 ]] ; then libindex=("It is an old flip cap lighter") ; fi
if [[ $1 == mainspring1 ]] ; then libindex=("It is a main spring barrel from a clock.") ; fi
if [[ $1 == mirror1 ]] ; then libindex=("Your face is worn, your eyes are heavy,
and your hair is white and stringy.") ; fi
if [[ $1 == mirror2 ]] ; then libindex=("the mirror is broken, there is a cubby
 inside, there is a lighter") ; fi
if [[ $1 == mirror3 ]] ; then libindex=("the mirror is broken, there is an empty cubby inside.") ; fi
if [[ $1 == mirror4 ]] ; then libindex=("The mirror is irrecoverably dirty and un-reflective.") ; fi
if [[ $1 == mirror5 ]] ; then libindex=("The mirror is broken, inside the cubby there
appears to be a folded piece of paper.") ; fi

if [[ $1 == painting1 ]] ; then libindex=("It is a painting with the faces removed with black paint.") ; fi
if [[ $1 == painting2 ]] ; then libindex=("Behind the painting there is a safe.  On the back of the
painting, there is a small hand written message; input the
numbers _ _-_ _-_ _ to open the safe.") ; fi
if [[ $1 == painting3 ]] ; then libindex=("Behind the painting is a safe.
The safe is open covering the back of the painting.") ; fi
if [[ $1 == painting4 ]] ; then libindex=("The painting has already been swung open.") ; fi
if [[ $1 == painting5 ]] ; then libindex=("You swing open the painting.") ; fi
if [[ $1 == painting6 ]] ; then libindex=("Worst day of my life") ; fi
if [[ $1 == painting7 ]] ; then libindex=("Happiest day of my life") ; fi
if [[ $1 == painting8 ]] ; then libindex=("It is a painting of a woman and a young girl.") ; fi
if [[ $1 == panel1 ]] ; then libindex=("There is a panel in the wall with a peg in the middle") ; fi
if [[ $1 == panel2 ]] ; then libindex=("The panel is swung open with a hole in the wall behind it.") ; fi
if [[ $1 == panel3 ]] ; then libindex=("The panel has already been swung open") ; fi
if [[ $1 == panel4 ]] ; then libindex=("You turn the peg with the key and open the panel.") ; fi
if [[ $1 == peg1 ]] ; then libindex=("The peg looks like one found on a clock
for winding.  It seems to be on an isolated panel on the wall.") ; fi
if [[ $1 == pendant1 ]] ; then libindex=("It is a lone pendant left in this cubby.") ; fi
if [[ $1 == pendant2 ]] ; then libindex=("You put the pendant back where you found it.") ; fi
if [[ $1 == rain1 ]] ; then libindex=("it is raining") ; fi
if [[ $1 == rain2 ]] ; then libindex=("the rain has stopped") ; fi
if [[ $1 == rain3 ]] ; then libindex=("The rain is driving.") ; fi
if [[ $1 == rain4 ]] ; then libindex=("The driving rain has stopped.") ; fi
if [[ $1 == road1 ]] ; then libindex=("There is a road beyond the hedgerow.") ; fi
if [[ $1 == safe1 ]] ; then libindex=("It is a steel safe, and utilized a rotary lock") ; fi
if [[ $1 == safe2 ]] ; then libindex=("Inside the safe is a page.") ; fi
if [[ $1 == safe3 ]] ; then libindex=("The safe is empty.") ; fi
if [[ $1 == safe4 ]] ; then libindex=("The safe is already open.") ; fi
if [[ $1 == safe5 ]] ; then libindex=("Please enter the pass code: ") ; fi
if [[ $1 == safe6 ]] ; then libindex=("You open the safe.") ; fi
if [[ $1 == safe7 ]] ; then libindex=("Incorrect code.") ; fi
if [[ $1 == shed1 ]] ; then libindex=("It is a small corrugated shed in the yard.") ; fi
if [[ $1 == sprocket1 ]] ; then libindex=("You can see a small sprocket on the ground.") ; fi
if [[ $1 == sprocket2 ]] ; then libindex=("It is a small sprocket from a clock.") ; fi
if [[ $1 == stairs1 ]] ; then libindex=("They are stairs up to the next floor.") ; fi
if [[ $1 == stairs2 ]] ; then libindex=("The stairs lead down to the next floor.") ; fi
if [[ $1 == table1 ]] ; then libindex=("it is a sturdy table") ; fi
if [[ $1 == table2 ]] ; then libindex=("The table is clear.") ; fi
if [[ $1 == table3 ]] ; then libindex=("There is nothing on the table.") ; fi
if [[ $1 == table4 ]] ; then libindex=("There appears to be a key under the table.") ; fi
if [[ $1 == table5 ]] ; then libindex=("It is a small reading table.") ; fi
if [[ $1 == toilet1 ]] ; then libindex=("It is a disused toilet.") ; fi
if [[ $1 == tree1 ]] ; then libindex=("It is a large tree in front of the house.") ; fi
if [[ $1 == tree2 ]] ; then libindex=("it is a large pine tree.") ; fi
if [[ $1 == tree3 ]] ; then libindex=("It is the edge of a large pin tree.") ; fi
if [[ $1 == tree4 ]] ; then libindex=("It is a large tree") ; fi
if [[ $1 == tree5 ]] ; then libindex=("The tree is wet from the rain.") ; fi
if [[ $1 == trapdoor1 ]] ; then libindex=("There is a trapdoor to the east.") ; fi
if [[ $1 == trapdoor2 ]] ; then libindex=("The door is shut.") ; fi
if [[ $1 == trapdoor3 ]] ; then libindex=("The door is open.") ; fi
if [[ $1 == trapdoor4 ]] ; then libindex=("You pulled on the rope to open the trap door.") ; fi
if [[ $1 == trapdoor5 ]] ; then libindex=("The trapdoor is already open.") ; fi
if [[ $1 == tub1 ]] ; then libindex=("It is a dirty old tub.") ; fi
if [[ $1 == tub2 ]] ; then libindex=("There is a page inside.") ; fi
if [[ $1 == wall1 ]] ; then libindex=("It is a standard plaster wall.") ; fi
if [[ $1 == wall2 ]] ; then libindex=("You see the faint outline of a panel with a
small peg in the wall.") ; fi
if [[ $1 == wall3 ]] ; then libindex=("there is a hole in the wall, behind where the panel was") ; fi
if [[ $1 == wall4 ]] ; then libindex=("All the walls are covered in soot.") ; fi
if [[ $1 == wall5 ]] ; then libindex=("The wall is still wet from the rain") ; fi
if [[ $1 == wall6 ]] ; then libindex=("It is a corrugated steel wall") ; fi
if [[ $1 == wall7 ]] ; then libindex=("The wall is cinder block.") ; fi
if [[ $1 == wall8 ]] ; then libindex=("There is a painting on the wall.") ; fi
if [[ $1 == wall9 ]] ; then libindex=("There is a body nailed to the wall.") ; fi
if [[ $1 == window1 ]] ; then thresh=1 && libindex=('you feel a draft from the window') ; fi
if [[ $1 == window2 ]] ; then libindex=("you see a small courtyard.  across the way
you see another window,  below the window there appears to be a box") ; fi
if [[ $1 == window3 ]] ; then libindex=("In the yard you see a tree.  You see a hedgerow
with a fence behind it.  there is a road leading up to a gate
 in the hedge.") ; fi
if [[ $1 == window4 ]] ; then libindex=("It seems like this window looks into another part of
the house.  the  window is blacked out by what looks like soot.") ; fi
if [[ $1 == window5 ]] ; then libindex=("the window is now smashed.  you might be able to get
through.  When looking with the light, you can see a big fireplace
across the way, and the walls seem to be as sooted as the window was") ; fi
if [[ $1 == window6 ]] ; then libindex=("You see a small courtyard a door to the east.
across the way is another window.") ; fi
if [[ $1 == window7 ]] ; then thresh=1 && libindex=("The window is smashed") ; fi
if [[ $1 == window8 ]] ; then libindex=("You see a long treeline.") ; fi
if [[ $1 == window9 ]] ; then libindex=("You see a small courtyard, across the way you see a door.
to the north is a window, below the window is a box.") ; fi
if [[ $1 == window10 ]] ; then libindex=("You see a dining room with a door out to the outside world.") ; fi
if [[ $1 == window11 ]] ; then libindex=("You see a small dining room.") ; fi
if [[ $1 == window12 ]] ; then libindex=("You see a table.") ; fi
if [[ $1 == window13 ]] ; then libindex=("The window is covered in soot. it has a hole you climbed through.") ; fi
if [[ $1 == window14 ]] ; then libindex=("The window is broken and can not be opened.") ; fi
if [[ $1 == window15 ]] ; then libindex=("you see a window across the courtyard.") ; fi
if [[ $1 == window16 ]] ; then libindex=("you see the driveway run by.  in the background you see
an impenetrable hedgerow.") ; fi
if [[ $1 == window17 ]] ; then libindex=("You see an impenetrable hedgerow and a tree, the road goes by.") ; fi
if [[ $1 == window18 ]] ; then libindex=("You see the end of the hedgerow, and the mass of
the sprawling forest.") ; fi
if [[ $1 == window19 ]] ; then libindex=("You see the mass of the sprawling forest.") ; fi
if [[ $1 == window20 ]] ; then libindex=("The window across the courtyard on the first floor is broken.") ; fi
if [[ $1 == window21 ]] ; then libindex=("You see the front gate of the hedgerow, with the
driveway running through it to the main road.") ; fi
if [[ $1 == window22 ]] ; then libindex=("The impenetrable hedgerow runs across.") ; fi
if [[ $1 == window23 ]] ; then libindex=("There is a window across the way.") ; fi
if [[ $1 == window24 ]] ; then libindex=("It is a window to the back of the house.") ; fi
if [[ $1 == wolf1 ]] ; then thresh=2 && libindex=("You see a pair of red eyes glaring at you
through the tree line.") ; fi

}

looki(){

if [[ $1 == i01 ]] ; then output=("To the west is a door, to the east is
a corridor.  There is a window to the north") ; fi
if [[ $1 == i02 ]] ; then output=("You have entered what looks to have been a sitting
room to the east and north are doors.  To the west is a window. To
the south is a bookcase to the west is a window.  There is a chair in
the center of the room") ; fi
if [[ $1 == i03 ]] ; then output=("to all directions there are doors.  The door to
the west is boarded up.  there is a box to the north against the wall") ; fi
if [[ $1 == i04 ]] ; then output=("There is are doors to the north south and east.
There is a fireplace to the west.") ; fi
if [[ $1 == i05 ]] ; then output=("There is a large table in the middle of the room.
to the south and east there are windows.  the window to the east
appears to lead to another room in the house.  there is a box to
the north.") ; fi
if [[ $1 == i06 ]] ; then output=("You turn on the flashlight and you see a door to the
north and a corridor to the east.") ; fi
if [[ $1 == i07 ]] ; then output=("Inside the bathroom there is a cabinet, a toilet,
and a tub.") ; fi
if [[ $1 == i08 ]] ; then output=("This room seems to be a large dining room.
To the north there is a boarded up door.  to the east and the
west there are windows.  to the east there is a door.") ; fi
if [[ $1 == i09 ]] ; then output=("You enter the central grass covered
courtyard of the house.  There is a door behind you, and windows on
all other walls. the smell of fresh rain hangs in the air") ; fi
if [[ $1 == i10 ]] ; then output=("You crawl through he sooty window to see the body of a
young girl.  there is a fireplace, a stove and an ice chest.
everything is covered in soot") ; fi
if [[ $1 == i10a ]] ; then output=("Before you is a ghost.  your hand rests
on the fireplace.") ; fi
if [[ $1 == i11 ]] ; then output=("To the north is a stairwell, there is a
door to the east, and to the south.  under the stairway is a 
cupboard.  there is a window to the west") ; fi
if [[ $1 == i12 ]] ; then output=("You are in an empty hallway with a door to
the east and the west") ; fi
if [[ $1 == i13 ]] ; then output=("There is a staircase to the basement here") ; fi
if [[ $1 == i14 ]] ; then output=("You are in the shed") ; fi
if [[ $1 == i15 ]] ; then output=("To the east are stairs, to the west is a door") ; fi
if [[ $1 == i16 ]] ; then output=("To the east and west are doors.") ; fi
if [[ $1 == i17 ]] ; then output=("To the east and south are doors.") ; fi
if [[ $1 == i18 ]] ; then output=("To the east and north are doors.") ; fi
if [[ $1 == i19 ]] ; then output=("To the east and west are doors.  on the north wall
is a painting.") ; fi
if [[ $1 == i20 ]] ; then output=("To the west there is a door, to the southt there is a box") ; fi
if [[ $1 == i21 ]] ; then output=("As you finish crawling through the box,
you enter a crawlspace") ; fi
if [[ $1 == i22 ]] ; then output=("Inside the bathroom there is a cabinet, a tub, a toilet,
a mirror, and a window.") ; fi
if [[ $1 == i23 ]] ; then output=("You enter a bedroom.  there is a bed, a bookcase,
and a chest of drawers.") ; fi
if [[ $1 == i24 ]] ; then output=("You enter a bedroom.  There is a a bed, a bookcase,
an armoire, a window to the north, and a window to the east.") ; fi
if [[ $1 == i25 ]] ; then output=("You enter a library.  To the north, west, and south
there are bookcases lining the walls.  in the center of the room
there sits a chair, and small table.  In the center of the western
wall there is a fireplace with a small clock on the mantle.") ; fi
if [[ $1 == i26 ]] ; then output=("You enter a bedroom.  there is a bed, a bookcase,
an armoire, a and a window to the south.") ; fi
if [[ $1 == i27 ]] ; then output=("You enter a library.  to the east, north, and south
are bookcases lining the walls.  in the center of the room sits a
chair and a small table. in the center of the eastern wall, there is
a fireplace with a small clock on the mantle.") ; fi
if [[ $1 == i28 ]] ; then output=("You enter a bedroom.  There is a bed, a bookcase,
an armoire, a clock, and a window to the west.") ; fi
if [[ $1 == i29 ]] ; then output=("You enter a bedroom.  There is a bed, bookcase, a
chest of drawers and a clock, and a window to the east.") ; fi
if [[ $1 == i30 ]] ; then output=("You enter a bedroom.  there is a bed, chest of drawers,
a bookcase, an armoire, and windows to the west and south.") ; fi
if [[ $1 == i31 ]] ; then output=("You enter a strange room.  Even though all the
other rooms have been immaculate, this one is run down and empty.
there is a bookcase, a fallen clock, and a window to the south.
There is a trapdoor to the east.") ; fi
if [[ $1 == i32 ]] ; then output=("You enter a bedroom.  There is a bed, an armoire,
a clock, and windows to the east and south.") ; fi
if [[ $1 == i33 ]] ; then output=("To the west are stairs down, to the east
and south are corridors.") ; fi
if [[ $1 == i34 ]] ; then output=("To the east and west are corridors") ; fi
if [[ $1 == i35 ]] ; then output=("To the south and west are corridors.
to the east is a door") ; fi
if [[ $1 == i36 ]] ; then output=("to the south and north are corridors.
to the east is a door") ; fi
if [[ $1 == i37 ]] ; then output=("To the south and the north are corridors.
to the east is a door.  to the west is a window") ; fi
if [[ $1 == i38 ]] ; then output=("To the south and north are corridors.
to the east is a door.  on the west wall is a painting.") ; fi
if [[ $1 == i39 ]] ; then output=("To the north  and south are corridors.
to the east and west are doors") ; fi
if [[ $1 == i40 ]] ; then output=("To the north and south are corridors.
to the east and west are doors.") ; fi
if [[ $1 == i41 ]] ; then output=("To the south and north are corridors.
to the east is a door.  to the west is a window.") ; fi
if [[ $1 == i43 ]] ; then output=("You enter the attic.  to the south is a ladder,
to the north is a skeletal body that has been crucified to the wall.") ; fi






if [[ $1 != null ]] ; then echo "$output" ; fi

lookilib $2
if [[ $3  == $thresh ]] ; then echo "$libindex" ; fi

lookilib $4
if [[ $5 == $thresh ]] ; then echo "$libindex" ; fi

lookilib $6
if [[ $7 == $thresh ]] ; then echo "$libindex" ; fi

lookilib $8
if [[ $9 == $thresh ]] ; then echo "$libindex" ; fi

lookilib ${10}
if [[ ${11} == $thresh ]] ; then echo "$libindex" ; fi

lookilib ${12}
if [[ ${13} == $thresh ]] ; then echo "$libindex" ; fi

}

lookdoor(){

lookilib $1
echo "$libindex" 

lookilib $2
if [[ $3 == $thresh ]] ; then echo "$libindex" ; fi

if [[ $4 == 1 ]] ; then uni doorunlock ; fi
if [[ $4 != 1 ]] ; then uni doorlock ;fi
}

lookkey(){
if [[ $1 == e08 ]] ; then echo "It is a small brass clock key" ; fi
if [[ $1 == e10 ]] ; then elooka tree ; echo "On the limb of the tree, there sits a key" ; fi
if [[ $1 == e12 ]] ; then echo "you see a it is a small brass key" ; fi
if [[ $1 == i01 ]] ; then echo "you see a key sitting in the middle of the table.
It might come in handy" ; fi
if [[ $1 == i04 ]] ; then echo "you see a key in the ashes of the fireplace" ; fi
if [[ $1 == i07 ]] ; then echo "it is a worn brass key" ; fi
if [[ $1 == i08 ]] ; then echo "you see a key sitting under the table" ; fi
if [[ $1 == i09 ]] ; then echo "you see a key in they box" ; fi
if [[ $1 == i23 ]] ; then echo "The key is sitting in the drawers" ; fi
}

smell(){
#room
if [[ $1 == e ]] ; then object=("The smell of fresh rain prevail the air") ; fi
if [[ $1 == i01 ]] ;  then if [[ $3 == 1 ]] ; then 
object=("the smell of fresh rain pervades the air") ; else
object=("the room smells stuffy") ; fi ; fi 
if [[ $1 == i04 ]] ; then object=("you smell a long forgotten fire") ; fi
if [[ $1 == i06 ]] ; then object=("the room smells of a rancid death") ; fi
if [[ $1 == i07 ]] ; then object=("it smells of an old forgotten bathroom") ; fi
if [[ $1 == i10 ]] ; then object=("the room reeks of death and sulfur") ; fi
if [[ $1 == i14 ]] ; then object=("the shed smells damp and moldy") ; fi
if [[ $1 == i15 ]] ; then object=("the putrid air of an old basement bears down on you") ; fi
if [[ $1 == i23 ]] ; then object=("the room smells of fresh linen and a hint of cinnamon") ; fi
if [[ $1 == i31 ]] ; then object=("the room smells desolate and dead") ; fi
if [[ $1 == i33 ]] ; then object=("the room smells stagnant and dead") ; fi
if [[ $1 == i43 ]] ; then object=("the smell of old death hangs in the air") ; fi

if [[ $1 == ammo ]] ; then object=("it smells of brass and silver") ; fi
if [[ $1 == ashes1 ]] ; then object=("You wish you hadn't done that") ; fi
if [[ $1 == bed1 ]] ; then object=("Smells like clean linen") ; fi
if [[ $1 == body1 ]] ; then object=("All of the soft tissue has long since decomposed off.") ; fi
if [[ $1 == book ]] ; then object=("it is musty old paper, use your imagination please.") ; fi
if [[ $1 == book2 ]] ; then object=("it is dank and dirty.") ; fi
if [[ $1 == book3 ]] ; then object=("You smell something foul permeate the air.") ; fi
if [[ $1 == bushe ]] ; then object=("it smells like every other bush.") ; fi
if [[ $1 == box1 ]] ; then object=("the best smelling box you've ever smelled") ; fi
if [[ $1 == box2 ]] ; then object=("it smells worse than it tastes") ; fi
if [[ $1 == box3 ]] ; then object=("the box smells damp") ; fi
if [[ $1 == cabinet1 ]] ; then object=("Smells like the inside of a bathroom") ; fi
if [[ $1 == clock1 ]] ; then object=("smells like time flies") ; fi
if [[ $1 == chest1 ]] ; then object=("Smells covered in soot") ; fi
if [[ $1 == chair1 ]] ; then object=("smells like it is going to fall apart at any moment") ; fi
if [[ $1 == chair2 ]] ; then object=("smells like a fine chair") ; fi
if [[ $1 == corridor1 ]] ; then object=("You can smell something foul in the darkness.") ; fi
if [[ $1 == corridor2 ]] ; then object=("It smells indifferent") ; fi
if [[ $1 == corridor3 ]] ; then object=("You can smell nothing in the darkness") ; fi
if [[ $1 == cupboard1 ]] ; then object=("It smells dank") ; fi
if [[ $1 == curtains1 ]] ; then object=("They smell clean and fresh") ; fi
if [[ $1 == drive ]] ; then object=("it smells like concrete.") ; fi
if [[ $1 == doore ]] ; then object=("smells corrugated") ; fi
if [[ $1 == door ]] ; then object=("a mighty walnut, strong and sturdy.") ; fi
if [[ $1 == door2 ]] ; then object=("it smells clean.") ; fi
if [[ $1 == door3 ]] ; then object=("Smells nailed shut") ; fi
if [[ $1 == door4 ]] ; then object=("It smells like a door to a bathroom") ; fi
if [[ $1 == door5 ]] ; then object=("Smells like a bathroom door") ; fi
if [[ $1 == door6 ]] ; then object=("You can smell the fallen rain") ; fi
if [[ $1 == door7 ]] ; then object=("It smells of heat and decay") ; fi
if [[ $1 == door8 ]] ; then object=("It smells burnt") ; fi

if [[ $1 == fireplace1 ]] ; then object=("It smells as though it has been cold for a long time") ; fi
if [[ $1 == fireplace2 ]] ; then object=("The old stone fireplace is covered in soot") ; fi
if [[ $1 == floore ]] ; then object=("The grass smells fresh and green.") ; fi
if [[ $1 == floori ]] ; then object=("it smells of old carpet.") ; fi
if [[ $1 == floor2 ]] ; then object=("It smells like a bathroom floor") ; fi
if [[ $1 == floor3 ]] ; then object=("the tiles smell of soot") ; fi
if [[ $1 == floor4 ]] ; then object=("It smells of old dirt") ; fi
if [[ $1 == floor5 ]] ; then object=("it smells clean") ; fi
if [[ $1 == foreste ]] ; then object=("Smells like wood.") ; fi
if [[ $1 == gun ]] ; then object=("it smells like it hasnt been fired in a long time") ; fi
if [[ $1 == hammer ]] ; then object=("Smells like you can smash alot with this hammer") ; fi
if [[ $1 == hatch1 ]] ; then object=("It smells of cold iron covered in soot") ; fi
if [[ $1 == hedgee ]] ; then object=("Smells brambly.") ; fi
if [[ $1 == hob1 ]] ; then object=("the stove smells of ash and soot") ; fi
if [[ $1 == hole ]] ; then object=("It smells dank.") ; fi
if [[ $1 == housee ]] ; then object=("it smells like every outside of a house after
rain you have ever smelled.") ; fi
if [[ $1 == key ]] ; then object=("it smells of fine brass.") ; fi
if [[ $1 == light ]] ; then object=("it smells plastic") ; fi
if [[ $1 == lighter ]] ; then object=("Smells like there is still butane in it") ; fi


if [[ $1 == mail ]] ; then object=("it smells like steel.") ; fi
if [[ $1 == mirror1 ]] ; then object=("The wonderful smell of glass?") ; fi
if [[ $1 == painting1 ]] ; then object=("It smells defaced") ; fi
if [[ $1 == painting2 ]] ; then object=("It does smell like a quip about its subject") ; fi
if [[ $1 == peg ]] ; then object=("It smells of brass") ; fi
if [[ $1 == pendant1 ]] ; then object=("It smells cursed.") ; fi
if [[ $1 == rocke ]] ; then object=("Smells like rock.") ; fi
if [[ $1 == safe1 ]] ; then object=("Smells like secrets") ; fi
if [[ $1 == shede ]] ; then object=("Smells of steel") ; fi
if [[ $1 == stairs1 ]] ; then object=("Smells like stairs.") ; fi
if [[ $1 == table ]] ; then object=("smells of a fine vintage of oak, with a thick 
vainer of dust.") ; fi
if [[ $1 == toilet1 ]] ; then object=("Do you really go around smelling toilets?") ; fi
if [[ $1 == treee ]] ; then object=("Smells like wood.") ; fi
if [[ $1 == tub1 ]] ; then object=("Smells like a tub") ; fi
if [[ $1 == wall ]] ; then object=("smells of plaster.") ; fi
if [[ $1 == wall1 ]] ; then object=("Smells like a bathroom wall") ; fi
if [[ $1 == wall2 ]] ; then object=("Smells like fresh rain") ; fi
if [[ $1 == wall3 ]] ; then object=("the walls smell entirely of soot") ; fi
if [[ $1 == wall4 ]] ; then object=("Smells of steel") ; fi
if [[ $1 == wall5 ]] ; then object=("Smells like concrete.") ; fi
if [[ $1 == window ]] ; then object=("You can smell the fresh rain through the window.") ; fi
if [[ $1 == window1 ]] ; then object=("You can smell heat and decay through the window") ; fi
if [[ $1 == window2 ]] ; then object=("You can smell the fresh air through the window cleansing
the putrid air of the room.") ; fi
if [[ $1 == windowe ]] ; then object=("It smells clean") ; fi
if [[ $1 == wolf1 ]] ; then object=("you smell a the unmistakable stink of a wet animal.") ; fi


if [[ $2 == wolf ]] ; then if [[ $3 == 2 ]] ; then secondary=("You smell a wet animal in the forest.") ; fi ; fi
if [[ $4 == 1 ]] ; then secondary=("Smells unlocked") ; fi
if [[ $4 == 0 ]] || [[ $4 == 2 ]] ; then secondary=("Smells locked") ; fi

echo "$object
$secondary"
}

journal1(){

if [[ $1 == 1 ]] ; then object=("Do you want to play a game?") ; fi
if [[ $1 == 2 ]] ; then object=("Why won't she love me?") ; fi
if [[ $1 == 3 ]] ; then object=("Can I play outside?") ; fi
if [[ $1 == 4 ]] ; then object=("You hurt my friend, Now I'll hurt you.") ; fi
if [[ $1 == 5 ]] ; then object=("Yay Mr Hazzar made a new friend") ; fi
if [[ $1 == 6 ]] ; then object=("Stay out of my hiding place") ; fi
if [[ $1 == 7 ]] ; then object=("Don't listen to that monster.") ; fi
if [[ $1 == 8 ]] ; then object=("How Dare you take my precious") ; fi


sed -i "/^#journalb/i $object" status
}


#stockcommands----------------------------------------------------------

burnbooks4(){
echo "As you place the flame of the lighter beneath the
page, the fire resists to catch.  it would appear as though some
outside force is preventing you from burning the paper
at this moment."
}

lickme1(){
echo "this used to let you get your tongue cut off which would keep
you from ever licking anything ever again.  however as i am now 
implementing focus, it basically came down to one or the other.
and given the fact that my beta testers never tried licking anything
even when i told them explicitly to do it, i sincerely doubt many
people will ever see this text.  if you do, please post 
#letmelickmyselfgate on twitter."
}

uni(){
item=($2)
if [[ $1 == back ]] ; then object=("Unable to go back.") ; fi
if [[ $1 == book ]] ; then object=("It is a page of a journal.") ; fi
if [[ $1 == burn ]] ; then object=("you can not/ should not burn that.") ; fi
if [[ $1 == doorlock ]] ; then object=("the door is locked
it would take more than a wild beast to break it down.") ; fi
if [[ $1 == doorunlock ]] ; then object=("the door is unlocked.") ; fi
if [[ $1 == draft ]] ; then object=("you feel a draft from the window.") ; fi
if [[ $1 == far ]] ; then object=("it is too far away.") ; fi
if [[ $1 == get1 ]] ; then object=("you can not get that.") ; fi
if [[ $1 == get2 ]] ; then object=("you picked up the $item.") ; fi
if [[ $1 == get3 ]] ; then object=("you already have the $item.") ; fi
if [[ $1 == go ]] ; then object=("you can not go that way.") ; fi
if [[ $1 == help2 ]] ; then object=("Type help to get a list of commands.") ; fi
if [[ $1 == ic ]] ; then object=("Invalid Command.") ; fi
if [[ $1 == lick1 ]] ; then object=("you are not able to lick that.") ; fi
if [[ $1 == loadfail ]] ; then object=("In order to load a saved game,
you must exit to the main menu first.") ; fi
if [[ $1 == look ]] ; then object=("that can not be seen.") ; fi
if [[ $1 == place ]] ; then object=("you can not place that there.") ; fi
if [[ $1 == place2 ]] ; then object=("You dont have that to place.") ; fi
if [[ $1 == pass1 ]] ; then object=("You Pass this Turn.") ;fi
if [[ $1 == open ]] ; then object=("you can not open that.") ; fi
if [[ $1 == openwin ]] ; then object=("the window is nailed shut.") ; fi
if [[ $1 == read ]] ; then object=("you have no such book.") ; fi
if [[ $1 == sit ]] ; then object=("you go to sit and you feel an overwhelming sense of
urgency and you continue on your way.") ; fi
if [[ $1 == shoot1 ]] ; then object=("you shoot at it, and accomplish nothing.") ; fi
if [[ $1 == shoot2 ]] ; then object=("you are out of ammo.") ; fi
if [[ $1 == sleep ]] ; then object=("you should not sleep here.") ; fi
if [[ $1 == smash ]] ; then object=("that cannot /should not be smashed.") ; fi
if [[ $1 == smashmir2 ]] ; then object=("the mirror is broken.") ; fi
if [[ $1 == smashwin1 ]] ; then object=("the window is broken.") ; fi
if [[ $1 == smashwin2 ]] ; then object=("that cannot /should not be smashed.") ; fi
if [[ $1 == smell ]] ; then object=("you are not able to smell that.") ; fi
if [[ $1 == smellme ]] ; then object=("you don't smell bad, but you could smell better.") ; fi
if [[ $1 == wind ]] ; then object=("you can not wind that.") ; fi
if [[ $1 == whoami ]] ; then object=("I do not know.") ; fi
if [[ $1 == whoareyou ]] ; then object=("I am you, probably.") ; fi

echo "$object"
}


#debugstuff-------------------------------------------------------------


debugfill(){
echo "Inventory Filled"
}

debughelp(){
echo "type state <variable> to view the state of 
a variable.
type set <variable> = <number> to
set the variable
type move <block> - <cell> to change room
debugreload > reloads the cell file"
}

debugmove(){
echo "incorrect syntax to move to cell"
}

debugstate(){
debug1=("$1")
debug2=("$2")
debug3=("$3")
echo "global: $debug1=$debug2
local: $debug1=$debug3"
}


loadsave(){
echo "which file to $1
1) $2
2) $3
3) $4
4) $5
5) $6
c) cancel"
}

options1(){
echo "1) Travel Orientation
b) Back"
}

options2(){
echo "travel orientation
1) absolute
2) relative
b) back  "
}

options3(){
echo "orientation set to absolute"
}

options4(){
echo "orientation set to relative"
}

installer1(){
if [[ $1 == 1 ]] ; then output=("Welcome
If the screen isnt drawing right, you need a bigger terminal
window.  chances are though, if you are having that issue, you
are probably not seeing this message anyway.") ; fi
if [[ $1 == 2 ]] ; then output=("You probably dont want to use the music. it only
exists to prove that the engine can do it.  it requires
moc (music on console) as mplayer didnt work and moc
intigrates flawlessly.") ; fi
if [[ $1 == 3 ]] ; then output=('Thank you for downloading this wonderful game
it has been ${years} in the making (too many) and I hope you enjoy it.') ; fi
echo ' 
 
 
 
 
 '
echo "$output"
}

#about------------------------------------------------------------------

help1() {
echo "Help
Basic commands:

back : resets the room focus to default
get <item> : adds item to inventory
go <north/south/east/west> : goes that direction
# If there are multiple doors in one direction, then specify 
# if it is a door or a corridor or a hatch. etc
help : displays this
inventory : opens inventory dialog
journal : enters your journal
look : looks around room
look <direction> door : gives description of door
look <item> : look at item / object in room 
look inventory : displays inventory
place <item> <target>: places item into the target (puzzle mechanic)
open <object> : opens target
read <title> : use to read books
save : saves game
shoot : shoots object if you have a gun
smash <object> : lets you smash object
sleep <object> : thing you want to sleep on, is limited
wind <object> : winds object
exit : exits game to main screen

shortcuts
e : look key
t : get key
f : look lock
g : get book
h : help
q : look
r : read book
z : inventory

relative:
w : forward
s : back
a : left
d : right

absolute:
w : north
s : south
a : west
d : east

When in Inventory:

look <item> : give item discription
read <book> : lets you read books in you inventory
show : shows inventory
close : closes inventory

sometimes when you look at something, it will metion something else,
continue looking beyond!

Beware your greed, for it will consume you

type <debug help> for debug mode help"
}

journalhelp(){
echo "Just type to enter data into your Journal.  When you reach the
end of a line it will enter it into the journal.  if you want to end
early, then you can press enter.  Once you enter a line, you can no
longer remove it.  Remember, you are using a pen."
}

universalana(){
revver=2.00.00
read -p "##################################################
#              ;;;;;;;;;;;;;;;;;;;;              #
#            ;;;;;;;;;;;;;;;;;;;;;;;;            #
#           ;;...........;;;;;;;;;;;;;           #
#          ;;............. ;;;;;;;;;;;;          #
#         ;;;.............            ;;         #
#        ;;...............             ;;        #
#       ;;;...............              ;;       #
#       ;;..          ....    ;;;;;;;;;; ;;      #
#       ;;...       ......     ,,,,,,,   ;;      #
#       ;;..         .....    ,,     ,,  ;;      #
#       ,,,,    ##   ..  ,,,  ,       ,,,,,      #
#       ;;..    ##       ..,,,,  ()   ,  ;;      #
#       ;;..         ..  ...  ,,     ,,  ;;      #
#       ;;...       ...  ...   ,,,,,,,  ;;;      #
#       ;;............   ....           ;;;      #
#       ;;............   ....          ;;;;      #
#       ;;...........    .....         ;;;;      #
#       ;;................             ;;;;      #
#       ;;........        ;;;;;;;;;;   ;;;       #
#       ;;........        ;;;;;;;;;;   ;;;       #
#       ;;;.......        .......;;;  ;;;;       #
#        ;;;;;....        .......;;;; ;;;;       #
#          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        #
#           ;;;;;;;;;;;;;;;;;;;;;;;;;;           #
#            ;;;;;;;;;;;;;;;;;;;;;;;             #
#             ;;;;;;;;;;;;;;;;;;;;;              #
#                                                #
###################################              #
# Created by: Universal Analogue  #              #
# License: MIT                    #              #
#                                 #              #
# Fulmination Version $revver     #              #
##################################################"

}

readme() {
echo "Readme
A small Adventure game, written to try to find the limit
of what could be done with bash and coreutils.

Still not quite at the end yet.

# Riddles by fantasynamegenerators.com

looking forward to future projects,
please enjoy,
the universal analogue"
}


#inventory--------------------------------------------------------------

book11 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book11r
graphics=bookg
givenname=Sue Journal 1
exists=1"
}

book11r () {
echo "December 15th, 1941

Such a terrible thing, just a few days after our baby girl is born,
my beloved Steven goes and gets drafted.  I hope he teaches those
damn Japanese a lesson they wont forget.  I will wait for him forever.
....

The rest is torn off"
}

book12 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book12r
graphics=bookg
givenname=Sue Journal 2
exists=1"
}

book12r () {
echo "August 15th, 1942

My beloved Steven has sailed off to parts unknown to fight our
enemies.......

The rest is burned"
}

book13 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book13r
graphics=bookg
givenname=Sue Journal 3
exists=1"
}

book13r () {
echo "July 20th 1943

The worst news today, Stevens ship was torpedoed...
Hes gone, how can he be go....
...I'll never love agai......

The rest is too wet to read"
}

book14 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book14r
graphics=bookg
givenname=Sue Journal 4
exists=1"
}

book14r () {
echo "May 13th, 1946 

I have met the most wonderful man.  He just showed up at my door
to sell me a vacuum cleaner.  Of course I have one, but he 
doesn't need to know that.  Luckily he didn't see the brat,
she just wont shut up about when her daddy's going to come home.
If only I didn't have her, then this Stanley would be mine.
I think she's been writing in my journal again, going to have
to keep it out of her reach..."
}

book15 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book153r
graphics=bookg
givenname=Sue Journal 5
exists=1"
}

book15r () {
echo "February 15th, 1947

Stanley's been coming over a lot lately.  I just keep finding
odd jobs around the house, and he keeps coming to do them.
I find myself breaking things just to have him come over.
He said he enjoys tinkering, he apparently fixed tanks for the 
British during the war.  I just have to keep the brat upstairs 
to keep her from scaring him off."
}

book16 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book16r
graphics=bookg
givenname=Sue Journal 6
exists=1"
}

book16r () {
echo "April 23rd, 1948

Stanley finished putting in the window from the kitchen into
the second dining room.  Just as he was finishing the brat
must have broken out of the room some how.  She came downstairs
and asked Stanley if he was her father.  When he said no, she 
started to scream.  I slapped her something she wouldn't forget."
}

book17 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book17r
graphics=bookg
givenname=Sue Journal 7
exists=1"
}

book17r () {
echo "September 15th, 1948

My Dearest Stanley is moving in today!  He said he just can't
live without me!  I don't think i could live without him either.
Caroline has finally learned to stay out of our way. I've seen her
talking to this wolf looking thing by the fence before, going to
have to have Stanley chase that thing away."
}

book18 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book18r
graphics=bookg
givenname=Sue Journal 8
exists=1"
}

book18r () {
echo "June 3rd, 1951

Julia was acting weird today again.  The doctor says its normal,
that she just has an active imagination. I would hardly call
what she does normal.  The neighbors are going to start to talk at
this rate. Stanley says he is going to put up a hedgerow around the
house so they wont be able to see her at least...

The rest seems to have been torn out."
}

book19 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book19r
graphics=bookg
givenname=Sue Journal 9
exists=1"
}

book19r () {
echo "November 24th, 1951

The Hedgerows that Stanley put have helped the rumors for now,
however Caroline's behavior has continued to get worse ...
.. I don't know where she even got the squirrel ...
.. only its head was left...

The rest is unintelligible" 
}

book110 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book110r
graphics=bookg
givenname=Sue Journal 10
exists=1"
}

book110r () {
echo "January 3rd, 1952

My dearest Stanley, Not my dearest Stanley.  There was just so 
much blood..... I know it was her, she was alway jealous. the police
wouldn't believe she did it.... i just know she did."
}

book111 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book111r
graphics=bookg
givenname=Sue Journal 11
exists=1"
}

book111r () {
echo "April 14th, 1952

I turned the oven on, and lit the fireplace in the kitchen.
I tricked her in there, then locked the door behind her.
She screamed and screamed, But shes gone now.
Shes gone now.. I can still hear the screaming...
It never ends...  how can the screaming still be there if shes gone?"
}

book112 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book112r
graphics=bookg
givenname=Sue Journal 12
exists=1"
}

book112r () {
echo "March 18th, 1964

I can still hear the screaming at night.  I've boarded up the door
to the kitchen, now she cant get out, thats right, she cant,
she'll have to stay there forever, away from me and my Stanley,
My perfect perfect perfect perfect wonderful Stanley......


It breaks down into ramblings "
}

book113 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book113r
graphics=bookg
givenname=Sue Journal 13
exists=1"
}

book113r () {
echo "July 11th, 1966

I looked through my diary today, and theres writing in it,
writing I didn't put there.  I don't know how, but I think shes
in the book.  Shes coming to get me.  After all I did for her,
shes coming to get me. I have to destroy the book, I have to kill her
before she gets me, I cant let her take me away from my Stanley again.
Not again, Not again, Never again Never Never Never NEVER NEVER NEVER 
NEVER NEVER NEVER NEVER NEVER NEV....."
}

book21 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book21r
graphics=bookg
givenname=Stanley Journal 1
exists=1"
}

book21r () {
echo "July 3rd, 1942

It seems luck is on my side, I got transfered out of Tobruk a
few days before it fell.  I suppose a hospital bed in Cairo is 
better than a prisoner camp in Libya.  Do wish my leg weren't 
quite so broken though, I would like to give Rommell a good
piece of my mind...."
}

book22 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book22r
graphics=bookg
givenname=Stanley Journal 2
exists=1"
}

book22r () {
echo "May 15th, 1945

Its finally over.  I'm not quite sure what to do with myself.
The war is the only thing I've thought about since '39.
I hear my cousin out in America has a company selling vacuum
cleaners. I might just go see him about that"
}

book23 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book23r
graphics=bookg
givenname=Stanley Journal 3
exists=1"
}

book23r () {
echo "May 15th, 1946 

I met the most delightful lady today.  She was living all by
her lonesome in this big mansion.  Must be nice to have so much
money.  she said she would be most happy to have me over again,
I just might have to take her up on that"
}

book24 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book24r
graphics=bookg
givenname=Stanley Journal 4
exists=1"
}

book24r () {
echo "February 16th, 1947

Ive been spending more and more time over at Susan house.
I can never quite stray for long.  She seems quite lonely.
I hear noises coming from up stairs, but she says its just
the old house creaking.  I don't think houses giggle or cry though..."
}

book25 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book25r
graphics=bookg
givenname=Stanley Journal 5
exists=1"
}

book25r () {
echo "April 25th, 1948

I had just finished putting in a new window into the Susan
kitchen, when i finally found out what all the noise was
up stairs.  a tiny little girl, no more than six or seven
walked up to me and asked me if i was her long lost father.
Of course I wasn't and answered in kind.  The poor thing had started 
to ball when Sue whipped around the corner and dragged her off.
when Sue came back, she apologized and I told her it was ok...."
}

book26 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book26r
graphics=bookg
givenname=Stanley Journal 6
exists=1"
}

book26r () {
echo "September 5th, 1948

Susan asked me to move in with her today.  I said yes of course,
because what man wouldn't want to move into a mansion with a 
beautiful woman.  I do think she is a bit too harsh with Caroline.
She has the poor girl so worked up she just stands around behind
corners watching, or just talks to herself.  There is this really
creepy wolf that likes to hang out by the fence.  Its a good thing
that i kept that revolver that Pole Chekhov gave me back in Beda Fomm."
}

book27 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book27r
graphics=bookg
givenname=Stanley Journal 7
exists=1"
}

book27r () {
echo "November 26th, 1951

I think i have gotten myself a bit over my head here.  I'm beginning
to think that Susan is a bit unstable.  On top of that,
Caroline keeps bringing animals into the house....
I don't know if they were like that when she found them though....
.. haven't seen things like that since the war.."
}

book28 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book28r
graphics=bookg
givenname=Stanley Journal 8
exists=1"
}

book28r () {
echo "December 24th, 1951

I was out by the shed getting some wood for the fire, when this wolf
came after me,  if i hadn't had my revolver i would be dead.  it got
away, but those eyes... there were so many of them...  i had heard
of wolves like that back in Wales, but i thought they were just
Pagan legends.  I told Caroline to stay in, but she just snarled and
walked away mumbling to herself.  Her mother really ought to have
a talk with her....."
}

book31 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book31r
graphics=bookg
givenname=Caroline Journal 1
exists=1"
}

book31r () {
echo "December 20th, 1945

I love my mommy.  I don't know why she is so sad so much.
I want to make mommy happy.  I met a a new friend named Mr
Hazzal.  He taught me how to write.
He said that if i listen to him i can make mommy happy."
}

book32 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book32r
graphics=bookg
givenname=Caroline Journal 2
exists=1"
}

book32r () {
echo "April 30rd, 1948

Why is mommy so mean.  all she ever does is yell at me and lock me 
up in the ceiling.  its all that mans fault.  he's trying to take 
mommy away from me.  I'll show him.  Mr Hazzal taught me about books.
lots of things about books.  how to read them.  how to make them.
and how to use them to make bad people go away....

The hand writing is barely legible."
}

book33 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book33r
graphics=bookg
givenname=Caroline Journal 3
exists=1"
}

book33r () {
echo "September 17th, 1948

Now that mommy let that bad man in the house, she wont let me
play around the house any more.  Every time I go out to play
with mr Hazzal she yells at me, but i tell her hes a good woofie.
she keeps telling me shes going to have Stanley shoot him.  
I wont let that happen."
}

book34 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book34r
graphics=bookg
givenname=Caroline Journal 4
exists=1"
}

book34r () {
echo "January 15th, 1950

I've started sleeping during the day, so I can sneak out at night to
learn from Mr Hazzal.  I stole mommies clock key so i can hide
in her secret cupboards when she is looking for me. I hide it in the 
big tree in the yard I have to learn as much as i can so that i can 
have my mommy back.He taught me all about books, and there power.
I just need blood.  Lots and Lots of blood."
}

book35 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book35r
graphics=bookg
givenname=Caroline Journal 5
exists=1"
}

book35r () {
echo "September 17th, 1951

Mommy had that bastard Stanley put up hedges around the fence
to keep me away from Mr Hazzal.  Now i just meet him in the woods
behind the house.  I think she knows what i'm up to, but she
cant stop me now.  I just need more blood."
}

book36 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book36r
graphics=bookg
givenname=Caroline Journal 6
exists=1"
}

book36r () {
echo "January 5th, 1952

Ive done it!  Just like Mr Hazzal said!  I gave the book to that
bastard, and the pages ripped right out and tore him into a bunch
of little pieces.  now he'll never get between me and my mommy.
I've never been so happy!"
}

book37 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book37r
graphics=bookg
givenname=Caroline Journal 7
exists=1"
}

book37r () {
echo "April 13th, 1952

I told mommy she doesn't need that loser anymore, she has me.
Buy all she does all day is sit around and cry.  mommy needs
to stop crying.  Mommy just needs to be happy.  I'm all
she needs..."
}

book38 () {
echo "#looka
It seems to be a page of a journal.
#lookb
read=book38r
graphics=bookg
givenname=Caroline Journal 8
exists=1"
}

book38r () {
echo "April 14th, 1952

Why did she.............. I love her so.......
its just so hot........... cant breat......why......
i yell for Mr Hazza...........Why she lock me in h.....
i have to move qui......use my bloo.......do what h.....
put mysel..in.....ook......

Most of the page is burned away"
}               

bookg(){
./utils.sh overlay book14 59 12 0 0 
}

ammo () {
echo "#looka
They are solid silver 38S&W.
#lookb
read=null
graphics=ammog
givenname=Ammo
exists=1"
}

ammog(){
./utils.sh overlay ammo1 59 10 0 0 
}

gun () {
echo "#looka
It is an Enfield NO2 revolver in 38S&W.
#lookb
read=null
graphics=gung
givenname=Gun
exists=1"
}

gung(){
./utils.sh overlay gun1 56 10 0 0 
}

hammer () {
echo "#looka
It is an old weathered ball peen hammer.
#lookb
read=null
graphics=hammerg
givenname=Hammmer
exists=1"
}

hammerg(){
./utils.sh overlay hammer2 60 10 0 0 
}

light () {
echo "#looka
It is a dynamo powered flashlight.
#lookb
read=null
graphics=lightd
givenname=Light
exists=1"
}

lightd(){
./utils.sh overlay light1 58 11 0 0 
}

lighter () {
echo "#looka
It is an old flip cap lighter
#lookb
read=null
graphics=lighterd
givenname=Lighter
exists=1"
}

lighterd(){
./utils.sh overlay lighter1 60 9 0 0 
}

pendant () {
echo "#looka
It is a mysterious pendant you found in a
secret panel.  You do not know why, but you get
the feeling you were better off never finding it.
#lookb
read=null
graphics=pendantd
givenname=Pendant
exists=1"
}

pendantd(){
./utils.sh overlay pendant1 60 8 0 0 
}

key1 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key3
givenname=Key 1
exists=1"
}

key2 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key4
givenname=Key 2
exists=1"
}

key3 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key5
givenname=Key 3
exists=1"
}

key4 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key6
givenname=Key 4
exists=1"
}

key5 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key7
givenname=Key 5
exists=1"
}

key6 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key8
givenname=Key 6
exists=1"
}

key7 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key9
givenname=Key 7
exists=1"
}

key8 () {
echo "#looka
It is a small brass key.
#lookb
read=null
graphics=keya key10
givenname=Key 8
exists=1"
}

keya() {
./utils.sh overlay keyp 56 8 0 0
./utils.sh overlay $1 62 12 0 0
}

keyb() {
./utils.sh overlay lockp 56 8 0 0
./utils.sh overlay $1 62 8 0 0
}

clockkey () {
echo "#looka
It is a small brass key to wind a clock.
#lookb
read=null
graphics=clockkeyg
givenname=Clock Key
exists=1"
}

clockkeyg () {
./utils.sh overlay keyc 56 8 0 0
}

cog () {
echo "#looka
It is a small cog from a clock.
#lookb
read=null
graphics=cogg
givenname=Cog
exists=1"
}

gear () {
echo "#looka
It is a small gear from a clock.
#lookb
read=null
graphics=cogg
givenname=Gear
exists=1"
}

cogg () {
./utils.sh overlay cog1 60 10 0 0
}

mainspringbarrel () {
echo "#looka
It is the mainspring barrel from a clock.
#lookb
read=null
graphics=mainspringbarrelg
givenname=Main Spring Barrel
exists=1"
}

mainspringbarrelg () {
./utils.sh overlay mainspringbarrel1 60 10 0 0
}

sprocket () {
echo "#looka
It is a small sprocket from a clock.
#lookb
read=null
graphics=sprocketg
givenname=Sprocket
exists=1"
}

sprocketg () {
./utils.sh overlay sprocket1 57 10 0 0
}

journal () {
echo "#looka
It is a tattered old journal that you write in.
#lookb
read=null
graphics=journalg
givenname=Journal
exists=1"
}

journalg(){
./utils.sh overlay book15 57 8 0 0 
}

pen () {
echo "#looka
It is an internal reservoir fountain pen.
#lookb
read=null
graphics=peng
givenname=Pen
exists=1"
}

peng(){
./utils.sh overlay pen1 62 13 0 0 
}













$1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12}
