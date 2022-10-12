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
    rep #$30

    //Immediate
    lda #$2001

    //Accumulator
    asl

    //Immediate
    sep #$20
    lda #$55

gameover:
-;  bra -

