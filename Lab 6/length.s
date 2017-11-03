.data
	stringfmt: .asciz "%s"
	outfmt: .asciz "%d\n"

.text

.global main
main:
	push {fp, lr}							
	add fp, sp, #4							/*Set up frame pointer*/
	sub sp, sp, #264						/*Create space for 264 bytes in stack*/
	mov r3, #0
	str r3, [fp, #-8]						/*counter -> initialized to 0.*/
	mov r3, #0
	str r3, [fp, #-12]						/*length -> initialized to 0*/
							
	sub r3, fp, #268						/*compute address*/
	mov r1, r3
	ldr r0, addr_stringfmt
	bl scanf								/*scan string*/

	/* sub r3, fp, #268						/*compute address*/
	/* mov r1, r3								/*r1 <- str address*/
	/* ldr r0, addr_checkfmt
	bl printf								/*print scanned string*/

loopwhile:
	sub r2, fp, #268						
	ldr r3, [fp, #-8]						
	add r3, r2, r3							/*loop through string*/
	ldrb r3, [r3]
	cmp r3, #0								/* compare r3 to null*/
	beq end									/*branch to end if string = null*/

	ldr r3, [fp, #-8]
	add r3, r3, #1
	str r3, [fp, #-8]
	ldr r3, [fp, #-12]
	add r3, r3, #1
	str r3, [fp, #-12]
	b loopwhile								/* loop until string == null*/

end:
	ldr r1, [fp, #-12]
	ldr r0, addr_outfmt
	bl printf								/*print string length*/

	mov r3, #0
	mov r0, r3
	sub sp, fp, #4							/* deallocate variable*/
	pop {fp, lr}							/* pop lr*/
	bx lr 									/*return and exit*/

addr_stringfmt: .word stringfmt
addr_outfmt: .word outfmt
