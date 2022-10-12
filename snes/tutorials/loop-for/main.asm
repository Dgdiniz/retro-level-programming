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

    lda #$0000

    loop_for:
        cmp #5
        bpl +
        nop
        nop
        nop
        inc
        bra loop_for

    +; nop

gameover:
-;  bra -

