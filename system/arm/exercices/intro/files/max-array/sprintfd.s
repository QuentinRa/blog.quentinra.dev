	.arm
	
	.text

	.globl sprintfd

	/*
	  Function udivagain computes in r0 the quotient of the division
	  of the contents of r0 by the contents of r1. The remainder is put in r1.
	*/

udivagain:  @Divides the contents of r0 by the contents of r1
	    @ returns the quotient in r0 and the remainder in r1
	    stmfd sp!,{r2,lr}
	    mov     r2, #0      @ the quotient is prepared in r2
yoop:	    cmp     r0,r1
	    addpl   r2,#1
	    subpl   r0,r1
	    bpl     yoop
	    @ Preparing to return: put the remainder in r1
	    mov     r1,r0
	    @ Put the quotient in r0
	    mov r0,r2
	    ldmfd sp!,{r2,pc}

	
	/*
	  Function sprintfd writes integer held in register r1 in decimal format
	  to the string str pointed to by register r0. Returns in r1 the length
	  of str.
	*/

sprintfd:
	        stmfd sp!,{r2-r4,lr}
	        mov r2,#0
	        strb r2,[r0]    @Erase minus sign in case previous int was negative
	        mov r4,#1
	        cmp r1,#0
	        addeq r1,r1,#0x30
	        streqb r1,[r0]
	        beq ret
	        mov r2,#0x2d    @ ascii minus sign in r2
	        cmp r1,#0
	        strmib r2,[r0]  @ if int is negative, str should start with sign minus
	        rsbmi r1,r1,#0    @ If integer is negative, we work with its opposite
	        @ We prepare to call udivagain. It must find the dividende in r0
	        mov r2,r0   @ So, save str addr in r2
	        mov r3,#0   @ in r3 how many times we divide by 10
	        mov r0,r1   @ udivagain must find the dividende in r0
loop:		mov r1,#10  @ udivagain must find the divisor in r1
	        bl udivagain
	        @ The quotient is in r0, the remainder is in r1
	        add     r1,r1,#0x30      @ from int to ascii
	        stmfd sp!,{r1}
	        add     r3,r3,#1         @ One more digit
	        cmp     r0,#0
	        bne loop

	        @ We end up with a zero dividende. Write to string in reverse order
	        mov r4,r3
	        mov r1,r2       @ start of string in r1
	        ldrb r0,[r2]
	        cmp r0,#0x2d
	        addeq r4,r4,#1  @ if negative add 1 to the length of the string (minus sign)
	        addeq r1,r1,#1  @ if minus sign skip to next byte location
popagain:
	        ldmfd sp!,{r0}
	        strb    r0,[r1]          @ write digit to string
	        subs    r3,r3,#1
	        addne   r1,r1,#1         @ prepare location for next digit
	        bne popagain

	        mov r0,r2       @ Again r0 points to str
ret:
	        mov r1,r4
	        ldmfd sp!,{r2-r4,pc}

		.end
	
