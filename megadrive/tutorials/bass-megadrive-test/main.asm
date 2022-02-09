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
	rte
	
seek($204)
	move.l #$11223344,d0
-
	addi.b #$01,d0
	bra -