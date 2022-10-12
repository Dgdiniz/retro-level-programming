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

    //Immediate and Data Register Direct
    move.l #$10204fff,d0
    move.l #$1034f88a,d3

    //Both Data Register Direct
    move.b d0,d3

    //Immediate and Address Register Direct
    movea.l #$00200000,a0

    //Both Address Register Direct
    movea.l a0,a3


gameover:
    -; bra -

