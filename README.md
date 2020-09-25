# Fulmination
Scriptures of Fulmination, or how I learned to stop worrying, and just love urxvt.

# Requirements
1) Bash -ge 4
2) gnu-coreutils
3) sed (of the gsed variety, default in linux)
4) moc/mocp/music on console player. (only for music and there currently
   isn't any, so its not really needed yet)
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

# Installation
>LINUX
1) move to the directory after it downloads/unpacks.

2) it might require a chmod +x -R * . I am unsure as I load the files out of a local directory.
 
3) run ./mkbld.sh to install the program.

4) run ./start.sh to play the game.

5) Enjoy

6) if you dont enjoy, please give feedback so I know what doesn't work for the next game.

7) report bugs so I can fix them.  I consider this to be a production level game, however
   my beta testers either didn't understand adventure games or were me.  Should be less
   glitchy than the day one Assasins Creed Unity.

>FREEBSD
1) Have bash installed and linked to /bin/bash (ln /usr/local/bin/bash /bin/bash)

2) have gsed installed

3) have gawk installed

4) move to the directory after it downloads/unpacks.

5) it might require a chmod +x -R * . I am unsure as I load the files out of a local directory.

6) copy bsd.sh from reffiles to the fulmination root directory, then run it ./bsd.sh

7) rest the same as linux.

>MACOS

1) Install bash, gsed, gawk from homebrew, then sudo ln -s /usr/local/bin/bash /bin/bash

2) Rest the same as FREEBSD

>Windows

This is ill advised as performance is very slow

1) Install Cygwin

2) Get the game in the directory structure of Cygwin

3) Rest the same as Linux

# ToDo

## Music
Whenever I either get talented enough to make music, or
happen to aquire some music, I will finish setting up the music subsystem

# License: MIT

Copyright 2019 Universal Analogue

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Credits

Riddles by fantasynamegenerators.com

Dedicated to my co workers who told me I couldn't do it.
