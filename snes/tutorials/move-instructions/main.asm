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

	//Load and Store
	lda #$0001
	lda #$abcd
	sta $0000
	sta $7e0010
	ldx #$1234
	ldy $0010
	stx $0020
	sty $0028
	stz $0010

	//Transfer
	tax
	txy
	ldy #$bbbb
	tya
	txa
	tya
	lda #$0100
	tcd
	lda #$ffff
	tdc

	//Stack
	lda #$1111
	ldx #$2222
	ldy #$3333
	pha
	phx
	phy
	plx
	pla
	ply

-
	bra -

