	.cpu generic+fp+simd
	.file	"test.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB3:
	.file 1 "test.c"
	.loc 1 5 0
	.cfi_startproc
	stp	x29, x30, [sp, -224]!
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	.loc 1 6 0
	mov	w1, 2
	mov	w2, 1
	.loc 1 5 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 6 0
	add	x3, x29, 24
	.loc 1 9 0
	mov	w5, 5
	mov	x0, x3
	add	x4, x29, 224
	.loc 1 6 0
	str	xzr, [x29,216]
	stp	xzr, xzr, [x3]
	str	w1, [x29,28]
	.loc 1 9 0
	adrp	x1, .LANCHOR0
	.loc 1 6 0
	stp	xzr, xzr, [x3,16]
	stp	xzr, xzr, [x3,32]
	stp	xzr, xzr, [x3,48]
	stp	xzr, xzr, [x3,64]
	stp	xzr, xzr, [x3,80]
	stp	xzr, xzr, [x3,96]
	stp	xzr, xzr, [x3,112]
	stp	xzr, xzr, [x3,128]
	stp	xzr, xzr, [x3,144]
	stp	xzr, xzr, [x3,160]
	stp	xzr, xzr, [x3,176]
	str	w2, [x29,24]
	.loc 1 9 0
	str	w5, [x1,#:lo12:.LANCHOR0]
.LVL0:
.L2:
	.loc 1 12 0
	ldr	w1, [x0],4
	add	w2, w2, w1
	.loc 1 10 0 discriminator 1
	cmp	x0, x4
	.loc 1 12 0
	str	w2, [x3]
	.loc 1 10 0 discriminator 1
	bne	.L2
	.loc 1 15 0
	adrp	x0, .LC0
	mov	w1, 5
	add	x0, x0, :lo12:.LC0
	bl	printf
.LVL1:
	.loc 1 17 0
	mov	w0, 0
	ldp	x29, x30, [sp], 224
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.data
	.align	4
.LANCHOR0 = . + 0
	.type	a, %object
	.size	a, 400
a:
	.word	1
	.word	2
	.word	3
	.zero	388
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	.string	"%d, %d\n"
	.text
.Letext0:
	.file 2 "/home/zzy1/android-21-arm64/sysroot/usr/include/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x126
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF543
	.byte	0x1
	.4byte	.LASF544
	.4byte	.LASF545
	.4byte	.Ldebug_ranges0+0
	.8byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF532
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF533
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF534
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF535
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF536
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF537
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF538
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF539
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF540
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF541
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF542
	.uleb128 0x4
	.byte	0x8
	.4byte	0x87
	.uleb128 0x5
	.4byte	0x7a
	.uleb128 0x6
	.4byte	.LASF546
	.byte	0x1
	.byte	0x4
	.4byte	0x5e
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe4
	.uleb128 0x7
	.string	"b"
	.byte	0x1
	.byte	0x6
	.4byte	0xe4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x7
	.4byte	0x5e
	.uleb128 0x9
	.8byte	.LVL1
	.4byte	0x117
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x35
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0x5e
	.4byte	0xf4
	.uleb128 0xc
	.4byte	0x73
	.byte	0x31
	.byte	0
	.uleb128 0xb
	.4byte	0x5e
	.4byte	0x104
	.uleb128 0xc
	.4byte	0x73
	.byte	0x63
	.byte	0
	.uleb128 0x7
	.string	"a"
	.byte	0x1
	.byte	0x1
	.4byte	0xf4
	.uleb128 0x9
	.byte	0x3
	.8byte	a
	.uleb128 0xd
	.4byte	.LASF547
	.byte	0x2
	.byte	0xf7
	.4byte	0x5e
	.uleb128 0xe
	.4byte	0x81
	.uleb128 0xf
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.8byte	0
	.8byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.8byte	.LFB3
	.8byte	.LFE3
	.8byte	0
	.8byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF230
	.file 3 "/home/zzy1/android-21-arm64/sysroot/usr/include/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro2
	.file 4 "/home/zzy1/android-21-arm64/sysroot/usr/include/sys/cdefs_elf.h"
	.byte	0x3
	.uleb128 0x4d
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.file 5 "/home/zzy1/android-21-arm64/sysroot/usr/include/android/api-level.h"
	.byte	0x3
	.uleb128 0x223
	.uleb128 0x5
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.file 6 "/home/zzy1/android-21-arm64/sysroot/usr/include/sys/types.h"
	.byte	0x3
	.uleb128 0x32
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF324
	.file 7 "/home/zzy1/android-21-arm64/lib/gcc/aarch64-linux-android/4.9/include/stddef.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x7
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.file 8 "/home/zzy1/android-21-arm64/lib/gcc/aarch64-linux-android/4.9/include/stdint.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x8
	.file 9 "/home/zzy1/android-21-arm64/sysroot/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x9
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF376
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x7
	.byte	0x4
	.file 10 "/home/zzy1/android-21-arm64/sysroot/usr/include/machine/wchar_limits.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xa
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF460
	.byte	0x4
	.file 11 "/home/zzy1/android-21-arm64/sysroot/usr/include/linux/types.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF461
	.file 12 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm/types.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xc
	.file 13 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm-generic/types.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF462
	.file 14 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm-generic/int-ll64.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF463
	.file 15 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm/bitsperlong.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xf
	.byte	0x7
	.4byte	.Ldebug_macro10
	.file 16 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm-generic/bitsperlong.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF466
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 17 "/home/zzy1/android-21-arm64/sysroot/usr/include/linux/posix_types.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF467
	.file 18 "/home/zzy1/android-21-arm64/sysroot/usr/include/linux/stddef.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x12
	.file 19 "/home/zzy1/android-21-arm64/sysroot/usr/include/linux/compiler.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x7
	.4byte	.Ldebug_macro11
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro12
	.file 20 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm/posix_types.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x14
	.file 21 "/home/zzy1/android-21-arm64/sysroot/usr/include/asm-generic/posix_types.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF473
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF479
	.file 22 "/home/zzy1/android-21-arm64/sysroot/usr/include/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0x91
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF480
	.byte	0x4
	.byte	0x4
	.file 23 "/home/zzy1/android-21-arm64/lib/gcc/aarch64-linux-android/4.9/include/stdarg.h"
	.byte	0x3
	.uleb128 0x34
	.uleb128 0x17
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x4
	.byte	0x3
	.uleb128 0x35
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF495
	.byte	0x3
	.uleb128 0x38
	.uleb128 0x7
	.byte	0x7
	.4byte	.Ldebug_macro15
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro16
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.cd27c147c81e3a744fd87a858de92a93,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.38.32f703a9e625defa7d72885c5719fb70,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF236
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs_elf.h.31.5f5523dd6d8fb054570abb71ed672b2a,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF271
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.84.919816a892f3b5194e8d3021b87473f1,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0x163
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0x195
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0x19f
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0x20b
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0x20c
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0x20d
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0x20e
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0x216
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0x222
	.4byte	.LASF317
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.apilevel.h.29.0e2fe01b34f1c0ae5a3d9315ba97c15c,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF319
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.551.48ac9a15213ce24004f8051a55640b77,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0x242
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0x248
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0x24c
	.4byte	.LASF323
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.39.daafd3d79fe2f3a84d2d73d7d4e706f8,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF335
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF353
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF369
	.byte	0x6
	.uleb128 0x122
	.4byte	.LASF370
	.byte	0x6
	.uleb128 0x157
	.4byte	.LASF371
	.byte	0x6
	.uleb128 0x18d
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF373
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF375
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.wchar_limits.h.30.4697eeeac6672d6ae98264e53318dbfe,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF379
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.106.c58a0419fe1b6b7dc48b07b9850b6fa3,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF459
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.bitsperlong.h.20.b451f59fea2b7964e6772e988397c9e6,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF465
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.compiler.h.2.fd6916e32dafde1175d78f3198e75377,comdat
.Ldebug_macro11:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF470
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.posix_types.h.22.d80c3dd1df6c2b57aef4709b1b090b78,comdat
.Ldebug_macro12:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x16
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF472
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.25.449f15a0865651b31d265c5725c735d4,comdat
.Ldebug_macro13:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF478
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.31.72c3aa8d68b291953fa52b9471bcdff7,comdat
.Ldebug_macro14:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF482
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF494
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.158.a7efb00f6cbc6f43213b50e183c9830c,comdat
.Ldebug_macro15:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF336
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF354
	.byte	0x6
	.uleb128 0x157
	.4byte	.LASF371
	.byte	0x6
	.uleb128 0x18d
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF373
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF375
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.58.a2ce58959f8d4cf09172e2557d88e55f,comdat
.Ldebug_macro16:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF531
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF180:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF344:
	.string	"_SIZE_T_ "
.LASF257:
	.string	"__KERNEL_COPYRIGHT(_n,_s) __SECTIONSTRING(.copyright, _s)"
.LASF419:
	.string	"INT16_MIN (-32768)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 9223372036854775807LL"
.LASF185:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF149:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF367:
	.string	"__INT_WCHAR_T_H "
.LASF366:
	.string	"___int_wchar_t_h "
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF235:
	.string	"__has_builtin(x) 0"
.LASF210:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF115:
	.string	"__INT_FAST32_MAX__ 9223372036854775807L"
.LASF505:
	.string	"__SAPP 0x0100"
.LASF184:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF153:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 127"
.LASF262:
	.string	"__link_set_add_data(set,sym) __link_set_make_entry(set, sym)"
.LASF5:
	.string	"__VERSION__ \"4.9 20140827 (prerelease)\""
.LASF266:
	.string	"__link_set_add_data2(set,sym,n) __link_set_make_entry2(set, sym, n)"
.LASF89:
	.string	"__INT8_MAX__ 127"
.LASF365:
	.string	"_WCHAR_T_H "
.LASF544:
	.string	"test.c"
.LASF289:
	.string	"__used __attribute__((__used__))"
.LASF530:
	.string	"fropen(cookie,fn) funopen(cookie, fn, 0, 0, 0)"
.LASF158:
	.string	"__LDBL_MANT_DIG__ 113"
.LASF517:
	.string	"EOF (-1)"
.LASF507:
	.string	"__SOPT 0x0400"
.LASF500:
	.string	"__SWR 0x0008"
.LASF492:
	.string	"_VA_LIST_DEFINED "
.LASF145:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF203:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF392:
	.string	"UINT_FAST16_C(c) UINT32_C(c)"
.LASF312:
	.string	"__POSIX_VISIBLE 200809"
.LASF436:
	.string	"UINT_LEAST32_MAX UINT32_MAX"
.LASF216:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF402:
	.string	"UINT_FAST64_C(c) UINT64_C(c)"
.LASF339:
	.string	"_SIZE_T "
.LASF432:
	.string	"INT_FAST32_MIN INT32_MIN"
.LASF241:
	.string	"__indr_reference(sym,alias) "
.LASF370:
	.string	"_BSD_WCHAR_T_"
.LASF164:
	.string	"__DECIMAL_DIG__ 36"
.LASF443:
	.string	"INT_FAST64_MAX INT64_MAX"
.LASF351:
	.string	"_GCC_SIZE_T "
.LASF360:
	.string	"__WCHAR_T "
.LASF534:
	.string	"unsigned int"
.LASF469:
	.string	"__user "
.LASF280:
	.string	"__const const"
.LASF495:
	.string	"__need_NULL "
.LASF510:
	.string	"__SMOD 0x2000"
.LASF336:
	.string	"__need_ptrdiff_t"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF42:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF27:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF221:
	.string	"__AARCH64_CMODEL_SMALL__ 1"
.LASF2:
	.string	"__GNUC__ 4"
.LASF31:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF513:
	.string	"_IOFBF 0"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF293:
	.string	"__statement(x) __extension__(x)"
.LASF143:
	.string	"__DBL_MANT_DIG__ 53"
.LASF9:
	.string	"__ATOMIC_RELEASE 3"
.LASF493:
	.string	"_VA_LIST_T_H "
.LASF196:
	.string	"__CHAR_UNSIGNED__ 1"
.LASF46:
	.string	"__INT16_TYPE__ short int"
.LASF231:
	.string	"_SYS_CDEFS_H_ "
.LASF177:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF349:
	.string	"_SIZE_T_DECLARED "
.LASF323:
	.string	"__NDK_FPABI_MATH__ __NDK_FPABI__"
.LASF391:
	.string	"UINT_LEAST16_C(c) UINT16_C(c)"
.LASF7:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF23:
	.string	"__SIZEOF_SHORT__ 2"
.LASF52:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF509:
	.string	"__SOFF 0x1000"
.LASF53:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF410:
	.string	"INT8_MIN (-128)"
.LASF59:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF451:
	.string	"SIG_ATOMIC_MIN INT32_MIN"
.LASF67:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF33:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 255"
.LASF224:
	.string	"linux 1"
.LASF154:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF72:
	.string	"__SCHAR_MAX__ 127"
.LASF56:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF314:
	.string	"__BSD_VISIBLE 1"
.LASF57:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF168:
	.string	"__LDBL_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966L"
.LASF12:
	.string	"__pic__ 2"
.LASF334:
	.string	"___int_ptrdiff_t_h "
.LASF420:
	.string	"INT16_MAX (32767)"
.LASF61:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF15:
	.string	"__PIE__ 2"
.LASF267:
	.string	"__link_set_add_bss2(set,sym,n) __link_set_make_entry2(set, sym, n)"
.LASF248:
	.string	"__LIBC64_HIDDEN__ __LIBC_HIDDEN__"
.LASF511:
	.string	"__SALC 0x4000"
.LASF394:
	.string	"INT_LEAST32_C(c) INT32_C(c)"
.LASF406:
	.string	"UINT64_C(c) c ## UL"
.LASF157:
	.string	"__FP_FAST_FMA 1"
.LASF467:
	.string	"_LINUX_POSIX_TYPES_H "
.LASF214:
	.string	"__SIZEOF_INT128__ 16"
.LASF485:
	.string	"va_start(v,l) __builtin_va_start(v,l)"
.LASF433:
	.string	"INT_FAST32_MAX INT32_MAX"
.LASF387:
	.string	"INT16_C(c) c"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF434:
	.string	"UINT32_MAX (4294967295U)"
.LASF318:
	.string	"ANDROID_API_LEVEL_H "
.LASF217:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF519:
	.string	"FILENAME_MAX 1024"
.LASF341:
	.string	"_T_SIZE_ "
.LASF460:
	.string	"_GCC_WRAP_STDINT_H "
.LASF363:
	.string	"_WCHAR_T_DEFINED_ "
.LASF400:
	.string	"INT_FAST64_C(c) INT64_C(c)"
.LASF454:
	.string	"INTPTR_MIN INT64_MIN"
.LASF525:
	.string	"SEEK_END 2"
.LASF226:
	.string	"__unix__ 1"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF193:
	.string	"__REGISTER_PREFIX__ "
.LASF418:
	.string	"UINT_FAST8_MAX UINT8_MAX"
.LASF121:
	.string	"__INTPTR_MAX__ 9223372036854775807L"
.LASF449:
	.string	"UINTMAX_MAX UINT64_MAX"
.LASF345:
	.string	"_BSD_SIZE_T_ "
.LASF142:
	.string	"__FP_FAST_FMAF 1"
.LASF368:
	.string	"_GCC_WCHAR_T "
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF71:
	.string	"__GXX_ABI_VERSION 999999"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF14:
	.string	"__pie__ 2"
.LASF258:
	.string	"__link_set_make_entry(set,sym) static void const * const __link_set_ ##set ##_sym_ ##sym __section(\"link_set_\" #set) __used = &sym"
.LASF175:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF425:
	.string	"UINT16_MAX (65535)"
.LASF477:
	.string	"__aligned_be64 __be64 __attribute__((aligned(8)))"
.LASF348:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF437:
	.string	"UINT_FAST32_MAX UINT32_MAX"
.LASF457:
	.string	"PTRDIFF_MIN INT64_MIN"
.LASF468:
	.string	"_UAPI_LINUX_COMPILER_H "
.LASF159:
	.string	"__LDBL_DIG__ 33"
.LASF540:
	.string	"long long unsigned int"
.LASF277:
	.string	"__P(protos) protos"
.LASF187:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF385:
	.string	"UINT_LEAST8_C(c) UINT8_C(c)"
.LASF409:
	.string	"PTRDIFF_C(c) INT64_C(c)"
.LASF191:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF322:
	.string	"__NDK_FPABI__ "
.LASF393:
	.string	"INT32_C(c) c"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF255:
	.string	"__KERNEL_RCSID(_n,_s) __RCSID(_s)"
.LASF26:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF156:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF256:
	.string	"__KERNEL_SCCSID(_n,_s) "
.LASF96:
	.string	"__UINT64_MAX__ 18446744073709551615UL"
.LASF476:
	.string	"__aligned_u64 __u64 __attribute__((aligned(8)))"
.LASF503:
	.string	"__SERR 0x0040"
.LASF274:
	.string	"__static_cast(x,y) (x)y"
.LASF162:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 9223372036854775807L"
.LASF290:
	.string	"__packed __attribute__((__packed__))"
.LASF69:
	.string	"__INTPTR_TYPE__ long int"
.LASF183:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF207:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF300:
	.string	"__predict_true(exp) __builtin_expect((exp) != 0, 1)"
.LASF413:
	.string	"INT_LEAST8_MAX INT8_MAX"
.LASF113:
	.string	"__INT_FAST8_MAX__ 127"
.LASF490:
	.string	"_VA_LIST_ "
.LASF315:
	.string	"__ISO_C_VISIBLE 1999"
.LASF30:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF356:
	.string	"__WCHAR_T__ "
.LASF85:
	.string	"__UINTMAX_MAX__ 18446744073709551615UL"
.LASF306:
	.string	"__wur __attribute__((__warn_unused_result__))"
.LASF186:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF166:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF331:
	.string	"__PTRDIFF_T "
.LASF380:
	.string	"__BIT_TYPES_DEFINED__ "
.LASF47:
	.string	"__INT32_TYPE__ int"
.LASF286:
	.string	"__pure "
.LASF307:
	.string	"__errordecl(name,msg) extern void name(void) __attribute__((__error__(msg)))"
.LASF174:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF515:
	.string	"_IONBF 2"
.LASF260:
	.string	"__link_set_add_text(set,sym) __link_set_make_entry(set, sym)"
.LASF294:
	.string	"__nonnull(args) __attribute__((__nonnull__ args))"
.LASF478:
	.string	"__aligned_le64 __le64 __attribute__((aligned(8)))"
.LASF355:
	.string	"__wchar_t__ "
.LASF379:
	.string	"WCHAR_MIN (-(WCHAR_MAX) - 1)"
.LASF514:
	.string	"_IOLBF 1"
.LASF238:
	.string	"_C_LABEL(x) x"
.LASF346:
	.string	"_SIZE_T_DEFINED_ "
.LASF272:
	.string	"__BEGIN_DECLS "
.LASF395:
	.string	"INT_FAST32_C(c) INT32_C(c)"
.LASF230:
	.string	"_STDIO_H_ "
.LASF372:
	.string	"NULL"
.LASF491:
	.string	"_VA_LIST "
.LASF424:
	.string	"INT_FAST16_MAX INT32_MAX"
.LASF16:
	.string	"__OPTIMIZE__ 1"
.LASF317:
	.string	"__BIONIC__ 1"
.LASF228:
	.string	"__ANDROID__ 1"
.LASF150:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF421:
	.string	"INT_LEAST16_MIN INT16_MIN"
.LASF429:
	.string	"INT32_MAX (2147483647)"
.LASF412:
	.string	"INT_LEAST8_MIN INT8_MIN"
.LASF50:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF165:
	.string	"__LDBL_MAX__ 1.18973149535723176508575932662800702e+4932L"
.LASF3:
	.string	"__GNUC_MINOR__ 9"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF330:
	.string	"_T_PTRDIFF "
.LASF397:
	.string	"UINT_LEAST32_C(c) UINT32_C(c)"
.LASF422:
	.string	"INT_LEAST16_MAX INT16_MAX"
.LASF58:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF167:
	.string	"__LDBL_EPSILON__ 1.92592994438723585305597794258492732e-34L"
.LASF310:
	.string	"__link_set_entry(set,idx) (__link_set_begin(set)[idx])"
.LASF373:
	.string	"NULL ((void *)0)"
.LASF91:
	.string	"__INT32_MAX__ 2147483647"
.LASF309:
	.string	"__link_set_foreach(pvar,set) for (pvar = __link_set_start(set); pvar < __link_set_end(set); pvar++)"
.LASF234:
	.string	"__has_include(x) 0"
.LASF396:
	.string	"UINT32_C(c) c ## U"
.LASF516:
	.string	"BUFSIZ 1024"
.LASF466:
	.string	"_UAPI__ASM_GENERIC_BITS_PER_LONG "
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF496:
	.string	"_FSTDIO "
.LASF282:
	.string	"__volatile volatile"
.LASF239:
	.string	"_C_LABEL_STRING(x) x"
.LASF199:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF361:
	.string	"_WCHAR_T_ "
.LASF36:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF390:
	.string	"UINT16_C(c) c"
.LASF459:
	.string	"SIZE_MAX UINT64_MAX"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF146:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF542:
	.string	"char"
.LASF299:
	.string	"__insn_barrier() __asm __volatile(\"\":::\"memory\")"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 4294967295U"
.LASF161:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF445:
	.string	"UINT_LEAST64_MAX UINT64_MAX"
.LASF22:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF285:
	.string	"__dead "
.LASF455:
	.string	"INTPTR_MAX INT64_MAX"
.LASF284:
	.string	"__UNCONST(a) ((void *)(unsigned long)(const void *)(a))"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 18446744073709551615UL"
.LASF381:
	.string	"INT8_C(c) c"
.LASF222:
	.string	"__linux 1"
.LASF483:
	.string	"__need___va_list"
.LASF254:
	.string	"__COPYRIGHT(_s) static const char copyright[] __attribute__((__unused__,__section__(\".copyright\"))) = _s"
.LASF512:
	.string	"__SIGN 0x8000"
.LASF6:
	.string	"__ATOMIC_RELAXED 0"
.LASF95:
	.string	"__UINT32_MAX__ 4294967295U"
.LASF494:
	.string	"__va_list__ "
.LASF408:
	.string	"UINTPTR_C(c) UINT64_C(c)"
.LASF352:
	.string	"_SIZET_ "
.LASF428:
	.string	"INT32_MIN (-2147483647-1)"
.LASF64:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF176:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF498:
	.string	"__SNBF 0x0002"
.LASF54:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF335:
	.string	"_GCC_PTRDIFF_T "
.LASF265:
	.string	"__link_set_add_rodata2(set,sym,n) __link_set_make_entry2(set, sym, n)"
.LASF371:
	.string	"__need_wchar_t"
.LASF321:
	.string	"__BIONIC_FORTIFY_UNKNOWN_SIZE ((size_t) -1)"
.LASF414:
	.string	"INT_FAST8_MIN INT8_MIN"
.LASF144:
	.string	"__DBL_DIG__ 15"
.LASF504:
	.string	"__SMBF 0x0080"
.LASF244:
	.string	"__weak_extern(sym) __asm__(\".weak \" _C_LABEL_STRING(#sym));"
.LASF19:
	.string	"__LP64__ 1"
.LASF208:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF403:
	.string	"INTMAX_C(c) INT64_C(c)"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 65535"
.LASF291:
	.string	"__aligned(x) __attribute__((__aligned__(x)))"
.LASF545:
	.string	"/home/zzy1/study/hello_arm64_asm"
.LASF18:
	.string	"_LP64 1"
.LASF435:
	.string	"UINT32_MIN (0)"
.LASF90:
	.string	"__INT16_MAX__ 32767"
.LASF539:
	.string	"long long int"
.LASF28:
	.string	"__CHAR_BIT__ 8"
.LASF151:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF547:
	.string	"printf"
.LASF201:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF472:
	.string	"__FD_SETSIZE 1024"
.LASF17:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 2147483647"
.LASF453:
	.string	"WINT_MIN INT32_MIN"
.LASF281:
	.string	"__signed signed"
.LASF405:
	.string	"INT64_C(c) c ## L"
.LASF233:
	.string	"__has_feature(x) 0"
.LASF73:
	.string	"__SHRT_MAX__ 32767"
.LASF325:
	.string	"_STDDEF_H "
.LASF529:
	.string	"L_ctermid 1024"
.LASF229:
	.string	"__ELF__ 1"
.LASF278:
	.string	"__CONCAT(x,y) x ## y"
.LASF70:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF452:
	.string	"WINT_MAX INT32_MAX"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF212:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF24:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF178:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 18446744073709551615UL"
.LASF275:
	.string	"___STRING(x) __STRING(x)"
.LASF0:
	.string	"__STDC__ 1"
.LASF364:
	.string	"_WCHAR_T_DEFINED "
.LASF287:
	.string	"__unused __attribute__((__unused__))"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 255"
.LASF21:
	.string	"__SIZEOF_LONG__ 8"
.LASF11:
	.string	"__ATOMIC_CONSUME 1"
.LASF328:
	.string	"_PTRDIFF_T "
.LASF338:
	.string	"__SIZE_T__ "
.LASF39:
	.string	"__WINT_TYPE__ unsigned int"
.LASF489:
	.string	"__va_copy(d,s) __builtin_va_copy(d,s)"
.LASF488:
	.string	"va_copy(d,s) __builtin_va_copy(d,s)"
.LASF264:
	.string	"__link_set_add_text2(set,sym,n) __link_set_make_entry2(set, sym, n)"
.LASF38:
	.string	"__WCHAR_TYPE__ unsigned int"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF63:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF296:
	.string	"__scanflike(x,y) __attribute__((__format__(scanf, x, y))) __nonnull((x))"
.LASF446:
	.string	"UINT_FAST64_MAX UINT64_MAX"
.LASF25:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF4:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF527:
	.string	"stdout (&__sF[1])"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF77:
	.string	"__WCHAR_MAX__ 4294967295U"
.LASF523:
	.string	"SEEK_SET 0"
.LASF269:
	.string	"__link_set_start(set) (__start_link_set_ ##set)"
.LASF384:
	.string	"UINT8_C(c) c"
.LASF295:
	.string	"__printflike(x,y) __attribute__((__format__(printf, x, y))) __nonnull((x))"
.LASF243:
	.string	"__weak_alias(alias,sym) __asm__(\".weak \" _C_LABEL_STRING(#alias) \"\\n\" _C_LABEL_STRING(#alias) \" = \" _C_LABEL_STRING(#sym));"
.LASF531:
	.string	"fwopen(cookie,fn) funopen(cookie, 0, fn, 0, 0)"
.LASF333:
	.string	"_BSD_PTRDIFF_T_ "
.LASF240:
	.string	"___RENAME(x) __asm__(___STRING(_C_LABEL(x)))"
.LASF170:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF404:
	.string	"UINTMAX_C(c) UINT64_C(c)"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF324:
	.string	"_SYS_TYPES_H_ "
.LASF292:
	.string	"__section(x) __attribute__((__section__(x)))"
.LASF524:
	.string	"SEEK_CUR 1"
.LASF215:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF259:
	.string	"__link_set_make_entry2(set,sym,n) static void const * const __link_set_ ##set ##_sym_ ##sym ##_ ##n __section(\"link_set_\" #set) __used = &sym[n]"
.LASF34:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF319:
	.string	"__ANDROID_API__ 21"
.LASF172:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF497:
	.string	"__SLBF 0x0001"
.LASF354:
	.string	"__need_size_t"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF382:
	.string	"INT_LEAST8_C(c) INT8_C(c)"
.LASF416:
	.string	"UINT8_MAX (255)"
.LASF8:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF219:
	.string	"__AARCH64EL__ 1"
.LASF441:
	.string	"INT_LEAST64_MAX INT64_MAX"
.LASF41:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF276:
	.string	"___CONCAT(x,y) __CONCAT(x,y)"
.LASF188:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF358:
	.string	"_T_WCHAR_ "
.LASF270:
	.string	"__link_set_end(set) (__stop_link_set_ ##set)"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 18446744073709551615UL"
.LASF304:
	.string	"__purefunc __attribute__((pure))"
.LASF93:
	.string	"__UINT8_MAX__ 255"
.LASF311:
	.string	"__FBSDID(s) "
.LASF205:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF32:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF499:
	.string	"__SRD 0x0004"
.LASF79:
	.string	"__WINT_MAX__ 4294967295U"
.LASF116:
	.string	"__INT_FAST64_MAX__ 9223372036854775807L"
.LASF82:
	.string	"__SIZE_MAX__ 18446744073709551615UL"
.LASF440:
	.string	"INT_LEAST64_MIN INT64_MIN"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF279:
	.string	"__STRING(x) #x"
.LASF160:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF541:
	.string	"sizetype"
.LASF427:
	.string	"UINT_FAST16_MAX UINT32_MAX"
.LASF470:
	.string	"__force "
.LASF484:
	.string	"__GNUC_VA_LIST "
.LASF506:
	.string	"__SSTR 0x0200"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 32767"
.LASF20:
	.string	"__SIZEOF_INT__ 4"
.LASF442:
	.string	"INT_FAST64_MIN INT64_MIN"
.LASF537:
	.string	"short int"
.LASF369:
	.string	"_WCHAR_T_DECLARED "
.LASF181:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF431:
	.string	"INT_LEAST32_MAX INT32_MAX"
.LASF522:
	.string	"TMP_MAX 308915776"
.LASF450:
	.string	"SIG_ATOMIC_MAX INT32_MAX"
.LASF532:
	.string	"long int"
.LASF92:
	.string	"__INT64_MAX__ 9223372036854775807L"
.LASF252:
	.string	"__SCCSID(_s) "
.LASF43:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF374:
	.string	"__need_NULL"
.LASF487:
	.string	"va_arg(v,l) __builtin_va_arg(v,l)"
.LASF195:
	.string	"__GNUC_GNU_INLINE__ 1"
.LASF189:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF245:
	.string	"__warn_references(sym,msg) "
.LASF401:
	.string	"UINT_LEAST64_C(c) UINT64_C(c)"
.LASF298:
	.string	"__RENAME(x) ___RENAME(x)"
.LASF301:
	.string	"__predict_false(exp) __builtin_expect((exp) != 0, 0)"
.LASF271:
	.string	"__link_set_count(set) (__link_set_end(set) - __link_set_start(set))"
.LASF65:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF171:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF45:
	.string	"__INT8_TYPE__ signed char"
.LASF305:
	.string	"__always_inline __attribute__((__always_inline__))"
.LASF75:
	.string	"__LONG_MAX__ 9223372036854775807L"
.LASF383:
	.string	"INT_FAST8_C(c) INT8_C(c)"
.LASF340:
	.string	"_SYS_SIZE_T_H "
.LASF464:
	.string	"__ASM_BITSPERLONG_H "
.LASF303:
	.string	"__mallocfunc __attribute__((malloc))"
.LASF51:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF249:
	.string	"__LIBC_ABI_PUBLIC__ __attribute__((visibility (\"default\")))"
.LASF83:
	.string	"__INTMAX_MAX__ 9223372036854775807L"
.LASF474:
	.string	"__bitwise__ "
.LASF261:
	.string	"__link_set_add_rodata(set,sym) __link_set_make_entry(set, sym)"
.LASF526:
	.string	"stdin (&__sF[0])"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 2147483647"
.LASF543:
	.string	"GNU C 4.9 20140827 (prerelease) -mbionic -mlittle-endian -mabi=lp64 -g3 -O3 -fPIE"
.LASF475:
	.string	"__bitwise "
.LASF49:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF353:
	.string	"__size_t "
.LASF407:
	.string	"INTPTR_C(c) INT64_C(c)"
.LASF486:
	.string	"va_end(v) __builtin_va_end(v)"
.LASF342:
	.string	"_T_SIZE "
.LASF439:
	.string	"INT64_MAX (INT64_C(9223372036854775807))"
.LASF482:
	.string	"_ANSI_STDARG_H_ "
.LASF521:
	.string	"L_tmpnam 1024"
.LASF35:
	.string	"__SIZEOF_POINTER__ 8"
.LASF462:
	.string	"_ASM_GENERIC_TYPES_H "
.LASF430:
	.string	"INT_LEAST32_MIN INT32_MIN"
.LASF218:
	.string	"__aarch64__ 1"
.LASF320:
	.string	"__WORDSIZE 64"
.LASF347:
	.string	"_SIZE_T_DEFINED "
.LASF211:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF520:
	.string	"P_tmpdir \"/tmp/\""
.LASF546:
	.string	"main"
.LASF66:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF194:
	.string	"__USER_LABEL_PREFIX__ "
.LASF533:
	.string	"long unsigned int"
.LASF204:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF357:
	.string	"_WCHAR_T "
.LASF94:
	.string	"__UINT16_MAX__ 65535"
.LASF308:
	.string	"__warnattr(msg) __attribute__((__warning__(msg)))"
.LASF350:
	.string	"___int_size_t_h "
.LASF1:
	.string	"__STDC_HOSTED__ 1"
.LASF508:
	.string	"__SNPT 0x0800"
.LASF447:
	.string	"INTMAX_MIN INT64_MIN"
.LASF359:
	.string	"_T_WCHAR "
.LASF251:
	.string	"__RCSID(_s) __IDSTRING(rcsid,_s)"
.LASF386:
	.string	"UINT_FAST8_C(c) UINT8_C(c)"
.LASF213:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF377:
	.string	"_MACHINE_WCHAR_LIMITS_H_ "
.LASF388:
	.string	"INT_LEAST16_C(c) INT16_C(c)"
.LASF378:
	.string	"WCHAR_MAX __WCHAR_MAX__"
.LASF81:
	.string	"__PTRDIFF_MAX__ 9223372036854775807L"
.LASF471:
	.string	"__FD_SETSIZE"
.LASF253:
	.string	"__SCCSID2(_s) "
.LASF209:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF389:
	.string	"INT_FAST16_C(c) INT32_C(c)"
.LASF10:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF122:
	.string	"__UINTPTR_MAX__ 18446744073709551615UL"
.LASF536:
	.string	"unsigned char"
.LASF173:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF48:
	.string	"__INT64_TYPE__ long int"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF297:
	.string	"__func__ __PRETTY_FUNCTION__"
.LASF417:
	.string	"UINT_LEAST8_MAX UINT8_MAX"
.LASF283:
	.string	"__aconst "
.LASF268:
	.string	"__link_set_decl(set,ptype) extern ptype * const __start_link_set_ ##set[]; extern ptype * const __stop_link_set_ ##set[]"
.LASF220:
	.string	"__ARM_NEON 1"
.LASF423:
	.string	"INT_FAST16_MIN INT32_MIN"
.LASF13:
	.string	"__PIC__ 2"
.LASF362:
	.string	"_BSD_WCHAR_T_ "
.LASF55:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF60:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF329:
	.string	"_T_PTRDIFF_ "
.LASF313:
	.string	"__XSI_VISIBLE 700"
.LASF448:
	.string	"INTMAX_MAX INT64_MAX"
.LASF147:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF326:
	.string	"_STDDEF_H_ "
.LASF461:
	.string	"_UAPI_LINUX_TYPES_H "
.LASF465:
	.string	"__BITS_PER_LONG 64"
.LASF206:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF114:
	.string	"__INT_FAST16_MAX__ 9223372036854775807L"
.LASF438:
	.string	"INT64_MIN (INT64_C(-9223372036854775807)-1)"
.LASF473:
	.string	"__ASM_GENERIC_POSIX_TYPES_H "
.LASF479:
	.string	"_SSIZE_T_DEFINED_ "
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF481:
	.string	"_STDARG_H "
.LASF78:
	.string	"__WCHAR_MIN__ 0U"
.LASF155:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF273:
	.string	"__END_DECLS "
.LASF456:
	.string	"UINTPTR_MAX UINT64_MAX"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF37:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF62:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF192:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF236:
	.string	"__GNUC_PREREQ(x,y) ((__GNUC__ == (x) && __GNUC_MINOR__ >= (y)) || (__GNUC__ > (x)))"
.LASF415:
	.string	"INT_FAST8_MAX INT8_MAX"
.LASF375:
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
.LASF535:
	.string	"signed char"
.LASF148:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF399:
	.string	"INT_LEAST64_C(c) INT64_C(c)"
.LASF246:
	.string	"__SECTIONSTRING(_sec,_str) __asm__(\".section \" #_sec \"\\n\\t.asciz \\\"\" _str \"\\\"\\n\\t.previous\")"
.LASF528:
	.string	"stderr (&__sF[2])"
.LASF538:
	.string	"short unsigned int"
.LASF316:
	.string	"__XPG_VISIBLE 700"
.LASF501:
	.string	"__SRW 0x0010"
.LASF29:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF518:
	.string	"FOPEN_MAX 20"
.LASF411:
	.string	"INT8_MAX (127)"
.LASF343:
	.string	"__SIZE_T "
.LASF40:
	.string	"__INTMAX_TYPE__ long int"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF332:
	.string	"_PTRDIFF_T_ "
.LASF237:
	.string	"_SYS_CDEFS_ELF_H_ "
.LASF190:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF458:
	.string	"PTRDIFF_MAX INT64_MAX"
.LASF250:
	.string	"__IDSTRING(_n,_s) __SECTIONSTRING(.ident,_s)"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 18446744073709551615UL"
.LASF480:
	.string	"_SYS_SYSMACROS_H_ "
.LASF426:
	.string	"UINT_LEAST16_MAX UINT16_MAX"
.LASF302:
	.string	"__noreturn __attribute__((__noreturn__))"
.LASF288:
	.string	"__pure2 __attribute__((__const__))"
.LASF225:
	.string	"__unix 1"
.LASF223:
	.string	"__linux__ 1"
.LASF398:
	.string	"UINT_FAST32_C(c) UINT32_C(c)"
.LASF263:
	.string	"__link_set_add_bss(set,sym) __link_set_make_entry(set, sym)"
.LASF376:
	.string	"_STDINT_H "
.LASF502:
	.string	"__SEOF 0x0020"
.LASF68:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF242:
	.string	"__strong_alias(alias,sym) __asm__(\".global \" _C_LABEL_STRING(#alias) \"\\n\" _C_LABEL_STRING(#alias) \" = \" _C_LABEL_STRING(#sym));"
.LASF463:
	.string	"_UAPI_ASM_GENERIC_INT_LL64_H "
.LASF327:
	.string	"_ANSI_STDDEF_H "
.LASF163:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF182:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF444:
	.string	"UINT64_MAX (UINT64_C(18446744073709551615))"
.LASF152:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF227:
	.string	"unix 1"
.LASF74:
	.string	"__INT_MAX__ 2147483647"
.LASF44:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF232:
	.string	"__has_extension __has_feature"
.LASF200:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF169:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF247:
	.string	"__LIBC_HIDDEN__ __attribute__((visibility (\"hidden\")))"
.LASF337:
	.string	"__size_t__ "
.LASF179:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF123:
	.string	"__GCC_IEC_559 2"
	.ident	"GCC: (GNU) 4.9 20140827 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
