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

    //Gravando long word, word e byte
    move.l #$12345678,d0
    move.l #$12345678,$ff0000

    move.w #$1234,d1
    move.w #$1234,$ff0010

    move.b #$12,d2
    move.b #$12,$ff0020

    //Cuidado aqui!!!
    move.l #$2,$ff0030
    move.w $ff0030,d4

    -; bra -

