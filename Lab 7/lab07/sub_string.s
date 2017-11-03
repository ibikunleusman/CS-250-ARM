.section .data
	out_string:	.space 200									

.section .text

.global sub_string

sub_string:
	mov r6, $1												/* r6 = 1 */

@start of loop: start_index to end_index
loop_start:												
	cmp r6, r1												/* comapare r6 and r1 */
	bge loop_end											/* branch to loop_end if r6 >= r1 */
	add r6, r6, $1
	add r0, r0, $1											/* else r6 <- r6 + 1 and r0 <- r0 + 1 */
	b loop_start											/* continue loop until r6 > r1 */

@terminate loop
loop_end:
	ldr r4, =out_string										/* load 'substringed' into register 4 */

@copy char from src string to dest
strcopy:
	cmp r6, r2												/* compare r6 and r2 */
	bgt end 												/* branch to end if r6 > r2 */
	ldrb r5, [r0]											/* load immediate register 5 with contents of register 0 */
	strb r5, [r4]											/* store in register 5 with immediate contents of register 0 */
	add r6, r6, $1											/* r6 <- r4 + 1
	add r0, r0, $1											/* r0 <- r4 + 1
	add r4, r4, $1											/* r4 <- r4 + 1
	b strcopy												/* loop until r6 > r2 */

@end program
end:
	mov r7, $0												/* r7 = 0 */
	str r7, [r4]											/* store contents of register 4 in r7 */
	ldr r0, =out_string										/* load r0 with substring */
	bx lr 													/* return from sub_string subroutine */
	mov r7, $1
	svc $0
	.end													
