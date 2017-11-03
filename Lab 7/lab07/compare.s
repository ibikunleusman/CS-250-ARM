.section	.data
	first_num_prompt: .asciz "Enter the first number: "				/* First number prompt */
	second_num_prompt: .asciz "Enter the second number: "			/* second number prompt */

	input_fmt: .string "%d"													/* Input format */

	out_equal_msg: .asciz "%d and %d are equal.\n"					/* Output message (equal) */
	grt_msg:	.asciz "%d is strictly greater than %d by %d.\n"		/* Output message (max-min) */

	num1: .word 0
	num2: .word 0
	diff: .word 0

.section	.text

.global		main
main:

	@ Prompt for first number
	ldr r0, =first_num_prompt
	bl printf										/* Load address of first_num_prompt into r0 and print prompt */

	@ Scan num1
	ldr r1, =num1
	ldr r0, =input_fmt
	bl scanf										/* Scan value of num1 and load into register 1 */

	@ Prompt for second number
	ldr r0, =second_num_prompt
	bl printf										/* Load address of second_num_prompt into r0 and print prompt */

	@ Scan num2
	ldr r1, =num2
	ldr r0, =input_fmt
	bl scanf										/* Scan value of num2 and load into register 1 */

	@ Save numbers
	ldr r1, =num1									/* Load @num1 into register 1 */
	ldr r2, =num2									/* Load @num2 into register 2 */
	ldr r1, [r1]
	ldr r2, [r2]									/* "derefence registers" (Load registers with immediate values) */

	@ Compare numbers
	cmp r1, r2										/* compare r1 and r2 */
	beq numEqual									/* branch if equal */
	bgt numGreater									/* branch if greater */	

	ldr r1, =num2									/* Load @num2 into register 1 */
	ldr r2, =num1									/* Load @num1 into register 2 */
	ldr r1, [r1]
	ldr r2, [r2]									/* "derefence registers" (Load registers with immediate values) */

/* max (x, y) */
numGreater:
	sub r3, r1, r2									/* Subtract r2 from r1 and store result in register 3 */ 
	ldr r0, =grt_msg
	bl printf										/* Print out result */

	b end											/* branch to end */

/* x = y */
numEqual:
	ldr r0, =out_equal_msg						
	bl printf										/* Load register 0 with out_equal_msg and print if num1 = num2 */

/* end program */
end:
	mov r0, $0										/* Clear contents of register 0 */
	bl fflush										/* Flush to stdout */
	mov r7, $1
	svc $0
	.end											/* Exit */
