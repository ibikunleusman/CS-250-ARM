.section .data
	string_prompt:		.asciz "Enter a string: "
	str_in_fmt:			.asciz "%s"

	start_index_prompt:	.asciz "Enter the start index: "
	end_index_prompt:	.asciz "Enter the end index: "
	index_fmt:			.asciz "%d"

	out_message:		.asciz "The substring of the given string is '%s'\n"

	start_index:		.word 0
	end_index:			.word 0

	string_dt:			.space 200

.section .text


.global main
main:
	@ Prompt user for string
	ldr r0, =string_prompt
	bl printf

	@ Scan string
	ldr r1, =string_dt
	ldr r0, =str_in_fmt
	bl scanf

	@ Prompt for start_index
	ldr r0, =start_index_prompt
	bl printf

	@ Scan start_index
	ldr r1, =start_index
	ldr r0, =index_fmt
	bl scanf

	@ Prompt for end_index
	ldr r0, =end_index_prompt
	bl printf

	@ Scan end_index
	ldr r1, =end_index
	ldr r0, =index_fmt
	bl scanf

	@ Save data
	ldr r0, =string_dt
	ldr r1, =start_index
	ldr r1, [r1]
	ldr r2, =end_index
	ldr r2, [r2]

	@ branch to sub_string routine
	bl sub_string
	mov r1, r0
	ldr r0, =out_message
	bl printf

	@ end program
	mov r7, $1
	svc $0
	.end
