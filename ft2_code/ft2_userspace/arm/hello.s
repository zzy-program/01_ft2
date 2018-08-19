	.arch armv5te
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"hello.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	add
	.type	add, %function
add:
.LFB3:
	.file 1 "hello.c"
	.loc 1 3 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 5 0
	add	r0, r0, r1
.LVL1:
	bx	lr
	.cfi_endproc
.LFE3:
	.size	add, .-add
	.align	2
	.global	add_long
	.type	add_long, %function
add_long:
.LFB4:
	.loc 1 7 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	.loc 1 9 0
	add	r0, r0, r1
.LVL3:
	bx	lr
	.cfi_endproc
.LFE4:
	.size	add_long, .-add_long
	.align	2
	.global	add64
	.type	add64, %function
add64:
.LFB5:
	.loc 1 11 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
	.loc 1 13 0
	adds	r0, r0, r2
.LVL5:
	adc	r1, r1, r3
	bx	lr
	.cfi_endproc
.LFE5:
	.size	add64, .-add64
	.align	2
	.global	f
	.type	f, %function
f:
.LFB6:
	.loc 1 15 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL6:
	.loc 1 17 0
	subs	r2, r0, #0
	.loc 1 16 0
	mov	r0, #0
.LVL7:
	.loc 1 17 0
	ble	.L7
	mov	r3, r0
.LVL8:
.L6:
	.loc 1 18 0 discriminator 2
	add	r0, r0, r3
.LVL9:
	.loc 1 17 0 discriminator 2
	add	r3, r3, #1
.LVL10:
	cmp	r3, r2
	bne	.L6
	bx	lr
.LVL11:
.L7:
	.loc 1 21 0
	bx	lr
	.cfi_endproc
.LFE6:
	.size	f, .-f
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB7:
	.loc 1 23 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL12:
	.loc 1 28 0
	ldr	r0, .L11
.LPIC0:
	add	r0, pc, r0
	b	puts(PLT)
.LVL13:
.L12:
	.align	2
.L11:
	.word	.LC0-(.LPIC0+8)
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"hello arm64\000"
	.text
