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

    sep #$30   //Mode full 16 bits (A, X and Y)
    lda.w #$0078 //16 bits mode, so we need a 16 bits immediate

-;	bra -

