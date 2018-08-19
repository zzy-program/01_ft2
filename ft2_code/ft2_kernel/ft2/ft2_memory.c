#include <linux/init.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>

#include "ft2_memory.h"

#define MEM_KBUF_MAX_LEN (256)

static char   mem_kbuf[MEM_KBUF_MAX_LEN] = {0};
static int    mem_kbuf_len = 0;

ssize_t ft2_memory_read_handle(char __user *buffer, size_t len) {

	ssize_t ret = 0;
	int read_len = 0;

	pr_info("ft2_memory: read\n");

        ret = copy_to_user(buffer, mem_kbuf, len);
        if (ret == 0){
                pr_info("ft2: sent to userspace, buf_len: %d\n", mem_kbuf_len);
                read_len = mem_kbuf_len;
                mem_kbuf_len = 0;
                return (read_len);
        }
        else {
                pr_info("ft2: failed to send to userspace, count=%d\n", (int)ret);
                return -EFAULT;
        }

	return ret;
}

ssize_t ft2_memory_write_handle(const char __user *buffer, size_t len) {

	int count = 0;

	pr_info("ft2_memory: write\n");

        count = copy_from_user(mem_kbuf, buffer, len);
	if(count == 0) {
        	mem_kbuf_len = strlen(mem_kbuf);
        	pr_info("ft2: received %d characters from the user\n", (int)len);
		return len;
	} else {
		pr_info("ft2: failed to receive from userspace\n");
		return -1;
	}
}
