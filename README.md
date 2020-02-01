# Fulmination
Scriptures of Fulmination.  A small adventure game in the makebuild engine as a proof of concept.

# Requirements
1) Bash
2) gnu-coreutils
3) sed (of the gsed variety, default in linux)
4) moc/mocp/music on console player. (only for music and there currently
   isn't any, so its not really needed yet)
5) 74x42 monospace characters terminal (would probably have it be atleast 75x43 in case of
   overrun in proccessing)
6) an ssh client if playing over ssh.

7) a serial terminal client if playing over serial.

8) a terminal emulator if playing in a gui.

9) a monitor and keyboard if playing on local console.


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

3) move to the directory after it downloads/unpacks.

4) it might require a chmod +x -R * . I am unsure as I load the files out of a local directory.
 
5) copy bsd.sh from reffiles to the fulmination root directory, then run it ./bsd.sh

6) rest the same as linux.

>MACOS

1) Will probably work with all the freebsd instructions, however I lack a MAC, so I can't test it 
   

# General Disclaimer
Disclaimer of engine inefficiencies;  This game uses the 1.0 version of the engine.
It will not recive Feature updates such as streamlined inventory module, or updated
overlays module.  The game received 6 months more of feature updates to get it to
what I would consider to be a stable professional state.  I could honestly go back and
give it every new feature it would never take advantage of as I consider it a finished
product.  I will continue to support bugs, however as far as active development goes,
the main focus is the SDK for the engine so others can make adventure games in it,
as well as in the next adventure game I am currently working on.  I know there is alot
of room for improvement, and alot of it already has.  After I finish with the inventory
streamlines I have planned, I will release the SDK.  

TL;DR: I will fix whats there, however I will not be adding to it.  The game has been done
for 7 months, and I've just been trying to get up the nerve to post it.I want to move on
to better things, and better things are in production.

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
