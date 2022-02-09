// vim: ft=snes
arch snes.cpu

fill $200000

macro seek(variable offset) {
  origin ((offset & $7F0000) >> 1) | (offset & $7FFF)
  base offset
}

include "header.snes.asm" // Include Header & Vector Table

seek($8000)
	clc
	xce
	nop

    rep #$30   //Mode full 16 bits (A, X and Y)

    lda.w #$3000
    clc
    adc.w #$6000 //Overflow

    lda.w #$6000
    clc
    adc.w #$d000 //No overflow

    lda.w #$a000
    clc
    adc.w #$b000 //Overflow

    lda.w #$d000
    clc
    adc.w #$e000 //No Overflow

-;  bra -

