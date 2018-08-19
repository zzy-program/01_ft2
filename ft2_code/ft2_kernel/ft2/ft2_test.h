#ifndef __FT2_TEST_H__
#define __FT2_TEST_H__

#include <linux/init.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>

ssize_t ft2_test_read_handle(char __user *buffer, size_t len);
ssize_t ft2_test_write_handle(const char __user *buffer, size_t len);

#endif 
