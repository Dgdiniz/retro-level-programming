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

    move.l #$5,d0

// Normal while /////////////
    while:
        cmp.l #0,d0
        beq +
        nop
        sub #1,d0
        nop
        bra while
/////////////////////////////

    +;  nop

    move.l #$5,d0

// do/while /////////////////
    dowhile:
        nop
        sub #1,d0
        nop
        cmp.l #0,d0
        bne dowhile
/////////////////////////////

    nop

gameover:
    -; bra -

