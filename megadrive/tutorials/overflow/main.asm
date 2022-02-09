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

    move.w #$3000,d0
    add.w #$6000,d0

    move.w #$6000,d0
    add.w #$d000,d0

    move.w #$a000,d0
    add.w #$b000,d0

    move.w #$d000,d0
    add.w #$e000,d0

    -; bra -

