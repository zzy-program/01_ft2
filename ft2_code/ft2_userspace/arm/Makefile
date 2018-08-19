TOOLCHAIN=/media/disk2/bin/arm_gcc/android-19-arm
SYSROOT=${TOOLCHAIN}/sysroot

CC=${TOOLCHAIN}/bin/arm-linux-androideabi-gcc
CPP=${TOOLCHAIN}/bin/arm-linux-androideabi-g++
AS=${TOOLCHAIN}/bin/arm-linux-androideabi-as
STRIP=${TOOLCHAIN}/bin/arm-linux-androideabi-strip
CFLAGS=-O0 -fPIE -pie -g -fstack-protector-all --sysroot=${SYSROOT}

all: coredump_test
hello: coredump_test.c
	${CC} ${CFLAGS} -o coredump_test coredump_test.c
run:
	adb push coredump_test /data/data
	adb shell /data/data/coredump_test
