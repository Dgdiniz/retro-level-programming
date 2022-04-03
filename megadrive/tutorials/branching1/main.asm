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

    move.l #$00000001,d0
    label1:
        add.l #$00000001,d0
        bra label2
        -;  nop
            nop
            nop
            jmp +
    label2:
        add.l #$00000002,d0
        bra -
        +;  add.l #$00000001,d0
            jmp $00000200

    -; bra -

