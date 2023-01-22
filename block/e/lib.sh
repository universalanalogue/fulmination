#!/bin/bash


burnhouse2(){
echo "You're the direct type arn't you? The house is set 
ablaze, and with it, the ghost, and anything else which might
be of harm to you.  Now the force keeping the gate closed is 
gone, you are free to leave and go wherever you wish.
Congratulations, you have survived the whole ordeal!
You have won!"
}

#wolfstuff--------------------------------------------------------------


wolf1(){
if [[ $1 == 1 ]] ; then object=("as you run north towards the wolf") ; fi
if [[ $1 == 2 ]] ; then object=("as you run south away from the wolf") ; fi
if [[ $1 == 3 ]] ; then object=("as you run west away from the wolf") ; fi
if [[ $1 == 4 ]] ; then object=("as you try to open the door") ; fi
if [[ $1 == 5 ]] ; then object=("as you gaze around") ; fi
if [[ $1 == 6 ]] ; then object=("as you marvel at the worksmanship of the door") ; fi
if [[ $1 == 7 ]] ; then object=("as you look to the east") ; fi
if [[ $1 == 8 ]] ; then object=("as you look to the north") ; fi
if [[ $1 == 9 ]] ; then object=("as you look to the south") ; fi
if [[ $1 == 10 ]] ; then object=("as you look to the west") ; fi
if [[ $1 == 11 ]] ; then object=("as you look at the floor") ; fi
if [[ $1 == 12 ]] ; then object=("as you look at the forest") ; fi
if [[ $1 == 13 ]] ; then object=("as you look at the house") ; fi
if [[ $1 == 14 ]] ; then object=("as you look at the shed") ; fi
if [[ $1 == 15 ]] ; then object=("as you look at the wolf") ; fi
if [[ $1 == 16 ]] ; then object=("as you pull the trigger, nothing happens") ; fi
if [[ $1 == 17 ]] ; then object=("as you contemplate why you cant do that") ; fi
if [[ $1 == 18 ]] ; then object=("as you try to lick the door") ; fi
if [[ $1 == 19 ]] ; then object=("as you try to lick the floor") ; fi
if [[ $1 == 20 ]] ; then object=("as you try to lick the forest") ; fi
if [[ $1 == 21 ]] ; then object=("as you try to lick the shed") ; fi
if [[ $1 == 22 ]] ; then object=("as you try to smell the door") ; fi
if [[ $1 == 23 ]] ; then object=("as you try to smell the floor") ; fi
if [[ $1 == 24 ]] ; then object=("as you try to smell the forest") ; fi
if [[ $1 == 25 ]] ; then object=("as you try to smell the shed") ; fi
if [[ $1 == 26 ]] ; then object=("as you try to smell the wolf") ; fi
if [[ $1 == 27 ]] ; then object=("as you fumble through your pack") ; fi
if [[ $1 == 28 ]] ; then object=("as you stick your tounge out to lick yourself") ; fi
if [[ $1 == 29 ]] ; then object=("as you try to smell yourself") ; fi
if [[ $1 == 30 ]] ; then object=("as you ponder the meaning of life") ; fi
if [[ $1 == 31 ]] ; then object=("as you grip at the air") ; fi
if [[ $1 == 32 ]] ; then object=("as you try to walk") ; fi
if [[ $1 == 33 ]] ; then object=("as you try to gaze") ; fi
if [[ $1 == 34 ]] ; then object=("as you ponder what it tastes like") ; fi
if [[ $1 == 35 ]] ; then object=("as you pull the trigger, and nothing happens") ; fi
if [[ $1 == 36 ]] ; then object=("as the bullet flies off into the great beyond") ; fi

if [[ $1 == 37 ]] ; then object=("as you stick your nose in the air") ; fi

if [[ $1 == 38 ]] ; then object=("as you try to walk") ; fi

if [[ $1 == 39 ]] ; then object=("as you try to walk") ; fi

if [[ $1 == 40 ]] ; then object=("as you try to walk") ; fi

echo "$object, the wolf eats you" 
}

