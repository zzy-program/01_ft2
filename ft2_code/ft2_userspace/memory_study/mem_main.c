#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

static char line[4096];

int main() {
	printf("memory study main...\n");
	printf("sizeof(unsigned long)=%ld\n", sizeof(unsigned long));

	char *malloc_ptr = malloc(1024*1024);
	FILE *fh = NULL;

	fh = fopen("/proc/ft2", "w");

	sprintf(line, "pid: %d malloc_addr: %p\n", getpid(), malloc_ptr);

	fputs(line, fh);
	fclose(fh);

	printf("line: %s\n", line);
	
	printf("a=%p\n", malloc_ptr);
	
	while(1) {
		sleep(2);
	}

	free(malloc_ptr);
	fclose(fh);
	return 0;
}