.Letext0:
	.file 2 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1f2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF687
	.byte	0x1
	.4byte	.LASF688
	.4byte	.LASF689
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF673
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF674
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF675
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF676
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF677
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF678
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF679
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF680
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF681
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF682
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF683
	.uleb128 0x4
	.byte	0x4
	.4byte	0x83
	.uleb128 0x5
	.4byte	0x76
	.uleb128 0x6
	.ascii	"add\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x30
	.byte	0x1
	.4byte	0xab
	.uleb128 0x7
	.ascii	"a\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x30
	.uleb128 0x7
	.ascii	"b\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x30
	.byte	0
	.uleb128 0x8
	.4byte	.LASF684
	.byte	0x1
	.byte	0x7
	.4byte	0x68
	.byte	0x1
	.4byte	0xce
	.uleb128 0x7
	.ascii	"a\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x68
	.uleb128 0x7
	.ascii	"b\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x68
	.byte	0
	.uleb128 0x8
	.4byte	.LASF685
	.byte	0x1
	.byte	0xb
	.4byte	0x5a
	.byte	0x1
	.4byte	0xf1
	.uleb128 0x7
	.ascii	"a\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x5a
	.uleb128 0x7
	.ascii	"b\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x5a
	.byte	0
	.uleb128 0x6
	.ascii	"f\000"
	.byte	0x1
	.byte	0xf
	.4byte	0x30
	.byte	0x1
	.4byte	0x11d
	.uleb128 0x7
	.ascii	"n\000"
	.byte	0x1
	.byte	0xf
	.4byte	0x30
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x30
	.uleb128 0x9
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x30
	.byte	0
	.uleb128 0xa
	.4byte	0x88
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x141
	.uleb128 0xb
	.4byte	0x98
	.4byte	.LLST0
	.uleb128 0xc
	.4byte	0xa1
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xa
	.4byte	0xab
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x165
	.uleb128 0xb
	.4byte	0xbb
	.4byte	.LLST1
	.uleb128 0xc
	.4byte	0xc4
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xa
	.4byte	0xce
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18e
	.uleb128 0xb
	.4byte	0xde
	.4byte	.LLST2
	.uleb128 0xc
	.4byte	0xe7
	.uleb128 0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0
	.uleb128 0xa
	.4byte	0xf1
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bd
	.uleb128 0xb
	.4byte	0xff
	.4byte	.LLST3
	.uleb128 0xd
	.4byte	0x108
	.4byte	.LLST4
	.uleb128 0xd
	.4byte	0x111
	.4byte	.LLST5
	.byte	0
	.uleb128 0xe
	.4byte	.LASF690
	.byte	0x1
	.byte	0x17
	.4byte	0x30
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e0
	.uleb128 0xf
	.4byte	.LVL13
	.4byte	0x1e0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF686
	.byte	0x2
	.byte	0
	.4byte	.LASF691
	.4byte	0x30
	.uleb128 0x11
	.4byte	0x7d
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
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
	.uleb128 0x8
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LFE3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LFE4
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL5
	.4byte	.LFE5
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0
	.uleb128 0x29
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE6
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL11
	.4byte	.LFE6
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE6
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	0
	.4byte	0
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
	.file 3 "/home/zzy1/android-19-arm/sysroot/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF351
	.file 4 "/home/zzy1/android-19-arm/sysroot/usr/include/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro2
	.file 5 "/home/zzy1/android-19-arm/sysroot/usr/include/sys/cdefs_elf.h"
	.byte	0x3
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.file 6 "/home/zzy1/android-19-arm/sysroot/usr/include/android/api-level.h"
	.byte	0x3
	.uleb128 0x1f4
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.file 7 "/home/zzy1/android-19-arm/sysroot/usr/include/sys/types.h"
	.byte	0x3
	.uleb128 0x32
	.uleb128 0x7
	.byte	0x7
	.4byte	.Ldebug_macro7
	.file 8 "/home/zzy1/android-19-arm/lib/gcc/arm-linux-androideabi/4.8/include/stddef.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.file 9 "/home/zzy1/android-19-arm/lib/gcc/arm-linux-androideabi/4.8/include/stdint.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x9
	.file 10 "/home/zzy1/android-19-arm/sysroot/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0xa
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF459
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.file 11 "/home/zzy1/android-19-arm/sysroot/usr/include/sys/_types.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x7
	.4byte	.Ldebug_macro10
	.file 12 "/home/zzy1/android-19-arm/sysroot/usr/include/machine/_types.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF486
	.byte	0x4
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF485
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro11
	.file 13 "/home/zzy1/android-19-arm/sysroot/usr/include/sys/_wchar_limits.h"
	.byte	0x3
	.uleb128 0xf2
	.uleb128 0xd
	.byte	0x7
	.4byte	.Ldebug_macro12
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF575
	.byte	0x4
	.file 14 "/home/zzy1/android-19-arm/sysroot/usr/include/linux/posix_types.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0xe
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF576
	.file 15 "/home/zzy1/android-19-arm/sysroot/usr/include/linux/stddef.h"
	.byte	0x3
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF577
	.file 16 "/home/zzy1/android-19-arm/sysroot/usr/include/linux/compiler.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x10
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro15
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro16
	.file 17 "/home/zzy1/android-19-arm/sysroot/usr/include/asm/posix_types.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x11
	.byte	0x7
	.4byte	.Ldebug_macro17
	.byte	0x4
	.byte	0x4
	.file 18 "/home/zzy1/android-19-arm/sysroot/usr/include/asm/types.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x12
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF613
	.byte	0x4
	.file 19 "/home/zzy1/android-19-arm/sysroot/usr/include/linux/types.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x13
	.byte	0x7
	.4byte	.Ldebug_macro18
	.byte	0x4
	.file 20 "/home/zzy1/android-19-arm/sysroot/usr/include/machine/kernel.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF617
	.byte	0x4
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF618
	.file 21 "/home/zzy1/android-19-arm/sysroot/usr/include/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0x6b
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF619
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF620
	.file 22 "/home/zzy1/android-19-arm/lib/gcc/arm-linux-androideabi/4.8/include/stdarg.h"
	.byte	0x3
	.uleb128 0x36
	.uleb128 0x16
	.byte	0x7
	.4byte	.Ldebug_macro19
	.byte	0x4
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF429
	.byte	0x3
	.uleb128 0x3a
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro20
	.byte	0x4
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF623
	.byte	0x3
	.uleb128 0x3d
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro21
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.ec7bec08fa1a9a9785032af4940db426,comdat
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
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.38.97e2b1314f811d18f0a053effecaea78,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF353
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs_elf.h.31.e3560a6c09a70b3e1c866e88b91a22e0,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF386
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.66.c393b82fff6bdd5ae80622d8c392d240,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0x170
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0x1dc
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0x1dd
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0x1de
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0x1df
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0x1e7
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0x1f3
	.4byte	.LASF423
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.apilevel.h.29.0317010d4383f9ba4d58134e9788ad45,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF425
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.518.69b183c7297a794d6b54309692e18aaa,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x206
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0x20c
	.4byte	.LASF427
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.29.e7b5bfc2be6543538588701d63f3d96c,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF430
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.136.418e2cdb05ddb7d8da6b6b3d8d4a4483,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF438
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF456
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF457
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF458
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.39.796d8f474c155a9bca694bae22f5711b,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF462
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF439
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF477
	.byte	0x6
	.uleb128 0x122
	.4byte	.LASF478
	.byte	0x6
	.uleb128 0x157
	.4byte	.LASF479
	.byte	0x6
	.uleb128 0x18d
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF481
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF482
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._types.h.35.a4e828c39a0b425bc4306f7b0bd46ab4,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF483
	.byte	0x6
	.uleb128 0x25
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF485
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.35.f48e2a03596256bf7e0a2c1fd9507245,comdat
.Ldebug_macro11:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF566
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._wchar_limits.h.29.351217413d09b9657ef96ee0760d0d96,comdat
.Ldebug_macro12:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF569
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.247.e0ace2be751822c574c7bc79c50e5b19,comdat
.Ldebug_macro13:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF574
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.compiler.h.13.92b195bde10345bc1d1f13cac2de04fa,comdat
.Ldebug_macro14:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF593
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.22.da596cc908d72447860ded85cc51dfd5,comdat
.Ldebug_macro15:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x16
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF481
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.posix_types.h.17.378adc9531006342e3b3365f801d72b2,comdat
.Ldebug_macro16:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x11
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF595
	.byte	0x6
	.uleb128 0x14
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF597
	.byte	0x6
	.uleb128 0x17
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF599
	.byte	0x6
	.uleb128 0x1a
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF601
	.byte	0x6
	.uleb128 0x1d
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF603
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.posix_types.h.13.bd024aa99f243da78b53a1e7ae477435,comdat
.Ldebug_macro17:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF604
	.byte	0x6
	.uleb128 0x38
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF606
	.byte	0x6
	.uleb128 0x3b
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF608
	.byte	0x6
	.uleb128 0x3e
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF610
	.byte	0x6
	.uleb128 0x41
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF612
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.13.fba784b4fb682a0cde619a8b73df8a78,comdat
.Ldebug_macro18:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF616
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro19:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF622
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.158.a7efb00f6cbc6f43213b50e183c9830c,comdat
.Ldebug_macro20:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF439
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF457
	.byte	0x6
	.uleb128 0x157
	.4byte	.LASF479
	.byte	0x6
	.uleb128 0x18d
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF481
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF482
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.63.e4d21fbd9a61eb269f7920ad983e670a,comdat
.Ldebug_macro21:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x170
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x17d
	.4byte	.LASF672
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF567:
	.ascii	"_SYS__WCHAR_LIMITS_H \000"
.LASF447:
	.ascii	"_SIZE_T_ \000"
.LASF372:
	.ascii	"__KERNEL_COPYRIGHT(_n,_s) __SECTIONSTRING(.copyrigh"
	.ascii	"t, _s)\000"
