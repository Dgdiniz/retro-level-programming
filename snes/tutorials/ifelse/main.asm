// vim: ft=snes
arch snes.cpu

fill $200000

macro seek(variable offset) {
  origin ((offset & $7F0000) >> 1) | (offset & $7FFF)
  base offset
}

include "header.snes.asm" // Include Header & Vector Table

constant varEnergyPtr = $7f1000

seek($8000)
	clc
	xce
	nop
    rep #$30

    lda #$0008
    sta varEnergyPtr

    gameloop:
        lda varEnergyPtr

//////// if /////////////////////////
        cmp #5
        bne next_if1
        //play caution sound
        nop
        nop
    next_if1:
/////////////////////////////////////

        nop

//////// if-else ////////////////////
        cmp #3
        bpl _else
        //draw red screen
        nop
        nop
        bra next_if2
    _else:
        //draw blue screen
        nop
        nop
    next_if2:
/////////////////////////////////////

        nop

//////// if-else ////////////////////
        cmp #0
        beq gameover

        //Else, decrement energy
        dec
        sta varEnergyPtr
        bra gameloop

gameover:
-;  bra -

