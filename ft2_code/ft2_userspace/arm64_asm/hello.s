	.cpu generic+fp+simd
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2

	.global	add
	.type	add, %function
add:
	add	w0, w0, w1
	ret

	.align	2
	.global	add_long
	.type	add_long, %function
add_long:
	add	x0, x0, x1
	ret

	.align	2
	.global	add64
	.type	add64, %function
add64:
	add	x0, x0, x1
	ret

	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -16]!

	adrp	x0, hello_str
	add	x0, x0, :lo12:hello_str
	bl	printf

	adrp    x29, buffer
	mov     x1,  x29
	stp     x3, x4, [x29], #16
	mov     x2,  x29
	adrp    x0,  str_print
	add     x0, x0, :lo12:str_print
	bl      printf
	
	ldp	x29, x30, [sp], 16

	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
hello_str:
	.string	"[zzy test] hello arm64\n"
str_print:
	.string  "\n0x%x\n0x%x\n"

	.bss
	.align	4
	.type	a, %object
	.size	a, 400
buffer:
	.zero	400
	.text

	.data
	.align	4
	.type	a, %object
	.size	a, 400
buffer1:
	.word	1
	.word	2
	.word	3
	.zero	388
