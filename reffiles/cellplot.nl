#version=1.09.01

Walkthough

Follow the linear path east then north and collect all items along the way.
get items from i05 including the light that will unlock the path east from i01
return back to i01 while collecting all the items along the way.
go east from i06 to i08.  Use key from i08 in i06 to open to i07.
Entering i07 stops the rain, allowing you to go east from i08.
Go outside going north east stopping at e22.  state friend and complete the riddles.
continue north to deal with the wolf.  go south to get key from e10 then go
south west to the other side of the house to get the key from e12.
Go back in the house.  return to i03 and get the key from i09.  go back to i04
and go north to i11.  then go east and down the stairs.  continue though the end, getting
all of the items on the way.  then go back to the first floor.  go back outside then
go to e30, and enter the shed.  get the hammer.  collect all books outside and the
clock key from e08.  go back inside and smash the mirror in i07 and get the lighter.
go back to i11, and go up the stairs.  go to i23 and sleep.  collect everything from up stairs.
go to i31 and climb ladder in the trap door.  go back to i25, complete the clock puzzle.
go back to i23, sleep.  get book, sleep again.  go to i12, get the book, 
leave the pendant.  go to i05, break the east window.  get the book,  try to go west,
look at the fireplace, and burn books.

|------------------|
|legend            |
|w - window        |
|d - door          |
|i - item          |
|E* - exteriorcell |
|I* - interiorcell |
|W - wolf          |
|H - hedgerow      |
|^ - tree          |
|S - stairs ^ or v |
|* - fireplace     |
|------------------|

|-----------------------------------------------------------------------------------|
|HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|
|H          |           |           |           |           |           |          ^|
|H    E31   |   E32     |    E33    |    E34    |    E35    |  E36      |    E37   ^|
|H          |           |           |           |           |           |          ^|
|H__________|___________|___________|___________|___________|___________|__________^|
|H        ^ |           | ^         |           |  ^        |           | __E30__  ^|
|H   E24    |    E25    |   E26     |    E27    |    E28    |    E29    | |I14 i|  ^|
|H          |           |           |           |           |           | |_d-k_|  ^|
|H          |           |           |           |           |           |   W      ^|
|H__________#####################################___________|___________|__________^|
|H          #S^         |           |         Sv#           |           |          ^|
|H          #           |           |           #           |           |          ^|
|H   E20    w      I11  |     I12   |    I13    #    E21    |   E22     |   E23    ^|
|H          #           d          d-k          #           |       ^   |          ^|
|H__________#_____d-k___|___________|___________#___________|___________|__________^|
|H          #           |           |           #           |           |          ^|
|H  E16     #*    I4    |      I5   w1   I10   *#    E17    |    E18    |   E19    ^|
|H          #           d     i     |           #           |           |          ^|
|H          #           |           |           #   ^       |           |          ^|
|H__________#______d____|__w2_______|___________#___________|___________|__________^|
|H          #           |           |           #           |           |          ^|
|H          #           |           |           w           |           |          ^|
|H  E12     d       I3 d-k    I9    w     I8    d   E13     |   E14     |   E15    ^|
|H          #       i   |    i      |     i     w           |           |          ^|
|H__________#_______d___|_________w_|_________d_#___________|___________|__________^|
|H          #           |           |   I7   |  #           |           |          ^|
|H  E8      w      I2   |     I1    |  i     |  #   E9      |    E10    |     E11  ^|
|H     ^    #    i      |    i      |__d-k___|  #           |           |          ^|
|H          #          d-k          d         I6#           |      ^    |          H|
|H__________#####################################___________|___________|__________H|
|H          |           |           |           |           |           |          H|
|H   E1     |   E2      |    E3   ^ |    E4     |   E5      |    E6     |  E7      H|
|H          |           |           |           |           |           |          H|
|H          |           |           |           |           |           |          H|
|HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH|
|-----------------------------------------------------------------------------------|

Basement
|-----------------------------------|
|           |           |        S^ |
|           |           |           |
|     I17   d     I16   d    I15    |
|           |           |           |
|_______d___|___________|___________|
|           |           |           |
|           |           |           |
|     I18   d   I19    d-k   I20    |
|           |           |           |
|___________|___________|___d-s_____|
                        |           |
                        |           |
                        |    I21    |
                        |           |
                        |___________|

Upstairs
|---------------------------------w-------|
| Sv  I33     |    I34      |  |          |
|___________d_d_____________dI d          |
w       I22|I |      I23    |35| I24      w
|          d39d             |  |          |
|__________|d_|_____________|_d|__________|
|          |  |             |  |          |
|          |I |             |I |          |
|    I25   d40d     I26     |36d  I27     |
|*         |  |             |  |         *|
|__________|d_|______w______|_d|__________|
|          |  |             |  |          |
|          |I |             |I |          |
w     I28  d41w    empty    w37d I29      w
|          |  |             |  |          |
|__________|d_|_____________|_d|__________|
|          |  |             |I |          |
|          |I |     S^      |38|          |
|     I30  d42d-k  I31      |  d   I32    |
w          |  |             |  |          w
|_____w____|__|______w______|__|___w______|


atic
|----------|
|          |
|          |
|   I43    |
|          |
|__________|


items:
light - I5
bullets - I5
gun - I5
hammer - I14
lighter - I7
pendant - I12

#keys
key1 - I8 - opens door in I6
key2 - I7 - opens door in room I3
key3 - I1 - opens door in room I1
key4 - I9- opens door in I19
key5 - E12 - opens door in room I4
key6 - I23- opens door in I42 - after wolf
key7 - E10- opens door in I12 - after wolf
key8 - I4 - opens door in E30 - after wolf
clockkey - E8 - after I21 

#clockparts
cog - I28
gear - I11
mainspringbarrel - I31
sprocket - I16

#books
book11 - I03
book12 - I04 
book13 - I09
book14 - I07
book15 - I11
book16 - E25
book17 - I08 
book18 - e19
book19 - E31
book110 - I23 - after sleep 2
book111 - E22 - ent encounter
book112 - I19
book113 - I14
book21 - E32
book22 - E24 - after wolf
book23 - I22 
book24 - I28 - after sleep 1
book25 - I05
book26 - E16
book27 - I27
book28 - I43
book31 - I01
book32 - I02
book33 - I12 - after sleep 3 - requires clockkey to open panel
book34 - I21
book35 - I25
book36 - I38
book37 - I06 - requires clockkey to open panel
book38 - I10 - at the end

E22 riddles:
hole
time
secret

I38 safe:09-15-48
I19 safe: 07-20-43

clock order:
mainspring barrel > sprocket> gear> cog

death Locations: 

I 
1 2 7 8 10a 22 24 26 27 28 29 30 31 32 37  41

E
22 30a
