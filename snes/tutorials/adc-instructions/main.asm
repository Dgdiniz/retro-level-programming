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

	//adc
	lda #$1000
	clc
	adc #$1234

	//memoria/sbc
	tax
	lda #$1000
	sta $0000
	txa
	sec
	sbc $0000

	//inc
	inc
	inc $0000

	//dec
	dec
	dec $0000

	//X e Y (não tem add e sbc pro X e Y)
	inx
	iny
	dex
	dey
	
	//Carry no adc
	lda #$0001
	sec
	adc #$0001

	//Carry no sbc
	lda #$0005
	clc
	sbc #$0001

	//Atuação nas flags
	lda #$7fff
	inc

	lda #$ffff
	inc

	lda #$1000
	sec
	sbc #$1000

-
	bra -