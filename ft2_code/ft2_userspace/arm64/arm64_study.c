#include <stdio.h>
#include <stdlib.h>

struct s_t
{
	int a1;
	char a2;
	int a3;
	short a4;
	long long int a5;
	short a6;
	char a7;
};

void a(int a1, char a2, int a3, short a4, int number)
{
	struct s_t test;
	char a[5];
	short i, n, sum;
	test.a1 = a1;
	test.a2 = a2;
	test.a3 = a3;
	test.a4 = a4;
	a[number+10] = 'a';
	if(a3 == 3) {
		printf("a3==3\n");	
	}
	else {
		printf("a3!=3\n");
	}
	n = a4;
	sum = 0;
	for(i=0; i<a4; i++) {
		sum = sum + i;
	}
	printf("sum=%d\n", sum);
		
	printf("struct s_t size: %d\n", sizeof(struct s_t));
	printf("test.a2=%c\n", test.a2);
}

int main()
{
	a(1, 'a', 3, 4, 5);
}