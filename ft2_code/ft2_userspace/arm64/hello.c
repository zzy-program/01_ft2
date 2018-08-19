#include <stdio.h>

int add(int a, int b) {
	return a+b;
}

long add_long(long a, long b) {
	return a+b;
}

long long add64(long long a, long long b) {
	return a+b;
}

int f(int n) {
	int i, sum = 0;
	for(i=0; i<n; i++) {
		sum = sum + i;
	}
	return sum;
}

static a=5;

int main() {
	char *a = "123";
	a[0] = '2';
	printf(a);
	add(3, 4);
	add_long(3, 4);
	add64(3, 4);
	f(100);
	a=6;
	printf("hello arm64, &a=0x%x\n", &a);
}
