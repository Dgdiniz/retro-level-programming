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

    move.l #$80,d0

    ext.w d0
    ext.l d0

    move.l #$12345678,d0
    ext d0

    move.l #$fedcba98,d0
    ext.l d0

gameover:
    -; bra -

