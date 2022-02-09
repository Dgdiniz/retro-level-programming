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

	move.l #$12345678,d0
	move.l #$beef1000,d1
	add.l d1,d0

	move.w #$1000,d0
	add.w d1,d0

	move.b #$a0,d0
	move.b #$f3,d1
	add.b d1,d0

	move.l #$12345678,$ff0000

	add.l #$00001000,d0
	addi.l #$00001000,d0
	addi.l #$00001000,$ff0000
	add.l #$00001000,$ff0000 //invalido
	addi.w #$f000,$ff0000

	move.l #$11111111,$ff0010
	movea.l #$00ff0000,a0

	adda.l #$10,a0
	add.l #$1000,(a0) //invalido
	addi.l #$1000,(a0)

	addq.b #$5,d0

	move.b #$ff,d1
	addq.b #$3,d1
	movea.l a0,a1
	addq.l #$1,a1

	move.l #$ffffff00,d2
	add.l #$ffffff00,d2

	//sub

	move.l #$00001000,d4
	sub.l #$00001000,d4

	move.l #$00001000,d4
	subi.w #$3000,d4

	subi.w #$3000,(a0)

	suba.l #$10,a0
	subi.b #$20,(a0)

	subq.w #$1,d0


	-; bra -