; 10 SYS (4096)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $30, $39, $36, $29, $00, $00, $00

*=$1000

Main
       lda #0
       sta $6000 ;player X
       sta $6001 ; bulletX
       sta $6002 ;movementtimer






start
       
        lda #81  ;store ballcharrecter in accumaltor
        ldx $6000 ;store the player X in the X register
        jsr checkforinput
        jmp start  ;loop back up    
        








checkforinput
        lda #%0000001 ;load a bitmask number in the accumaltor
        bit $DC00 ;check for bit 0
        beq up ;if so go to up
        lda #%0000010 ;load a bitmask number in the accumaltor
        bit $DC00 ;check for bit 1
        beq down ;if so go to down
        lda #%0000100 ;load a bitmask number in the accumaltor
        bit $DC00 ;check for bit 2
        beq left ;if so go to left
        lda #%0001000 ;load a bitmask number in the accumaltor
        bit $DC00 ;check for bit 3
        beq right ;if so go to right
        lda #%0010000 ;load a bitmask number in the accumaltor
        bit $DC00 ;check for bit 4
        beq fire ;if so go to fire
        rts








up
        lda #21 ;load A into accumaltor
        sta 1024 ;write this to the firtscreen position
        jmp start ;go back to start
down 
        lda #4 ;load D into accumaltor
        sta 1024 ;write this to the firtscreen position
        jmp start ;go back to start
left
        lda $6002 ;loads timer into register A
        cmp #0 ;checks if this is at zero
        beq moveplayer ;if so go move player
        jmp start ;go back to start
right
        lda $6002 ;loads timer into register A
        cmp #0 ;checks if this is at zero
        beq moveplayer ;if so move player
        jmp start ;go back to start
fire
        lda #86 ;load cross into accumaltor
        sta 1024 ;write this to the firtscreen position
        jmp start ;go back to start
moveplayer
        inc $6000
        inc $D021
        lda #55
        sta 1024
        jmp start


