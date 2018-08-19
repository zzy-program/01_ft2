#ifndef __FT2_TEMPLATE_H__
#define __FT2_TEMPLATE_H__

#include <linux/init.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>

int   __init ft2_template_init(void);
void  __exit ft2_template_exit(void);

#endif 
