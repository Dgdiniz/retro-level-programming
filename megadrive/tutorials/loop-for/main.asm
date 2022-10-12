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

    move.l #$0,d0
    loop_for:
        cmp #$5,d0
        bge +
        nop
        nop
        nop
        add #$1,d0
        bra loop_for

    +;nop


    move.w #4,d0
    loop_for2:
        nop
        nop
        nop
        dbra d0,loop_for2

gameover:
    -; bra -

