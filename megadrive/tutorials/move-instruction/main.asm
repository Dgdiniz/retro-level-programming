arch md.cpu
endian msb

fill $200000

macro seek(variable offset) {
  origin offset
  base offset
}

include "header.megadrive.asm" // Include Header & Vector Table

seek($200)
	nop
	nop
	move #$12345678,d0
	move.l #$12345678,d0
	move.w #$abcd,d0
	move.b #$dd,d0

	move d0,d1
	move.l d0,d2
	move.w d2,d3
	move.b d3,d4

	move.l d0,$ff0000
	move.w d1,$ff0008
	move.b d2,$ff0010

	move.l #$aabbccdd,$ff0018
	move.w $ff0018,d5

	move.l $ff0018,$ff0020
	move.w $ff0018,$ff0028
	move.b $ff0018,$ff0030

	movea.l #$ff0040,a0
	movea.w #$1234,a1
	movea.w #$8abc,a2
	move.w #$8000,a3
	move.w d0,a4

	move.l #$deadbeef,d0
	move.l d0,(a0)

	move.b #$22,d6

	move.b d6,(a0)+
	move.b d6,(a0)+
	move.b d6,(a0)+
	move.b d6,(a0)+

	moveq #$45,d0
	moveq #$85,d0
	moveq #$c2,d2

	move.l #$00,d0
	move.w #$8000,d0
	move.l #$00,d1
	move.l #10,d1
	move.l #-10,d1
	move.b #$00,d2
	move.b #$a1,d2
	move.w #$1000,$ff0050
	move.w #$8000,$ff0050
	move.b #$80,$ff0058

	exg.l d0,d1
	exg.l a0,a1
	exg d2,d3
	exg.l d1,a0
	exg d2,a1


	-; bra -
