TOOLCHAIN=/home/zzy/bin/android-21-arm64
SYSROOT=${TOOLCHAIN}/sysroot

CC=${TOOLCHAIN}/bin/aarch64-linux-android-gcc
CPP=${TOOLCHAIN}/bin/aarch64-linux-android-g++
AS=${TOOLCHAIN}/bin/aarch64-linux-android-as
STRIP=${TOOLCHAIN}/bin/aarch64-linux-android-strip
CFLAGS=-O3 -fPIE -pie -g3 --sysroot=${SYSROOT}

all: neon_test total

neon_test: neon.s hello_neon.cpp
	${CPP} ${CFLAGS} -o neon_test neon.s hello_neon.cpp

total: 
	${CC} ${CFLAGS} -o total total.c

clean:
	rm neon_test total

run_neon_test:
	adb push neon_test /data/data
	adb shell /data/data/neon_test

run_total:
	adb push total /data/data
	adb shell /data/data/total
