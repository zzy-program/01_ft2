static a[100] = {1, 2, 3};

#include <stdio.h>
int main()
{
	int b[50] = {1, 2};
	int i;

	a[0] = 5;
	for(i=0; i<50; i++)
	{
		b[0] = b[0] + b[i];
	}

	printf("%d, %d\n", a[0], b[0]);
	return 0;
}
