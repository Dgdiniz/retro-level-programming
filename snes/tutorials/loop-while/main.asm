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

    lda #$0005

// Normal while //////////////
    while:
        cmp #0
        beq +
        nop
        dec
        nop
        bra while
//////////////////////////////

    +;  nop

    lda #$0005

// do/while //////////////////
    dowhile:
        nop
        dec
        nop
        cmp #0
        bne dowhile
//////////////////////////////

    nop

gameover:
-;  bra -

