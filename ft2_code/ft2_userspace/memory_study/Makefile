CC=aarch64-linux-gnu-gcc
CPP=aarch64-linux-gnu-g++
AS=aarch64-linux-gnu-as
STRIP=aarch64-linux-gnu-strip
CFLAGS=-O0 -g -static

all: mem_main
mem_main: mem_main.c
	${CC} ${CFLAGS} -o mem_main mem_main.c

install:
	mkdir -p ../../out_ft2
	cp mem_main ../../out_ft2

run_android:
	adb push mem_main /data/data
	adb shell /data/data/mem_main

.PHONY: clean
clean:
	rm -f *.o mem_main
