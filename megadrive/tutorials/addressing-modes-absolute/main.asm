arch md.cpu
endian msb //Big Endian

fill $200000

macro seek(variable offset) {
  origin offset
  base offset
}

include "header.megadrive.asm" // Include Header & Vector Table

seek($200)
	nop
	nop

    //Immediate and Absolute Long
    move.l #$12345678,$ff0000
    move.b #$05,$ff0000.l
    move.w #$aabb,($ff0000).l

    //Both Absolute Long
    move.b $1000,$ff0000

    //Invalid. Must be the same format in both parameters. This is a Bass limitation.
    //move.b $1000,$ff0000.l

    //This is valid because both paremeters has the same syntax
    move.b $1000.l,$ff0000.l

    //Immediate and Absolute Long
    move.l #$deadbeef,$ff8000

gameover:
    -; bra -

seek($1000)
    dd $9abcdef0

seek($8000)
    dd $aabbccdd