wolf2(){
if [[ $1 == 1 ]] ; then object=("there is a wolf approaching you from the north") ; fi
if [[ $1 == 2 ]] ; then object=("The silver bullet ripped into the the wolf.
It slumpped over and disolved into the air.") ; fi
if [[ $1 == 3 ]] ; then object=("you shoot at it and miss") ; fi
if [[ $1 == 4 ]] ; then object=("you fumble through you pack, but you can't focus as
the wolf impedes on you") ; fi

echo "$object"
}

wolf3(){
if [[ $1 == 1 ]] ; then object=("As you fumble through your pack unable to focus") ; fi
if [[ $1 == 2 ]] ; then object=("You stop as you try to lick yourself,") ; fi

echo "$object,
the wolf impeades on you "
}

lickwolf1(){
echo "Suddenly, the wolf stops in its tracks.  It says; 'Hello.
My name is Hazzal.  I come from the hills of Caledonia.
King Georges lobster backs destroyed my home. I came to these woods
far off to avoid the humans, however they followed me even here.
But the girl, the girl was different.  she didn't seek to destroy
me, she just wanted to be my friend."
}

lickwolf2() {
echo "Her mother though, was just like all the others.
so I decided to play a little game.  I taught the girl to see the
world for what it is, and how to use it.  of course the girl used
that to try to kill that she witch.  Too bad the woman got her
first.  Now the girl just continues to persist over this forsaken
estate.  she truly learned the arts of writing, and has embedded
herself into those scraps of paper you carry.  Perhaps if they
ceased to exist, so would she.' Then the wolf disappears."
}


#greyroot----------------------------------------------------------------

smashent(){
echo 'the hammer makes contact with the large oak, and suddenly
it springs to life.
"YOU DARE STRIKE ME MORTAL?" the ent shouts.
"I SHALL TEACH YOU A LESSON YOU WONT EVER FORGET."
He then grabs you and puts you in his mouth.
You are dead'
}

entfriend(){

if [[ $1 == 1 ]] ; then object=("The tree's eyes open as its arms lower.  its eyes
fall upon yoyu. Hello Friend, I am called Greyroot.") ; fi
if [[ $1 == 2 ]] ; then object=("I shall give you another chance at this one.") ; fi
if [[ $1 == 3 ]] ; then object=("I see you have killed Hazzal.
I have often told him he was too aggressive with humans") ; fi
if [[ $1 == 4 ]] ; then object=("i see you have made friends with
Hazzal.  beware, he is far to direct in
his dealings with humans.  i would not trust him,
for he lies, and he will take anything he sees fit.") ; fi
if [[ $1 == 5 ]] ; then object=("i have been made the keeper of some
knowledge by an angry spirit.  I will give you the knowledge if you
can answer me, these riddles three.") ; fi
if [[ $1 == 6 ]] ; then object=("The more you take away from it,
the larger it becomes. What is it?") ; fi
if [[ $1 == 7 ]] ; then object=("i last forever and you might have too much or
too little of me, either way you will run out of me eventually.
What am i?") ; fi
if [[ $1 == 8 ]] ; then object=("if i have it, i shouldn't share it, because if
i share it, i won't have it. What is it?") ; fi
if [[ $1 == 9 ]] ; then object=("indeed secrets cease to be secrets
once they have been shared, however i fear how things are
progressing.  You must destroy all knowledge to escape this madness.") ; fi
if [[ $1 == 10 ]] ; then object=("Go forth and stop this madness.") ; fi
echo "$object"
}

greyrootmisc(){
if [[ $1 == incorrect ]] ; then object=("You are incorrect") ; fi
if [[ $1 == correct ]] ; then object=("You are correct") ; fi
if [[ $1 == unknown ]] ; then object=("There is no shame in admiting a lack of knowledge,
come back once you have had some time to think it over.") ; fi
if [[ $1 == slump ]] ; then object=("Greyroot slumps back to his resting state") ; fi
if [[ $1 == smell ]] ; then object=("Greyroot says: do not smell me") ; fi
if [[ $1 == tree1 ]] ; then object=("It is a large oak tree, with words inscribed on it") ; fi
if [[ $1 == tree2 ]] ; then object=("It is a large ent, it eagerly awaits your answers") ; fi
if [[ $1 == lick ]] ; then object=("Greyroot says:'Do not lick me.'") ; fi

echo "$object"
}










$1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12}