.LASF79:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF639:
	.ascii	"__SALC 0x4000\000"
.LASF74:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF179:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF75:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF144:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF398:
	.ascii	"__aconst \000"
.LASF475:
	.ascii	"__INT_WCHAR_T_H \000"
.LASF474:
	.ascii	"___int_wchar_t_h \000"
.LASF641:
	.ascii	"_IOLBF 1\000"
.LASF613:
	.ascii	"__ASM_ARM_TYPES_H \000"
.LASF93:
	.ascii	"__UINT32_MAX__ 4294967295U\000"
.LASF665:
	.ascii	"feof(p) __sfeof(p)\000"
.LASF563:
	.ascii	"INTMAX_C(c) INT64_C(c)\000"
.LASF657:
	.ascii	"L_ctermid 1024\000"
.LASF178:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF95:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF377:
	.ascii	"__link_set_add_data(set,sym) __link_set_make_entry("
	.ascii	"set, sym)\000"
.LASF39:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF367:
	.ascii	"__SCCSID(_s) \000"
.LASF87:
	.ascii	"__INT8_MAX__ 127\000"
.LASF473:
	.ascii	"_WCHAR_T_H \000"
.LASF104:
	.ascii	"__UINT8_C(c) c\000"
.LASF403:
	.ascii	"__used __attribute__((__used__))\000"
.LASF659:
	.ascii	"fropen(cookie,fn) funopen(cookie, fn, 0, 0, 0)\000"
.LASF270:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF268:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF550:
	.ascii	"__PRIFAST_RANK \"\"\000"
.LASF635:
	.ascii	"__SOPT 0x0400\000"
.LASF131:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF630:
	.ascii	"__SEOF 0x0020\000"
.LASF140:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF309:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
.LASF101:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF518:
	.ascii	"UINT_FAST16_C(c) UINT32_C(c)\000"
.LASF608:
	.ascii	"__FD_CLR(fd,fdsetp) (((fd_set *)(fdsetp))->fds_bits"
	.ascii	"[(fd) >> 5] &= ~(1<<((fd) & 31)))\000"
.LASF418:
	.ascii	"__POSIX_VISIBLE 200809\000"
.LASF526:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF321:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF548:
	.ascii	"UINT_FAST64_C(c) UINT64_C(c)\000"
.LASF145:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF356:
	.ascii	"_C_LABEL_STRING(x) x\000"
.LASF194:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF623:
	.ascii	"__need_NULL \000"
.LASF644:
	.ascii	"EOF (-1)\000"
.LASF478:
	.ascii	"_BSD_WCHAR_T_\000"
.LASF539:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF411:
	.ascii	"__predict_true(exp) __builtin_expect((exp) != 0, 1)"
	.ascii	"\000"
.LASF454:
	.ascii	"_GCC_SIZE_T \000"
.LASF3:
	.ascii	"__GNUC_MINOR__ 8\000"
.LASF674:
	.ascii	"unsigned int\000"
.LASF487:
	.ascii	"__STDINT_LIMITS \000"
.LASF395:
	.ascii	"__const const\000"
.LASF540:
	.ascii	"UINT64_MAX (__UINT64_C(18446744073709551615))\000"
.LASF640:
	.ascii	"_IOFBF 0\000"
.LASF638:
	.ascii	"__SMOD 0x2000\000"
.LASF439:
	.ascii	"__need_ptrdiff_t\000"
.LASF25:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF40:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF660:
	.ascii	"fwopen(cookie,fn) funopen(cookie, 0, fn, 0, 0)\000"
.LASF24:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF2:
	.ascii	"__GNUC__ 4\000"
.LASF29:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF183:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF323:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF685:
	.ascii	"add64\000"
.LASF301:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF138:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF58:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF9:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF615:
	.ascii	"__bitwise__ \000"
.LASF35:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF306:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF593:
	.ascii	"__attribute_const__ \000"
.LASF44:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF352:
	.ascii	"_SYS_CDEFS_H_ \000"
.LASF171:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF153:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF19:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF427:
	.ascii	"__NDK_FPABI_MATH__ __NDK_FPABI__\000"
.LASF258:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF426:
	.ascii	"__NDK_FPABI__ __attribute__((pcs(\"aapcs\")))\000"
.LASF7:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF522:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF98:
	.ascii	"__INT16_C(c) c\000"
.LASF666:
	.ascii	"ferror(p) __sferror(p)\000"
.LASF677:
	.ascii	"short int\000"
.LASF637:
	.ascii	"__SOFF 0x1000\000"
.LASF303:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF587:
	.ascii	"__builtin_warning(x,y...) (1)\000"
.LASF84:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF112:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF366:
	.ascii	"__RCSID(_s) __IDSTRING(rcsid,_s)\000"
.LASF31:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF103:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF345:
	.ascii	"linux 1\000"
.LASF560:
	.ascii	"INTMAX_MIN INT64_MIN\000"
.LASF465:
	.ascii	"_WCHAR_T \000"
.LASF208:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF329:
	.ascii	"__ARM_ARCH 5\000"
.LASF55:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF186:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF223:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF505:
	.ascii	"INT16_MAX (32767)\000"
.LASF59:
	.ascii	"__INT_FAST8_TYPE__ signed char\000"
.LASF15:
	.ascii	"__PIE__ 2\000"
.LASF21:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF382:
	.ascii	"__link_set_add_bss2(set,sym,n) __link_set_make_entr"
	.ascii	"y2(set, sym, n)\000"
.LASF423:
	.ascii	"__BIONIC__ 1\000"
.LASF249:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF265:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF254:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF546:
	.ascii	"UINT64_C(c) __UINT64_C(c)\000"
.LASF136:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF633:
	.ascii	"__SAPP 0x0100\000"
.LASF333:
	.ascii	"__ARMEL__ 1\000"
.LASF626:
	.ascii	"__SNBF 0x0002\000"
.LASF300:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF94:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF62:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF425:
	.ascii	"__ANDROID_API__ 19\000"
