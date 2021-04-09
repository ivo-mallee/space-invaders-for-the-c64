; 10 SYS (4096)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $30, $39, $36, $29, $00, $00, $00





*=$1000

Main
     
       
       lda #100 ;load 100
       sta $20 ; in adress $20
       
       lda #200 ; load 200 in the Accumulator
       
       cmp $20 ;if the Accumulator's value is smaller than that of $20
       bcc yes ;if so jump to yes
       
       lda #14 ;load 14 in the accumulator
       sta 1024 ; and store that to screenpos 1
       
       rts

yes
        lda #25   ;load 25 in the accumulator
        sta 1024 ; store this to screenpos1
        rts