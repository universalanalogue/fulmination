# Fulmination
Scriptures of Fulmination, or how I learned to stop worrying, and just love urxvt.

## Requirements
1) Bash -ge 4
2) gnu-coreutils
3) sed (of the gsed variety, default in linux)
4) git (ease of downloading the game)
5) 74x42 monospace characters terminal (would probably have it be atleast 75x43 in case of
   overrun in proccessing)
6) an ssh client if playing over ssh.

7) a serial terminal client if playing over serial -ge 9600buad.

8) a terminal emulator if playing in a gui.

9) a monitor and keyboard if playing on local console.

10) some storage medium to store the game.  game will fit and run on a 1.44mb floppy,
you have to move the game without gitfiles for it to fit. floppy must be ext2

11) At least a 40MHz processor, with at least 128mb of system ram (Min Req for Linux/ tested)
##### As a note, when running down at 40mhz, the game will allow you to cache commands while it loads, which is an interesting thing, as that shouldn't be even possible

## Installation
>LINUX
1) git clone https://github.com/universalanalogue/fulmination.git

2) chmod +x -R fulmination ; cd fulmination

3) run ./start.sh to play the game.

4) Enjoy

5) if you dont enjoy, please give feedback so I know what doesn't work for the next game.

6) report bugs so I can fix them.

>FREEBSD
1) Have bash, gsed, gawk, and coreutils installed

2) git clone https://github.com/universalanalogue/fulmination.git

3) chmod +x -R fulmination ; cd fulmination

4) reffiles/./bsd.sh

5) rest the same as linux.

>MACOS

1) Install bash, gsed, gawk, coreutils, and git from homebrew

2) Rest the same as FREEBSD

>Windows

This is ill advised as performance is very slow

1) Install Cygwin

2) Be sure you install git during the install

3) Rest the same as Linux

## Walkthrough
A rough walkthrough can be found in reffiles/cellplot.txt.  It is a design document so it really isn't
layed out like a walkthough, but it has the maps, the item locations, and all the item dependacies.

## ToDo

## Music
Whenever I either get talented enough to make music, or
happen to aquire some music, I will finish setting up the music subsystem

## get update working
currently update function does not work at all.  this should now be less of an issue with the way the game
works and installs.  You should just be able to download the new version and hand copy over your save games.
this could run the risk of not having a properly patched saved game so I am working on this.

## Credits

Riddles by fantasynamegenerators.com

Dedicated to my co workers who told me I couldn't do it.
