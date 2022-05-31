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
    rep #$30 // 16bits

    lda #$1234
    sta $0000

    rep #$c3
    cmp #$1234

    rep #$c3
    cmp #$1235

    rep #$c3
    cmp #$1232

    rep #$c3
    cmp $0000

    sep #$20 // 8bits

    rep #$c3
    cmp #$34

    rep #$c3
    cmp $0000

    rep #$c3
    cmp $0001

    ldx #$1234
    rep #$c3
    cpx #$1234
    cpx #$1232

    ldy #$1234
    rep #$c3
    cpy #$1234
    cpy #$1232

-;  bra -

