arch md.cpu
endian msb //Big Endian

fill $200000

macro seek(variable offset) {
  origin offset
  base offset
}

include "header.megadrive.asm" // Include Header & Vector Table

constant varEnergyPtr = $ff1000

seek($200)
	nop
	nop

    move.w #$0008,varEnergyPtr // Player's Energy

    gameloop:
        // Instructions before the if
        move.w varEnergyPtr,d1


//////// if /////////////////////////
        cmp.w #5,d1
        bne next_if1
        //play caution sound
        nop
        nop
    next_if1:
/////////////////////////////////////

        nop

//////// if-else ////////////////////
        cmp.w #3,d1
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
        //If energy is 0, game over
        cmp.w #0,d1
        beq gameover

        //Else, decrement energy
        subi.w #1,d1
        move.w d1,varEnergyPtr
        bra gameloop
/////////////////////////////////////

gameover:
    -; bra -