.LASF96:
	.ascii	"__INT8_C(c) c\000"
.LASF445:
	.ascii	"_T_SIZE \000"
.LASF675:
	.ascii	"signed char\000"
.LASF525:
	.ascii	"UINT32_MAX (4294967295U)\000"
.LASF424:
	.ascii	"ANDROID_API_LEVEL_H \000"
.LASF80:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF53:
	.ascii	"__INT_LEAST32_TYPE__ int\000"
.LASF527:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF611:
	.ascii	"__FD_ZERO\000"
.LASF264:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF405:
	.ascii	"__aligned(x) __attribute__((__aligned__(x)))\000"
.LASF496:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
.LASF618:
	.ascii	"_OFF_T_DEFINED_ \000"
.LASF471:
	.ascii	"_WCHAR_T_DEFINED_ \000"
.LASF68:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF652:
	.ascii	"SEEK_END 2\000"
.LASF347:
	.ascii	"__unix__ 1\000"
.LASF453:
	.ascii	"___int_size_t_h \000"
.LASF497:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF290:
	.ascii	"__SA_IBIT__ 16\000"
.LASF220:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF562:
	.ascii	"UINTMAX_MAX UINT64_MAX\000"
.LASF448:
	.ascii	"_BSD_SIZE_T_ \000"
.LASF125:
	.ascii	"__FLT_DIG__ 6\000"
.LASF147:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF576:
	.ascii	"_LINUX_POSIX_TYPES_H \000"
.LASF14:
	.ascii	"__pie__ 2\000"
.LASF291:
	.ascii	"__DA_FBIT__ 31\000"
.LASF373:
	.ascii	"__link_set_make_entry(set,sym) static void const * "
	.ascii	"const __link_set_ ##set ##_sym_ ##sym __section(\"l"
	.ascii	"ink_set_\" #set) __used = &sym\000"
.LASF326:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 4\000"
.LASF169:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF601:
	.ascii	"__FDELT(d) ((d) / __NFDBITS)\000"
.LASF485:
	.ascii	"__KERNEL_STRICT_NAMES 1\000"
.LASF236:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF451:
	.ascii	"_BSD_SIZE_T_DEFINED_ \000"
.LASF255:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF205:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF190:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF362:
	.ascii	"__warn_references(sym,msg) __asm__(\".section .gnu."
	.ascii	"warning.\" #sym \"\\n\\t.ascii \\\"\" msg \"\\\"\\n"
	.ascii	"\\t.text\");\000"
.LASF341:
	.ascii	"__ARM_EABI__ 1\000"
.LASF673:
	.ascii	"long long unsigned int\000"
.LASF392:
	.ascii	"__P(protos) protos\000"
.LASF181:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF502:
	.ascii	"UINT_LEAST8_C(c) UINT8_C(c)\000"
.LASF216:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF185:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF113:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF213:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF286:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF651:
	.ascii	"SEEK_CUR 1\000"
.LASF225:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF134:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF574:
	.ascii	"__BIT_TYPES_DEFINED__ \000"
.LASF402:
	.ascii	"__unused __attribute__((__unused__))\000"
.LASF370:
	.ascii	"__KERNEL_RCSID(_n,_s) __RCSID(_s)\000"
.LASF224:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF151:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF244:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF612:
	.ascii	"__FD_ZERO(fdsetp) (memset (fdsetp, 0, sizeof (*(fd_"
	.ascii	"set *)(fdsetp))))\000"
.LASF211:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF371:
	.ascii	"__KERNEL_SCCSID(_n,_s) \000"
.LASF566:
	.ascii	"SIG_ATOMIC_MAX INT32_MAX\000"
.LASF64:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF631:
	.ascii	"__SERR 0x0040\000"
.LASF524:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF389:
	.ascii	"__static_cast(x,y) (x)y\000"
.LASF401:
	.ascii	"__pure \000"
.LASF348:
	.ascii	"unix 1\000"
.LASF227:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF508:
	.ascii	"INT_FAST16_MIN INT32_MIN\000"
.LASF404:
	.ascii	"__packed __attribute__((__packed__))\000"
.LASF146:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF177:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF199:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF313:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
.LASF646:
	.ascii	"FILENAME_MAX 1024\000"
.LASF407:
	.ascii	"__statement(x) __extension__(x)\000"
.LASF246:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF111:
	.ascii	"__INT_FAST8_MAX__ 127\000"
.LASF238:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF162:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF232:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF28:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF322:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF189:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF298:
	.ascii	"__USA_IBIT__ 16\000"
.LASF218:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF534:
	.ascii	"INT64_MIN (__INT64_C(-9223372036854775807)-1)\000"
.LASF180:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF499:
	.ascii	"INT_LEAST8_C(c) INT8_C(c)\000"
.LASF434:
	.ascii	"__PTRDIFF_T \000"
.LASF459:
	.ascii	"_STDINT_H \000"
.LASF45:
	.ascii	"__INT32_TYPE__ int\000"
.LASF484:
	.ascii	"__KERNEL_STRICT_NAMES\000"
.LASF22:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF691:
	.ascii	"puts\000"
.LASF235:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF476:
	.ascii	"_GCC_WCHAR_T \000"
.LASF354:
	.ascii	"_SYS_CDEFS_ELF_H_ \000"
.LASF642:
	.ascii	"_IONBF 2\000"
.LASF375:
	.ascii	"__link_set_add_text(set,sym) __link_set_make_entry("
	.ascii	"set, sym)\000"
.LASF671:
	.ascii	"getchar_unlocked() getc_unlocked(stdin)\000"
.LASF569:
	.ascii	"WCHAR_MIN (-(WCHAR_MAX) - 1)\000"
.LASF579:
	.ascii	"__user \000"
.LASF463:
	.ascii	"__wchar_t__ \000"
.LASF415:
	.ascii	"__link_set_foreach(pvar,set) for (pvar = __link_set"
	.ascii	"_start(set); pvar < __link_set_end(set); pvar++)\000"
