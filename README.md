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

6a) an ssh client if playing over ssh.

6b) a serial terminal client if playing over serial.

6c) a terminal emulator if playing in a gui.

6d) a monitor and keyboard if playing on local console.


# Installation
1) move to the directory after it downloads/unpacks.

2a) it might require a chmod +x -R * . I am unsure as I load the files out of a local directory.

2b) if this is being run on freebsd, please install gsed, then move the bsd.sh file from reffiles to the
    main directory.  then run it with ./bsd.sh.  I have tested it to make sure it patches right, however
    if you experiance any issues with it please let me know, it has had less testing than the rest
    of the game
 
2c) run ./mkbld.sh to install the program.

3) run ./start.sh to play the game.

4) Enjoy

5) if you dont enjoy, please give feedback so I know what doesn't work for the next game.

6) report bugs so I can fix them.  I consider this to be a production level game, however
   my beta testers either didn't understand adventure games or were me.  Should be less
   glitchy than the day one Assasins Creed Unity.
   
# Riddles by fantasynamegenerators.com

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

TL;DR: I will fix whats there, however I will not be adding to it, as I want to move on
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
