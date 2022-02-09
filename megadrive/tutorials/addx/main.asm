arch md.cpu
endian msb

fill $200000

macro seek(variable offset) {
  origin offset
  base offset
}

include "header.megadrive.asm" // Include Header & Vector Table

seek($204)
    nop

    //Adding 64bits with add only (wrong, but works!)
    move.l #$12345678,d0
    move.l #$9abcdef0,d1
    move.l #$11223344,d2
    move.l #$55667788,d3
    add.l d1,d3
    add.l d0,d2

    //Adding 64bits with add only (wrong, but works!)
    move.l #$12345678,$ff0000
    move.l #$9abcdef0,$ff0004
    move.l #$11223344,$ff0010
    move.l #$55667788,$ff0014
    movea.l #$ff0008,a0
    movea.l #$ff0018,a1
    move.l -(a0),d0
    add.l d0,-(a1)
    move.l -(a0),d0
    add.l d0,-(a1)

    //Adding 64bits with add only (wrong!)
    move.l #$fedcba98,$ff0000
    move.l #$76543210,$ff0004
    move.l #$88776655,$ff0010
    move.l #$ffeeddcc,$ff0014
    movea.l #$ff0008,a0
    movea.l #$ff0018,a1
    move.l -(a0),d0
    add.l d0,-(a1)
    move.l -(a0),d0
    add.l d0,-(a1)

    //Adding 64bits with addx (right way!)
    move.l #$fedcba98,$ff0000
    move.l #$76543210,$ff0004
    move.l #$88776655,$ff0010
    move.l #$ffeeddcc,$ff0014
    movea.l #$ff0008,a0
    movea.l #$ff0018,a1
    move.w #$0004,ccr
    addx.l -(a0),-(a1)
    addx.l -(a0),-(a1)

    //Adding 64bits with addx (right way!)
    move.l #$ffffffff,$ff0000
    move.l #$76543210,$ff0004
    move.l #$00000000,$ff0010
    move.l #$ffeeddcc,$ff0014
    movea.l #$ff0008,a0
    movea.l #$ff0018,a1
    move.w #$0004,ccr
    addx.l -(a0),-(a1)
    addx.l -(a0),-(a1)

    //Adding 64bits with addx (right way!)
    move.l #$ffffffff,$ff0000
    move.l #$80000000,$ff0004
    move.l #$00000000,$ff0010
    move.l #$80000000,$ff0014
    movea.l #$ff0008,a0
    movea.l #$ff0018,a1
    move.w #$0004,ccr
    addx.l -(a0),-(a1)
    addx.l -(a0),-(a1)

    //Adding 64bits with addx and add
    move.l #$ffffffff,d0
    move.l #$80000000,d1
    move.l #$00000000,d2
    move.l #$80000000,d3
    add.l d1,d3
    addx.l d0,d2

    //Negation
    move.l #$12345678,d0
    neg.l d0

    //Negation of a 64bits
    move.l #$12345678,$ff0000
    move.l #$9abcdef0,$ff0004
    move.w #$0004,ccr
    negx.l $ff0004
    negx.l $ff0000

    //Negation of a 64bits
    move.l #$00000000,$ff0000
    move.l #$12345678,$ff0004
    move.w #$0004,ccr
    negx.l $ff0004
    negx.l $ff0000

    //Negation of a 64bits
    move.l #$00000000,$ff0000
    move.l #$00000000,$ff0004
    move.w #$0004,ccr
    negx.l $ff0004
    negx.l $ff0000

	-;jmp -