.LASF292:
	.ascii	"__DA_IBIT__ 32\000"
.LASF27:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF248:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF97:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF195:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF449:
	.ascii	"_SIZE_T_DEFINED_ \000"
.LASF387:
	.ascii	"__BEGIN_DECLS \000"
.LASF530:
	.ascii	"INT_FAST32_C(c) INT32_C(c)\000"
.LASF351:
	.ascii	"_STDIO_H_ \000"
.LASF480:
	.ascii	"NULL\000"
.LASF259:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF69:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF16:
	.ascii	"__OPTIMIZE__ 1\000"
.LASF289:
	.ascii	"__SA_FBIT__ 15\000"
.LASF436:
	.ascii	"_BSD_PTRDIFF_T_ \000"
.LASF668:
	.ascii	"fileno(p) __sfileno(p)\000"
.LASF381:
	.ascii	"__link_set_add_data2(set,sym,n) __link_set_make_ent"
	.ascii	"ry2(set, sym, n)\000"
.LASF368:
	.ascii	"__SCCSID2(_s) \000"
.LASF231:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF520:
	.ascii	"INT32_MAX (2147483647)\000"
.LASF60:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF491:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF48:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF654:
	.ascii	"stdout (&__sF[1])\000"
.LASF308:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
.LASF280:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF433:
	.ascii	"_T_PTRDIFF \000"
.LASF325:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF51:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF507:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF46:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF129:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF260:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF416:
	.ascii	"__link_set_entry(set,idx) (__link_set_begin(set)[id"
	.ascii	"x])\000"
.LASF481:
	.ascii	"NULL ((void *)0)\000"
.LASF89:
	.ascii	"__INT32_MAX__ 2147483647\000"
.LASF261:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF234:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF670:
	.ascii	"putchar(x) putc(x, stdout)\000"
.LASF531:
	.ascii	"UINT32_C(c) c ## U\000"
.LASF643:
	.ascii	"BUFSIZ 1024\000"
.LASF450:
	.ascii	"_SIZE_T_DEFINED \000"
.LASF214:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF124:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF364:
	.ascii	"__LIBC_HIDDEN__ __attribute__ ((visibility (\"hidde"
	.ascii	"n\")))\000"
.LASF397:
	.ascii	"__volatile volatile\000"
.LASF282:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF469:
	.ascii	"_WCHAR_T_ \000"
.LASF636:
	.ascii	"__SNPT 0x0800\000"
.LASF571:
	.ascii	"WINT_MAX INT32_MAX\000"
.LASF516:
	.ascii	"UINT16_C(c) c\000"
.LASF243:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF122:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF602:
	.ascii	"__FDMASK\000"
.LASF374:
	.ascii	"__link_set_make_entry2(set,sym,n) static void const"
	.ascii	" * const __link_set_ ##set ##_sym_ ##sym ##_ ##n __"
	.ascii	"section(\"link_set_\" #set) __used = &sym[n]\000"
.LASF606:
	.ascii	"__FD_SET(fd,fdsetp) (((fd_set *)(fdsetp))->fds_bits"
	.ascii	"[(fd) >> 5] |= (1<<((fd) & 31)))\000"
.LASF141:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF233:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF410:
	.ascii	"__insn_barrier() __asm __volatile(\"\":::\"memory\""
	.ascii	")\000"
.LASF338:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF575:
	.ascii	"_GCC_WRAP_STDINT_H \000"
.LASF197:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF541:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF83:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF444:
	.ascii	"_T_SIZE_ \000"
.LASF121:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF400:
	.ascii	"__dead \000"
.LASF399:
	.ascii	"__UNCONST(a) ((void *)(unsigned long)(const void *)"
	.ascii	"(a))\000"
.LASF672:
	.ascii	"putchar_unlocked(c) putc_unlocked(c, stdout)\000"
.LASF537:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF629:
	.ascii	"__SRW 0x0010\000"
.LASF237:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF311:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
.LASF343:
	.ascii	"__linux 1\000"
.LASF253:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF369:
	.ascii	"__COPYRIGHT(_s) static const char copyright[] __att"
	.ascii	"ribute__((__unused__,__section__(\".copyright\"))) "
	.ascii	"= _s\000"
.LASF217:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF488:
	.ascii	"__STDINT_MACROS \000"
.LASF688:
	.ascii	"hello.c\000"
.LASF584:
	.ascii	"__iomem \000"
.LASF667:
	.ascii	"clearerr(p) __sclearerr(p)\000"
.LASF388:
	.ascii	"__END_DECLS \000"
.LASF519:
	.ascii	"INT32_MIN (-2147483647-1)\000"
.LASF376:
	.ascii	"__link_set_add_rodata(set,sym) __link_set_make_entr"
	.ascii	"y(set, sym)\000"
.LASF686:
	.ascii	"__builtin_puts\000"
.LASF669:
	.ascii	"getchar() getc(stdin)\000"
.LASF123:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF170:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF207:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF52:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF109:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF438:
	.ascii	"_GCC_PTRDIFF_T \000"
.LASF380:
	.ascii	"__link_set_add_rodata2(set,sym,n) __link_set_make_e"
	.ascii	"ntry2(set, sym, n)\000"
.LASF479:
	.ascii	"__need_wchar_t\000"
.LASF589:
	.ascii	"__releases(x) \000"
.LASF493:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF139:
	.ascii	"__DBL_DIG__ 15\000"
.LASF578:
	.ascii	"__LINUX_COMPILER_H \000"
.LASF349:
	.ascii	"__ANDROID__ 1\000"
.LASF247:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF206:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
.LASF510:
	.ascii	"UINT16_MAX (65535)\000"
.LASF241:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF283:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF498:
	.ascii	"INT8_C(c) c\000"
.LASF228:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF332:
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
.LASF557:
	.ascii	"INTPTR_C(c) INT32_C(c)\000"
.LASF285:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF88:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF679:
	.ascii	"long long int\000"
.LASF684:
	.ascii	"add_long\000"
.LASF625:
	.ascii	"__SLBF 0x0001\000"
