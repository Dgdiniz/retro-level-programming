arch md.cpu
endian msb //Big Endian

fill $200000

macro seek(variable offset) {
  origin offset
  base offset
}

include "header.megadrive.asm" // Include Header & Vector Table

seek($200)
	nop
	nop

    move.l #$12345678,d0
    move.l #$9abcde78,d1
    move.l #$ff0000,a0
    move.l #$ff0004,a1
    move.l d0,(a0)
    move.l d1,(a1)

    // Register <-> Register -------------------------------------------------

    move.w #0,ccr
    cmp.l d0,d1  // 32bits - The values are different

    move.w #0,ccr
    cmp.l d1,d0  // 32bits - The values are different

    move.w #0,ccr
    cmp.w d0,d1  // 16bits - The values are different

    move.w #0,ccr
    cmp.b d0,d1 // 8bits - The values are the same


    // Memory <-> Register ---------------------------------------------------

    move.w #0,ccr
    cmp.l (a0),d1  // 32bits - The values are different

    move.w #0,ccr
    cmp.w (a0),d1  // 16bits - The values are different

    move.w #0,ccr
    cmp.b (a0),d1  // 8bits - The values are the same


    // Immediate <-> Register ------------------------------------------------

    move.w #0,ccr
    cmpi.l #$12345678,d0  // 32bits - The values are the same

    move.w #0,ccr
    cmp.w #$beef,d0  // 16bits - The values are different

    move.w #0,ccr
    cmpi.b #$78,d0  // 8bits - The values are the same


    // Register <-> Address Register ------------------------------------------

    move.w #0,ccr
    move.l #$ff0000,a3
    cmpa.l #$ff0000,a3

    move.w #0,ccr
    move.l #$ff0000,$ff0010
    cmp.l $ff0010,a3


    // Memory <-> Memory -----------------------------------------------------

    movea.l #$ff0020,a4
    movea.l #$ff0030,a5

    move.l #$12345678,$ff0020
    move.l #$9abcdef0,$ff0024

    move.l #$12345678,$ff0030
    move.l #$9abcdef1,$ff0034

    clr.l d6

    -; cmp.b (a4)+,(a5)+
    bne gameover
    add.l #1,d6
    bra -

gameover:
    -; bra -

