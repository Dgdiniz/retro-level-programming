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

    lda #$0001
    label1:
        clc
        adc #$0001
        bra label2
        -;  nop
            nop
            nop
            jmp +
    label2:
        clc
        adc #$0002
        bra -
        +;  clc
            adc #$0001
            jmp $8000

-;  bra -