.LASF336:
	.ascii	"__ARM_FP 12\000"
.LASF600:
	.ascii	"__FDELT\000"
.LASF307:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
.LASF503:
	.ascii	"UINT_FAST8_C(c) UINT8_C(c)\000"
.LASF159:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF17:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF230:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF328:
	.ascii	"__arm__ 1\000"
.LASF570:
	.ascii	"WINT_MIN INT32_MIN\000"
.LASF152:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF396:
	.ascii	"__signed signed\000"
.LASF276:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF295:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF506:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF71:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF460:
	.ascii	"_STDDEF_H \000"
.LASF350:
	.ascii	"__ELF__ 1\000"
.LASF393:
	.ascii	"__CONCAT(x,y) x ## y\000"
.LASF528:
	.ascii	"INT32_C(c) c\000"
.LASF316:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF318:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF202:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF172:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF553:
	.ascii	"INTPTR_MAX INT32_MAX\000"
.LASF8:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF585:
	.ascii	"__chk_user_ptr(x) (void)0\000"
.LASF486:
	.ascii	"_ARM__TYPES_H_ \000"
.LASF390:
	.ascii	"___STRING(x) __STRING(x)\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF586:
	.ascii	"__chk_io_ptr(x) (void)0\000"
.LASF472:
	.ascii	"_WCHAR_T_DEFINED \000"
.LASF242:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF532:
	.ascii	"UINT_LEAST32_C(c) UINT32_C(c)\000"
.LASF361:
	.ascii	"__weak_extern(sym) __asm__(\".weak \" _C_LABEL_STRI"
	.ascii	"NG(#sym));\000"
.LASF115:
	.ascii	"__UINT_FAST8_MAX__ 255\000"
.LASF456:
	.ascii	"__size_t \000"
.LASF11:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF219:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF431:
	.ascii	"_PTRDIFF_T \000"
.LASF441:
	.ascii	"__SIZE_T__ \000"
.LASF656:
	.ascii	"__SYS_ERRLIST \000"
.LASF37:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF664:
	.ascii	"__sfileno(p) ((p)->_file)\000"
.LASF430:
	.ascii	"__need_ptrdiff_t \000"
.LASF212:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF36:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF108:
	.ascii	"__UINT32_C(c) c ## U\000"
.LASF610:
	.ascii	"__FD_ISSET(fd,fdsetp) ((((fd_set *)(fdsetp))->fds_b"
	.ascii	"its[(fd) >> 5] & (1<<((fd) & 31))) != 0)\000"
.LASF49:
	.ascii	"__UINT32_TYPE__ unsigned int\000"
.LASF542:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF23:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF4:
	.ascii	"__GNUC_PATCHLEVEL__ 0\000"
.LASF628:
	.ascii	"__SWR 0x0008\000"
.LASF577:
	.ascii	"_LINUX_STDDEF_H \000"
.LASF342:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF200:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF78:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF252:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF607:
	.ascii	"__FD_CLR\000"
.LASF204:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF650:
	.ascii	"SEEK_SET 0\000"
.LASF384:
	.ascii	"__link_set_start(set) (__start_link_set_ ##set)\000"
.LASF501:
	.ascii	"UINT8_C(c) c\000"
.LASF198:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF360:
	.ascii	"__weak_alias(alias,sym) __asm__(\".weak \" _C_LABEL"
	.ascii	"_STRING(#alias) \"\\n\" _C_LABEL_STRING(#alias) \" "
	.ascii	"= \" _C_LABEL_STRING(#sym));\000"
.LASF160:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF293:
	.ascii	"__TA_FBIT__ 63\000"
.LASF357:
	.ascii	"___RENAME(x) __asm__(___STRING(_C_LABEL(x)))\000"
.LASF164:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF66:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF564:
	.ascii	"UINTMAX_C(c) UINT64_C(c)\000"
.LASF634:
	.ascii	"__SSTR 0x0200\000"
.LASF154:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF406:
	.ascii	"__section(x) __attribute__((__section__(x)))\000"
.LASF222:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF320:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF330:
	.ascii	"__ARM_ARCH_ISA_ARM 1\000"
.LASF132:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF32:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF240:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF203:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF166:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF353:
	.ascii	"__GNUC_PREREQ__(x,y) ((__GNUC__ == (x) && __GNUC_MI"
	.ascii	"NOR__ >= (y)) || (__GNUC__ > (x)))\000"
.LASF174:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF86:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF221:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF621:
	.ascii	"__need___va_list\000"
.LASF583:
	.ascii	"__nocast \000"
.LASF157:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF187:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF106:
	.ascii	"__UINT16_C(c) c\000"
.LASF188:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF429:
	.ascii	"__need_size_t \000"
.LASF595:
	.ascii	"__NFDBITS (8 * sizeof(unsigned long))\000"
.LASF340:
	.ascii	"__ARM_PCS 1\000"
.LASF54:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF609:
	.ascii	"__FD_ISSET\000"
.LASF529:
	.ascii	"INT_LEAST32_C(c) INT32_C(c)\000"
.LASF432:
	.ascii	"_T_PTRDIFF_ \000"
.LASF457:
	.ascii	"__need_size_t\000"
.LASF591:
	.ascii	"__release(x) (void)0\000"
.LASF391:
	.ascii	"___CONCAT(x,y) __CONCAT(x,y)\000"
.LASF273:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF296:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF466:
	.ascii	"_T_WCHAR_ \000"
.LASF385:
	.ascii	"__link_set_end(set) (__stop_link_set_ ##set)\000"
.LASF256:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF91:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF250:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF504:
	.ascii	"INT16_MIN (-32768)\000"
.LASF573:
	.ascii	"_BITSIZE 32\000"
.LASF30:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF421:
	.ascii	"__ISO_C_VISIBLE 1999\000"
.LASF272:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF683:
	.ascii	"char\000"
.LASF536:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF130:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF468:
	.ascii	"__WCHAR_T \000"
.LASF394:
	.ascii	"__STRING(x) #x\000"
