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

    rep #$30 //Mode full 16 bits (A, X and Y)

    lda #$1234 //16 bits mode, so we need a 16 bits immediate
    sta $0000 //Writing 2 bytes
    ldx $0000 //Reading 2 bytes to X
    ldy $0000 //Reading 2 bytes to Y
    lda #$0078 //8 bits immediate. What Happens?

    sep #$20 //8 bits mode
    sta $0010 //Now writes only 1 byte
    lda $0020 //Reads 1 byte

    lda #$ff //Maximum value for a byte
    inc //What Happens?

    rep #$20 //Back to 16 bits again. X and Y are already 16 bits
    lda #$00ff //Again
    inc // And now?

    ldx #$0000 //Cleaning X and Y
    ldy #$0000

    sep #$10 //X and Y now 8 bits
    ldx $0000
    ldy $0000
    ldx #$ff //Same test
    ldy #$ff
    inx
    iny

    rep #$10

    //Here we are full 16 bits

    lda #$1234
    xba

    lda #$8912
    xba

-
	bra -

