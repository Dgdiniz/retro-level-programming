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

    /////////16 bits
    rep #$30
    lda #$2233          //Immediate
    sta $0000           //Absolute
    lda $a000           //Absolute
    lda $018000         //Absolute Long

    lda #$0000          //Clean A

    /////////8 bits
    sep #$20
    lda #$44            //Immediate
    sta $0000           //Absolute
    lda $a000           //Absolute
    lda $018000         //Absolute Long


gameover:
-;  bra -

seek($a000) //Bank 0
data:
    dw $1234

seek($018000) //Bank 1
data_bank_01:
    dw $5678
