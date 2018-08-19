#include <iostream>
#include "arm_neon.h"

using namespace std;

extern "C" void add3 (uint8x16_t *data);

class neon_test  {
	public:

		neon_test () {
			int i;
			for(i=0; i<16; i++) {
				uint8_data[i] = i; 
			}
		}

		void test_add3() {

			uint8x16_t data;

			data = vld1q_u8 (uint8_data); // load data

			print_uint8 (data, "data");

			add3(&data);

			print_uint8 (data, "data (new)");
		}

		void print_uint8 (uint8x16_t data, const char* name) {
			int i;
			static uint8_t p[16];

			vst1q_u8 (p, data);

			cout << name << std::endl;
			for (i = 0; i < 16; i++) {
				cout << int(p[i]) << " "; 
			}
			printf ("\n");
		}

	private:
		uint8_t uint8_data[16];
};



int main () {
	neon_test test;

	test.test_add3();

	return 0;
}
