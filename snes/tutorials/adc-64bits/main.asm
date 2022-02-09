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

	//64 bits addition
    lda #$fedc
    sta $0006
    lda #$ba98
    sta $0004
    lda #$7654
    sta $0002
    lda #$3210
    sta $0000

    lda #$0000
    clc
    lda #$ddcc
    adc $0000
    sta $0010
    lda #$ffee
    adc $0002
    sta $0012
    lda #$6655
    adc $0004
    sta $0014
    lda #$8877
    adc $0006
    sta $0016


	//64 bits addition
    lda #$ffff
    sta $0006
    lda #$ffff
    sta $0004
    lda #$7654
    sta $0002
    lda #$3210
    sta $0000

    lda #$0000
    clc
    lda #$ddcc
    adc $0000
    sta $0010
    lda #$ffee
    adc $0002
    sta $0012
    lda #$0000
    adc $0004
    sta $0014
    lda #$0000
    adc $0006
    sta $0016
-
	bra -
