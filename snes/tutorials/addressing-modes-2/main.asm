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

    //Absolute
    sta $1000

    //Absolute
    lda.b $a000

    //Absolute Long
    sta $7e1010

    sep #$20 //8bits

    //Absolute Long
    lda $7e1000

    //Absolute
    sta.w $1020



gameover:
-;  bra -

seek($a000)
    dl $123456
