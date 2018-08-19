TOOLCHAIN=/media/disk2/bin/android-21-arm64
SYSROOT=${TOOLCHAIN}/sysroot

CC=${TOOLCHAIN}/bin/aarch64-linux-android-gcc
CPP=${TOOLCHAIN}/bin/aarch64-linux-android-g++
AS=${TOOLCHAIN}/bin/aarch64-linux-android-as
STRIP=${TOOLCHAIN}/bin/aarch64-linux-android-strip
CFLAGS=-O0 -fPIE -pie -g -fstack-protector-all --sysroot=${SYSROOT}

all: sched_set
sched_set: sched_set.c
	${CC} ${CFLAGS} -o sched_set sched_set.c

run:
	adb push sched_set /data/data
	adb shell /data/data/sched_set
