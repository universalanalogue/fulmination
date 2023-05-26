#!/bin/bash






burnbooks2(){
echo 'You toss every scrap of paper and your journal you have
into the fireplace with your lighter.  The pages light up 
instantaneously.  The apparition shrieks; "You think that is enough
to stop me?" as she devours your soul.'
}

burnbooks3(){
echo "you toss the papers into the fireplace with the lighter, and
they burst up into a bright purple flame.  the ghost cries out in 
agony and melts into the floor.  she is gone.  you crawl through
the window and continue through the house.  the entire foreboding
feeling of the house has disappeared.  you look though a window on
the way out as you see the light of morning coming on.  you leave the
building and walk to the gate.  as you touch it the gate swings open
to the wide world.  you walk down the street towards
your next adventure."
}


burnhouse1(){
echo "You're the direct type arn't you? Well the house
is gone, but so are you.  Turns out setting a house on fire,
then standing in it with a dumb look on your face is not the
best course of action, try a little harder next time.
You are dead"
}

bathroom1() {
echo "As you open the door and enter, you see a mirror.
It is your reflection, but it isn't.  You cant seem to
remember your gender or what you looked like, but it sure
as hell isn't this.  Your face is worn, your eyes are heavy,
and your hair is white and stringy." 
}

bathroom2(){
echo "As one last crack of thunder bursts, shaking the
house violently, the rain begins to subside.  
As the walls creak and grown, your feeling of 
uneasiness begins to ease into increasing worry and dread."
}

toiletlick3() {
echo "Fine, I hope that feeling of independence is worth it,
you now have the feeling of dysentery. The good news is you are 
in a bathroom.  the bad news, the water isn't running.  Your 
insides run away from you, and you eventually die of dehydration.
You are Dead "
}

sit2(){
echo 'As you sit in the chair your weight causes the chair to
crumble. Unfortunately as you hit the ground, the back of the chair
splinters and impales your chest.

You Are Dead'
}

i1a() {
echo "as you walk down the corridor, it is as if the darkness
itself consumes your flesh, you try to scream out, but the
darkness eats your cries.

you have died..."
}

i8a() {
echo "as you walk outside, you feel the sharp rain on your face.
As you walk you begin to realize you cant see where you are going.
you turn back to return where you came from, but you cant see
the house anymore.  the rain starts to pour harder as you begin
to hear steps behind you.  you call out for help, and the steps
become a gallop.  the last thing you feel is the icy sharp fangs
clamping around your neck.

you have died..."
}

i19a(){
echo "As you look up a the painting the necklace begins to glow.
The faceless woman seems to get closer and closer to you.  You try to
pull away, but its arms grasp your head and drags you in until you
are just looking out into the room.  "
}

i19b(){
echo "The necklace slides itself out of the room towards the stairs.
Your flashlight begins to dim until all you see is a blackness that
goes on forever"
}

smellbody1 (){
echo "the body clearly expired long ago, however it
was fairly well preserved from the room being sealed,
and all of the air cooked out."
}



sleep1() {
echo "you lie your head on the pillow for a well 
deserved rest.  you hope that once you awake,
this whole ordeal will be behind you. Morning has to come
at some point, and when it does, you hope to awake in your 
own bed.  As your eyes open once more, you feel well
rested, but you are still where you fell asleep.
In the dark...."
}

sleep2() {
echo "the passage of time has not been kind, and you
once again seek the warmth of a bed.  this time you
have no high hopes as you did the last time.  this is your
life, and you must now live it out.  you begin to reflect
on the journals you have read.  you wonder what these people
were really like.  as you once again arise,
you hope to end this nightmare soon."
}

sleep3() {
echo "you once again seek the seclusion and security of a
warm bed.  your mind once again begins to wander.  why are all 
these bedrooms so well furnished and maintained? Why are all
the bookshelves burnt?  What does it mean.  What was Susan
doing here, and what can you do against forces such
as these.  as your mind clears, you eyes open, and you face
this world once more."
}

sleep4() {
echo "you are frightened. you have noticed that the time 
you have been sleeping has been increasing, and likewise the 
time you spend in the waking nightmare has been decreasing.
you are unsure if you will be able to sleep again, let alone
awake once more.  you have to end this soon, because you might
not get another chance."
}

sleep5() {
echo "you made it, but you don't know how.  you once again see
your only friend in this waking hell.  as your knees hit the floor
from exhaustion, you drag yourself into the bed.  you see the
darkness come for you again, to consume you.  you hope the bed
will shelter you, as it has so many times before.  the darkness
crawls up the side of the bed after you as you cower beneath the
covers.  death has come for you and you have no where left to hide.
You have Died."
}

sleepdeath1() {
echo "As you take a step, you feel your legs go out from
under you, and you move no more. you here shrill laughter
from far off as your vision fades to nothing.  time
begins to blur as the laughter becomes louder and louder.
Finally everything goes away to never return again.
You have died."
}

sleepwarn1() {
echo "your brow begins to feel heavy
you start to wonder where there might be a bed"
}

sleepwarn2() {
echo "your feet now start to drag.  you start
to yearn for the warm embrace of a bed."
}

