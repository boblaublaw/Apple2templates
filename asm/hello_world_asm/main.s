;
;  main.s
;  hello_world_asm
;
;  Created by joe on 4/19/16.
;  Copyright © 2016 joe. All rights reserved.
;


COUT = $fded
KEYBOARD = $c000
STROBE = $c010

main:
    ldx #$00
loop:
    lda msg, X
    beq wait
    ora #$80
    jsr COUT
    inx
    jmp loop
    
wait:
    lda KEYBOARD
    bpl wait
    lda STROBE
    rts

msg:    .asciiz "HELLO, WORLD"
