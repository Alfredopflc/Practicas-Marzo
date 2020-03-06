.data
var1 : .asciz " %d\ n"
.text

.global main
main:   PUSH { r4, lr }

bucle:  MOV r0, r4 
        BL fibo 
        MOV r1, r0 
        LDR r0, = var1 
        BL printf 
        ADD r4, r4, # 1 
        CMP r4, # 10 
        BNE bucle 

        POP { r4, lr }
        BX lr

        .equ local1, 0
        .equ local2, 4 + local1
        .equ local3, 4 + local2
        .equ length, 4 + local3

fibo:   PUSH { lr } 
        SUB sp, # length 
        CMP r0, # 2 
        MOVLO r0, # 1 
        BLO fib1
        SUB r0, # 1 
        STR r0, [ sp, # local1 ] 
        BL fibo 
        STR r0, [ sp, # local2 ] 
        LDR r0, [ sp, # local1 ] 
        SUB r0, # 1 
        BL fibo 
        LDR r1, [ sp, # local2 ] 
        ADD r0, r1 

fib1:   ADD sp, # length 
        POP { lr } 
        BX lr 