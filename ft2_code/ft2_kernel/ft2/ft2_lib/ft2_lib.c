#include "ft2_lib.h"

#define FT2_LIB_TEST  "ft2 lib test" // check ft2 lib

// this buffer used for test
#define FT2_TEST_MEM_LEN  (100*1024)
char ft2_kbuf[FT2_TEST_MEM_LEN];

// check for ft2 lib
char *ft2_lib_get_test(void) {
	return FT2_LIB_TEST;
}

// get test buffer
char *ft2_lib_get_test_mem(void) {
	return ft2_kbuf;
}

// get test buffer len
int ft2_lib_get_test_mem_len(void) {
	return FT2_TEST_MEM_LEN;
}
