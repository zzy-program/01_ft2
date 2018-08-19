.global main
main:
	mov x7, #4
	mov x0, #1
	mov x2, #12
	ldr x1, =string
	/* swi 0 */
	mov x7, #1
	/* swi 0 */
  .data
string:
  .ascii "Hello World\n"