.LASF565:
	.ascii	"SIG_ATOMIC_MIN INT32_MIN\000"
.LASF489:
	.ascii	"INT8_MIN (-128)\000"
.LASF512:
	.ascii	"UINT_FAST16_MAX UINT32_MAX\000"
.LASF582:
	.ascii	"__force \000"
.LASF622:
	.ascii	"__GNUC_VA_LIST \000"
.LASF77:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF277:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF70:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF117:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF538:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF284:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF245:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF477:
	.ascii	"_WCHAR_T_DECLARED \000"
.LASF175:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF422:
	.ascii	"__XPG_VISIBLE 700\000"
.LASF279:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF119:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF649:
	.ascii	"TMP_MAX 308915776\000"
.LASF681:
	.ascii	"long int\000"
.LASF543:
	.ascii	"INT64_C(c) __INT64_C(c)\000"
.LASF297:
	.ascii	"__USA_FBIT__ 16\000"
.LASF455:
	.ascii	"_SIZET_ \000"
.LASF41:
	.ascii	"__CHAR32_TYPE__ unsigned int\000"
.LASF271:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF458:
	.ascii	"__need_NULL\000"
.LASF209:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF305:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF182:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF547:
	.ascii	"UINT_LEAST64_C(c) UINT64_C(c)\000"
.LASF409:
	.ascii	"__RENAME(x) ___RENAME(x)\000"
.LASF355:
	.ascii	"_C_LABEL(x) x\000"
.LASF412:
	.ascii	"__predict_false(exp) __builtin_expect((exp) != 0, 0"
	.ascii	")\000"
.LASF452:
	.ascii	"_SIZE_T_DECLARED \000"
.LASF386:
	.ascii	"__link_set_count(set) (__link_set_end(set) - __link"
	.ascii	"_set_start(set))\000"
.LASF63:
	.ascii	"__UINT_FAST8_TYPE__ unsigned char\000"
.LASF100:
	.ascii	"__INT32_C(c) c\000"
.LASF165:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF43:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF304:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF689:
	.ascii	"/home/zzy1/study/hello_arm\000"
.LASF624:
	.ascii	"_FSTDIO \000"
.LASF559:
	.ascii	"PTRDIFF_C(c) INT32_C(c)\000"
.LASF500:
	.ascii	"INT_FAST8_C(c) INT8_C(c)\000"
.LASF443:
	.ascii	"_SYS_SIZE_T_H \000"
.LASF327:
	.ascii	"__ARM_SIZEOF_WCHAR_T 32\000"
.LASF275:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF196:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF337:
	.ascii	"__ARM_NEON_FP 4\000"
.LASF263:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF90:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF192:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF102:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF269:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF116:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF603:
	.ascii	"__FDMASK(d) (1UL << ((d) % __NFDBITS))\000"
.LASF653:
	.ascii	"stdin (&__sF[0])\000"
.LASF339:
	.ascii	"__ARM_ARCH_5TE__ 1\000"
.LASF20:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF278:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF47:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF414:
	.ascii	"__mallocfunc __attribute__((malloc))\000"
.LASF492:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF413:
	.ascii	"__noreturn __attribute__((__noreturn__))\000"
.LASF632:
	.ascii	"__SMBF 0x0080\000"
.LASF133:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF105:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF155:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF33:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF648:
	.ascii	"L_tmpnam 1024\000"
.LASF335:
	.ascii	"__VFP_FP__ 1\000"
.LASF513:
	.ascii	"INT16_C(c) c\000"
.LASF215:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF521:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF287:
	.ascii	"__HA_FBIT__ 7\000"
.LASF495:
	.ascii	"UINT8_MAX (255)\000"
.LASF620:
	.ascii	"__need___va_list \000"
.LASF229:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF85:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF317:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
.LASF662:
	.ascii	"__sferror(p) (((p)->_flags & __SERR) != 0)\000"
.LASF110:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF598:
	.ascii	"__FDSET_LONGS\000"
.LASF647:
	.ascii	"P_tmpdir \"/tmp/\"\000"
.LASF251:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF554:
	.ascii	"UINTPTR_MAX UINT32_MAX\000"
.LASF191:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF682:
	.ascii	"sizetype\000"
.LASF281:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF288:
	.ascii	"__HA_IBIT__ 8\000"
.LASF680:
	.ascii	"long unsigned int\000"
.LASF120:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF310:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
.LASF346:
	.ascii	"__unix 1\000"
.LASF92:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF605:
	.ascii	"__FD_SET\000"
.LASF599:
	.ascii	"__FDSET_LONGS (__FD_SETSIZE/__NFDBITS)\000"
.LASF26:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF6:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF201:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF1:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF614:
	.ascii	"_LINUX_TYPES_H \000"
.LASF81:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF437:
	.ascii	"___int_ptrdiff_t_h \000"
.LASF467:
	.ascii	"_T_WCHAR \000"
.LASF319:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF334:
	.ascii	"__SOFTFP__ 1\000"
.LASF114:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF514:
	.ascii	"INT_LEAST16_C(c) INT16_C(c)\000"
.LASF568:
	.ascii	"WCHAR_MAX __WCHAR_MAX__\000"
.LASF596:
	.ascii	"__FD_SETSIZE\000"
.LASF558:
	.ascii	"UINTPTR_C(c) UINT32_C(c)\000"
.LASF658:
	.ascii	"L_cuserid 9\000"
.LASF315:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF556:
	.ascii	"PTRDIFF_MAX INT32_MAX\000"
.LASF128:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF515:
	.ascii	"INT_FAST16_C(c) INT32_C(c)\000"
.LASF5:
	.ascii	"__VERSION__ \"4.8\"\000"
.LASF676:
	.ascii	"unsigned char\000"
.LASF167:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF168:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF417:
	.ascii	"__FBSDID(s) struct __hack\000"
.LASF99:
	.ascii	"__INT_LEAST32_MAX__ 2147483647\000"
.LASF408:
	.ascii	"__func__ __PRETTY_FUNCTION__\000"
