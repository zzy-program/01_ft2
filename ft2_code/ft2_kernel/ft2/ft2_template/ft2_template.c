#include <linux/init.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/device.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/slab.h>

#include "ft2_template.h"
#include "../ft2_lib/ft2_lib.h"

int __init ft2_template_init(void) {

	int ret = 0;

	pr_info("ft2: ft2_template_init\n");

	return ret;
}

void __exit ft2_template_exit(void) {

	pr_info("ft2: ft2_template_exit\n");
}
