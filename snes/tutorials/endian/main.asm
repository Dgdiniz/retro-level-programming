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
	rep #$30 //16 bits

    //Gravando word e byte
    lda #$1234
    sta $0000

    sep #$20 //8 bits
    lda #$12
    sta $0010
    rep #$20 //16 bits

    // Lendo uma word
    lda #$0000
    lda $0000

    lda #$0002
    sta $0020
    sep #$20 //8 bits
    lda $0020
    rep #$20 //16 bits

    // Acessando um endereço de 3 bytes
    lda #$beef
    sta $0050
    lda #$0050
    sta $0000
    lda #$007e
    sta $0002
    lda [$00]

-
	bra -
