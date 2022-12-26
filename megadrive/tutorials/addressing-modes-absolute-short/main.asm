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

    //Absolute Long
    move.l $8000,$8000.w

    //Both Absolute Short
    move.l $1000.w,$c000.w

    //Bass doesn't optimize.
    move.l #1,$ff8000
    move.l #1,$8000.w

gameover:
    -; bra -

seek($1000)
    dd $9abcdef0

seek($8000)
    dd $aabbccdd
