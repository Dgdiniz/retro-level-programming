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

    move.l #9,d0
    movea.l #$1000,a0
    loop:
        cmp.b #5,(a0)+
        dbgt d0,loop

    next:
        sub.l #$1,a0
        nop
    gameover:
        -; bra -

seek($1000)
    db 10, 8, $23, -6, $14, $36, 1, -3, -16, 31