sleepwarn3() {
echo "your whole body begins to wane.  your eyes
find it hard to focus and your feet follow behind you
you feel it is a terrible night for a curse."
}


windowfall() {
echo "You jump to safely.  unfortunately you have misjudged your own
durability.  your knees shatter as your feet touch the ground.
as your back reaches the ground, it shatters as well.  now begins
the weighting game as hunger sets in.  no one is coming to save
you, just as no one was before.  as the days pass by, you become
weaker and weaker, just waiting for the inevitable. eventually
it comes.
You are Dead"
}




























#ghoststuff-------------------------------------------------------------

ghost1(){

if [[ $1 == burn ]] ; then libindex=('the apparition shrieks "Ghosts do not burn fool" as
she descends upon you.
You are dead') ; fi

if [[ $1 == lick1 ]] ; then libindex=("You point your tongue at the specter and walk forward.
Her maw opens and swallows you whole.") ; fi

if [[ $1 == lick2 ]] ; then libindex=('you stick your tongue out to lick yourself, and 
the apparition grimaces.  even though she is sickened, she
still rips you to pieces and eats you.  after all
you clearly showed her that you thought you tasted good
You are dead') ; fi

if [[ $1 == lick3 ]] ; then libindex=("You are not aware if such a thing exists to be licked,
however you do not feel it is an appropriate juncture to lick that.") ; fi

if [[ $1 == look ]] ; then libindex=("It is the ghost of a young girl.  She looks like she died
an unpleasant death.") ; fi

if [[ $1 == look2 ]] ; then libindex=("You do not notice if such a thing exists,
as your attention is focused on the ghost in front of you") ; fi

if [[ $1 == pendant ]] ; then libindex=('The specter suddenly shrieks out, "YOU STOLE MY AMULET!
YOU SHALL NOT LEAVE HERE ALIVE, OR OTHERWISE." She then rips the
amulet from your being, and kills you.
You are Dead.') ; fi

if [[ $1 == returnwest ]] ; then libindex=('as you turn to step out through the window once more
an apparition appears.  the force of its presents pushes you back to
the fireplace;  "so you have finally come to finish me" it states
"you shall have no luck of it"') ; fi

if [[ $1 == shoot1 ]] ; then libindex=('The bullet passes right through the apparition.
She shrieks; "Your pathetic toys can not harm me!" she then 
devours you whole.
You are Dead') ; fi

if [[ $1 == shoot2 ]] ; then libindex=('You pull the trigger to an unsatisfying click.
A smile runs across her face. she then devours you whole.
You are Dead') ; fi

if [[ $1 == smash ]] ; then libindex=('The hammer passes right though the apparition.  As the hammer
continues to fall, its arch takes it right to your knee, which is now 
shattered.  Unable to move,the ghost eats you.
You are dead') ; fi

if [[ $1 == smell ]] ; then libindex=('Smells like a ghost.
She responds "Did you really just smell me?" with a confused look
on her face') ; fi

if [[ $1 == smell2 ]] ; then libindex=("you are not aware if such exists to smell, however you do not feel
it is appropriate at this juncture to smell that.") ; fi

if [[ $1 == walk ]] ; then libindex=('you attempt to walk through the ghost to get to the
window to escape your certain doom.  the ghost shrieks "You think
you can ignore me?"  Then eats you.
You are dead') ; fi

echo "$libindex"
}




ghosttalk(){
echo 'She Shrieks to you "I shall get you for what you did to me!"
she then devours you
You are dead'
}

slcom(){
sleepthreshold=$(grep 'sleepthreshold=' status | cut -d "=" -f2)
output=$(./utils.sh form 1)
case1="$1"
if [[ "$case1" == "sleep" ]] ; then case1="gobed" ; fi
if [[ "$case1" == "sleepbed" ]] ; then case1="gobed" ; fi
sleep=1
intro=2
case $case1 in
[g][o][b][e][d]) if [ $sleepthreshold -eq 10 ]
then
./utils.sh colorset 2
./utils.sh cutscene i sleep5 Death logo
./utils.sh setdeath
fi
if [ $sleepthreshold -eq 50 ]
then
./utils.sh cutscene i sleep4 Sleep logo
sleep=10
sleepthreshold=10
intro=0
fi
if [ $sleepthreshold -eq 75 ]
then
./utils.sh cutscene i sleep3 Sleep logo
sed -i "/book33=/c\book33=0" status
sleep=50
sleepthreshold=50
intro=0
fi
if [ $sleepthreshold -eq 100 ]
then
./utils.sh cutscene i sleep2 Sleep logo
sed -i "/book110=/c\book110=0" status
sleep=75
sleepthreshold=75
intro=0
fi
if [ $sleepthreshold -eq 200 ]
then
./utils.sh cutscene i sleep1 Sleep logo
sed -i "/book24=/c\book24=0" status
sleep=100
sleepthreshold=100
intro=0
fi 
sed -i "/intro=/c\intro=$intro" status
sed -i "/sleep=/c\sleep=$sleep" status
sed -i "/sleepthreshold=/c\sleepthreshold=$sleepthreshold" status
esac

}
































$1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12}
