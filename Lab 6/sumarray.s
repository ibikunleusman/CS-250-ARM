.data
	/* message: .asciz "Enter 5 numbers: " */
	infmt: .asciz "%d"
	out_message: .asciz "%d\n"


.text

.global main
main:
	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #32
	mov r3, #0
	str r3, [fp, #-8]

	/*ldr r0, addr_message
	bl printf*/

	mov r3, #0
	str r3, [fp, #-12]

loop:
	ldr r3, [fp, #-12]
	cmp r3, #4
	bgt sumloop

	sub r2, fp, #36
	ldr r3, [fp, #-12]
	lsl r3, r3, #2
	add r3, r2, r3
	mov r1, r3
	ldr r0, addr_infmt
	bl scanf

	ldr r3, [fp, #-12]
	add r3, r3, #1
	str r3, [fp, #-12]
	b loop

sumloop:
	mov r3, #0
	str r3, [fp, #-16]

sum:
	ldr r3, [fp, #-16]
	cmp r3, #4
	bgt end

	ldr r3, [fp, #-16]
  	lsl r3, r3, #2
  	sub r2, fp, #4
  	add r3, r2, r3
  	ldr r3, [r3, #-32]
  	ldr r2, [fp, #-8]
  	add r3, r2, r3
  	str r3, [fp, #-8]

  	ldr r3, [fp, #-16]
  	add r3, r3, #1
  	str r3, [fp, #-16]
  	b sum

end:
	ldr r1, [fp, #-8]
  	ldr r0, addr_outmessage
  	bl printf
  	mov r3, #0
  	mov r0, r3
  	sub sp, fp, #4
  	pop {fp, lr}
  	bx lr

/* addr_message: .word message */
addr_infmt: .word infmt
addr_outmessage: .word out_message
