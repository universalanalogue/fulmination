# Fulmination
Scriptures of Fulmination, or how I learned to stop worrying, and just love urxvt.

# Requirements
1) Bash -ge 4
2) gnu-coreutils
3) sed (of the gsed variety, default in linux)
4) git (ease of downloading the game)
5) moc/mocp/music on console player. (only for music and there currently
   isn't any, so its not really needed yet)
6) 74x42 monospace characters terminal (would probably have it be atleast 75x43 in case of
   overrun in proccessing)
7) an ssh client if playing over ssh.

8) a serial terminal client if playing over serial -ge 9600buad.

9) a terminal emulator if playing in a gui.

10) a monitor and keyboard if playing on local console.

11) some storage medium to store the game.  game will fit and run on a 1.44mb floppy,
you have to move the game without gitfiles for it to fit. floppy must be ext2

12) At least a 40MHz processor, with at least 128mb of system ram (Min Req for Linux/ tested)
##### As a note, when running down at 40mhz, the game will allow you to cache commands while it loads, which is an interesting thing, as that shouldn't be even possible

# Installation
>LINUX
1) git clone https://github.com/universalanalogue/fulmination.git

2) chmod +x -R fulmination ; cd fulmination

3) run ./mkbld.sh to install the program.

4) run ./start.sh to play the game.

5) Enjoy

6) if you dont enjoy, please give feedback so I know what doesn't work for the next game.

7) report bugs so I can fix them.

>FREEBSD
1) Have bash, gsed, gawk, and coreutils installed

2) git clone https://github.com/universalanalogue/fulmination.git

3) chmod +x -R fulmination ; cd fulmination

4) cp reffiles/bsd.sh bsd.sh ; ./bsd.sh

5) rest the same as linux.

>MACOS

1) Install bash, gsed, gawk, coreutils from homebrew

2) Rest the same as FREEBSD

>Windows

This is ill advised as performance is very slow

1) Install Cygwin

2) Be sure you install git durring the install

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
