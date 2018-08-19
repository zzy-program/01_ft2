#include <stdint.h>
#include <stdio.h>
#include <assert.h>
#include <arm_neon.h>

void init(int32_t *a, int size)
{    
	int i;
	for (i = 0; i < size; i++)
	{
		a[i] = i;
	}
}

int total(int32_t *a, int size)
{
	int32x2_t acc;
	int32x2_t tmp;
	int sum;

	assert((size % 2) == 0);

	acc = vld1_s32(a);
	a += 2;
	size -= 2;

	for (; size != 0; size -= 2)
	{

		tmp = vld1_s32(a);
		acc = vadd_s32(acc, tmp);
		a += 2;
	}
	/* calculate the total */
	acc = vpadd_s32(acc, acc);

	return vget_lane_s32(acc, 0);
}

int main()
{
	int32_t test[100];

	init(test, 100);
	int sum = total(test, 100);
	printf("sum=%d\n", sum);

	return 0;
}
