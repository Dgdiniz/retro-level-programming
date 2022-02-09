//; vim: ft=snes_bass

arch snes.cpu

fill $200000 //The game has 2MB

macro seek(variable offset) {
  origin ((offset & $7F0000) >> 1) | (offset & $7FFF)
  base offset
}

include "header.snes.asm" // Include Header & Vector Table

seek($8000)
	nop
	lda #$01
-
	nop
	inc
	bra -

