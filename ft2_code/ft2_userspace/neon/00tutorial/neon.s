.global add3
add3:
	ldr	q0, [x0]
	movi	v1.16b, #0x3
	add	v0.16b, v0.16b, v1.16b
	str	q0, [x0]
	ret
