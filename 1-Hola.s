.data
var1:            .word    3
puntero_var1:    .word    var1

.text
.global main
main:   LDR     r0, =puntero_var1
        LDR     r1, [r0]
        LDR     r2, [r1]
        LDR     r3, =var1
        BX      lr
