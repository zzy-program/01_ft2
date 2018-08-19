#include <stdio.h>

void a(int n)
{
	char a[4];
	int i = 0;
	
	printf("coredump test begin\n");
	for(i=0; i<n; i++)
	{
		a[i] = 0;	
	}
}

int main() {
	a(5);
	printf("coredump test end\n");
}
