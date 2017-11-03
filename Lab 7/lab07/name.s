.section	.data
	first_name_prompt: .asciz "Enter your first name: "		/* First name user prompt */					
	last_name_prompt: .asciz "Enter your last name: "		/* Last name user prompt */
	output_message: .asciz "Hello, %s %s.\n"					/* Output message */

	input_fmt: .string "%s"								/* Input format */

	first_name: .space 200									/* first name array */
	last_name:  .space 200									/* last name array */

.section	.text

.global		main
main:
	@ Prompt user for first name
	ldr r0, =first_name_prompt							
	bl printf												/* Load register 0 with address of first_name_prompt and print prompt */	

	@ Scan first name
	ldr r0, =input_fmt
	ldr r1, =first_name
	bl scanf												/* Scan value of first_name and load into register 1 */

	@ Prompt user for last name
	ldr r0, =last_name_prompt
	bl printf												/* Load register 0 with address of last_name_prompt and print prompt */

	@ Scan last name
	ldr r0, =input_fmt
	ldr r1, =last_name
	bl scanf												/* Scan value of last_name and load into register 1 */

	@ Print output
	ldr r2, =last_name
	ldr r1, =first_name
	ldr r0, =output_message
	bl printf												/* Load value of first_name and last_name into register 1 and 2 respectively and print output_message */

	@ Flush to stdout and end program
	mov r0, $0												
	bl fflush												/* Clear contents in register 0 */
	mov r7, $1
	svc $0
	.end													/* Exit */