.LASF161:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF67:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF687:
	.ascii	"GNU C 4.8 -mbionic -march=armv5te -mfloat-abi=soft "
	.ascii	"-mfpu=vfp -mtls-dialect=gnu -g3 -O3 -fPIE\000"
.LASF483:
	.ascii	"_SYS__TYPES_H_ \000"
.LASF193:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF383:
	.ascii	"__link_set_decl(set,ptype) extern ptype * const __s"
	.ascii	"tart_link_set_ ##set[]; extern ptype * const __stop"
	.ascii	"_link_set_ ##set[]\000"
.LASF594:
	.ascii	"__NFDBITS\000"
.LASF65:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF627:
	.ascii	"__SRD 0x0004\000"
.LASF580:
	.ascii	"__kernel \000"
.LASF523:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF517:
	.ascii	"UINT_LEAST16_C(c) UINT16_C(c)\000"
.LASF274:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF13:
	.ascii	"__PIC__ 2\000"
.LASF470:
	.ascii	"_BSD_WCHAR_T_ \000"
.LASF118:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF34:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF358:
	.ascii	"__indr_reference(sym,alias) \000"
.LASF262:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF419:
	.ascii	"__XSI_VISIBLE 700\000"
.LASF561:
	.ascii	"INTMAX_MAX INT64_MAX\000"
.LASF142:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF461:
	.ascii	"_STDDEF_H_ \000"
.LASF509:
	.ascii	"INT_FAST16_MAX INT32_MAX\000"
.LASF73:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF312:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
.LASF545:
	.ascii	"INT_FAST64_C(c) INT64_C(c)\000"
.LASF604:
	.ascii	"__ARCH_ARM_POSIX_TYPES_H \000"
.LASF57:
	.ascii	"__UINT_LEAST32_TYPE__ unsigned int\000"
.LASF592:
	.ascii	"__cond_lock(x) (x)\000"
.LASF572:
	.ascii	"_SSIZE_T_DEFINED_ \000"
.LASF127:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF76:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF150:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF588:
	.ascii	"__acquires(x) \000"
.LASF107:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295U\000"
.LASF61:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF137:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF18:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF38:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF82:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF428:
	.ascii	"_SYS_TYPES_H_ \000"
.LASF597:
	.ascii	"__FD_SETSIZE 1024\000"
.LASF331:
	.ascii	"__APCS_32__ 1\000"
.LASF616:
	.ascii	"__bitwise \000"
.LASF494:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF482:
	.ascii	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEM"
	.ascii	"BER)\000"
.LASF239:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF148:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF50:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF590:
	.ascii	"__acquire(x) (void)0\000"
.LASF555:
	.ascii	"PTRDIFF_MIN INT32_MIN\000"
.LASF143:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF544:
	.ascii	"INT_LEAST64_C(c) INT64_C(c)\000"
.LASF363:
	.ascii	"__SECTIONSTRING(_sec,_str) __asm__(\".section \" #_"
	.ascii	"sec \"\\n\\t.asciz \\\"\" _str \"\\\"\\n\\t.previou"
	.ascii	"s\")\000"
.LASF655:
	.ascii	"stderr (&__sF[2])\000"
.LASF678:
	.ascii	"short unsigned int\000"
.LASF12:
	.ascii	"__pic__ 2\000"
.LASF294:
	.ascii	"__TA_IBIT__ 64\000"
.LASF267:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF551:
	.ascii	"__PRIPTR_RANK \"\"\000"
.LASF690:
	.ascii	"main\000"
.LASF645:
	.ascii	"FOPEN_MAX 20\000"
.LASF490:
	.ascii	"INT8_MAX (127)\000"
.LASF56:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF661:
	.ascii	"__sfeof(p) (((p)->_flags & __SEOF) != 0)\000"
.LASF156:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF126:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF581:
	.ascii	"__safe \000"
.LASF435:
	.ascii	"_PTRDIFF_T_ \000"
.LASF184:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF365:
	.ascii	"__IDSTRING(_n,_s) __SECTIONSTRING(.ident,_s)\000"
.LASF158:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF446:
	.ascii	"__SIZE_T \000"
.LASF442:
	.ascii	"_SIZE_T \000"
.LASF619:
	.ascii	"_SYS_SYSMACROS_H_ \000"
.LASF420:
	.ascii	"__BSD_VISIBLE 1\000"
.LASF511:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF149:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF663:
	.ascii	"__sclearerr(p) ((void)((p)->_flags &= ~(__SERR|__SE"
	.ascii	"OF)))\000"
.LASF344:
	.ascii	"__linux__ 1\000"
.LASF533:
	.ascii	"UINT_FAST32_C(c) UINT32_C(c)\000"
.LASF378:
	.ascii	"__link_set_add_bss(set,sym) __link_set_make_entry(s"
	.ascii	"et, sym)\000"
.LASF302:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF210:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF10:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF617:
	.ascii	"_ARCH_ARM_KERNEL_H \000"
.LASF299:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF359:
	.ascii	"__strong_alias(alias,sym) __asm__(\".global \" _C_L"
	.ascii	"ABEL_STRING(#alias) \"\\n\" _C_LABEL_STRING(#alias)"
	.ascii	" \" = \" _C_LABEL_STRING(#sym));\000"
.LASF535:
	.ascii	"INT64_MAX (__INT64_C(9223372036854775807))\000"
.LASF462:
	.ascii	"_ANSI_STDDEF_H \000"
.LASF257:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF176:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF72:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF42:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF379:
	.ascii	"__link_set_add_text2(set,sym,n) __link_set_make_ent"
	.ascii	"ry2(set, sym, n)\000"
.LASF324:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF226:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF163:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF552:
	.ascii	"INTPTR_MIN INT32_MIN\000"
.LASF440:
	.ascii	"__size_t__ \000"
.LASF266:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF173:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF135:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF464:
	.ascii	"__WCHAR_T__ \000"
.LASF549:
	.ascii	"__PRI64_RANK \"ll\"\000"
	.ident	"GCC: (GNU) 4.8"
	.section	.note.GNU-stack,"",%progbits
