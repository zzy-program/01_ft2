/*  ft2.c
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>

#include "ft2_template/ft2_template.h"
#include "ft2_test.h"
#include "ft2_memory.h"

#define  DEVICE_NAME "ft2"    // creat /dev/ft2
#define  CLASS_NAME  "ft2_class"

#define KBUF_MAX_LEN  256

static dev_t    ft2_dev_number; // ft2 device major number
static struct class*  ft2_class  = NULL;

static int    open_num = 0;

//  file operations
static int     dev_open(struct inode *, struct file *);
static int     dev_release(struct inode *, struct file *);
static ssize_t dev_read(struct file *, char *, size_t, loff_t *);
static ssize_t dev_write(struct file *, const char *, size_t, loff_t *);

static struct file_operations fops = {

	.open = dev_open,
	.read = dev_read,
	.write = dev_write,
	.release = dev_release,
};

struct ft2_dev_t {

	int ft2_seq;
	struct cdev cdev;
	char *name;
};

static struct ft2_dev_t ft2_dev[] = {

	{.name = "ft2_template"},
	{.name = "ft2_test"},
	{.name = "ft2_memory"},
};

extern int   __init ft2_test_init(void);
extern void  __exit ft2_test_exit(void);

static int __init ft2_init(void) {

	int i, ret = 0;
	struct device *device_tmp = NULL;

	pr_info("ft2: ft2 init\n");

	// register character deivce
	if(alloc_chrdev_region(&ft2_dev_number, 0, sizeof(ft2_dev)/sizeof(*ft2_dev), DEVICE_NAME) < 0) {
		pr_err("ft2 failed to register ft2_dev_number number\n");
		return -1;
	}

	pr_info("ft2: ft2 device major number: %d\n", MAJOR(ft2_dev_number));

	// register the device class
	ft2_class = class_create(THIS_MODULE, CLASS_NAME);
	if (IS_ERR(ft2_class)){
		unregister_chrdev(ft2_dev_number, DEVICE_NAME);
		pr_err("Failed to register device class\n");
		return PTR_ERR(ft2_class);
	}
	pr_info("ft2: device class registered\n");

	// device driver register
	for(i=0; i< sizeof(ft2_dev)/sizeof(*ft2_dev); i++) {

		ft2_dev[i].ft2_seq = i;

		cdev_init(&ft2_dev[i].cdev, &fops);
		ft2_dev[i].cdev.owner = THIS_MODULE;

		ret = cdev_add(&ft2_dev[i].cdev, MKDEV(MAJOR(ft2_dev_number), i), 1);
		if(ret) {
			pr_info("ft2: bad cdev: %s\n", ft2_dev[i].name);
			return ret;
		}

		device_tmp = device_create(ft2_class, NULL, MKDEV(MAJOR(ft2_dev_number), i), NULL, "%s", ft2_dev[i].name);
		if (IS_ERR(device_tmp)){
			class_destroy(ft2_class);
			pr_err("Failed to create the device\n");
			return PTR_ERR(device_tmp);
		}

		// handle special init task
		if(strncmp(ft2_dev[i].name, "ft2_template", strlen("ft2_template"))) {
			ft2_template_init();
		} else if(strncmp(ft2_dev[i].name, "ft2_test", strlen("ft2_test"))) {
			ft2_test_init();
		}
	}

	pr_info("ft2: device class created\n");
	return 0;
}

static void __exit ft2_exit(void) {

	int i;

	device_destroy(ft2_class, ft2_dev_number);
	class_unregister(ft2_class);
	class_destroy(ft2_class);
	unregister_chrdev(ft2_dev_number, DEVICE_NAME);

	// handle special exit task
	for(i=0; i< sizeof(ft2_dev)/sizeof(*ft2_dev); i++) {
		if(strncmp(ft2_dev[i].name, "ft2_template", strlen("ft2_template"))) {
			ft2_template_exit();
		} else if(strncmp(ft2_dev[i].name, "ft2_test", strlen("ft2_test"))) {
			ft2_test_exit();
		}
	}

	pr_info("ft2: exit\n");
}

static int dev_open(struct inode *inode, struct file *file) {

	struct ft2_dev_t *ft2_dev;

	open_num++;

	ft2_dev = container_of(inode->i_cdev, struct ft2_dev_t, cdev);
	file->private_data = ft2_dev;

	pr_info("ft2: device open, times=%d\n", open_num);

	return 0;
}

static ssize_t dev_read(struct file *file, char __user *buffer, size_t len, loff_t *offset) {

	int ret = 0;
	struct ft2_dev_t *ft2_dev;

	ft2_dev = file->private_data;
	if(ft2_dev) {
		pr_info("ft2: ft2_dev->name: %s\n", ft2_dev->name);
	} else {
		pr_info("ft2: file->private_data get error\n");
		return -1;
	}

	if(!strncmp(ft2_dev->name, "ft2_test", strlen("ft2_test"))) {
		ret = ft2_test_read_handle(buffer, len);
		return ret;
	} else if(!strncmp(ft2_dev->name, "ft2_memory", strlen("ft2_memory"))) {
		ret = ft2_memory_read_handle(buffer, len);
		return ret;
	} else {
		pr_info("ft2: read error\n");
		return -1;
	}
}

static ssize_t dev_write(struct file *file, const char __user *buffer, size_t len, loff_t *offset) {

	int ret;
	struct ft2_dev_t *ft2_dev;

	ft2_dev = file->private_data;
	if(ft2_dev) {
		pr_info("ft2: ft2_dev->name: %s\n", ft2_dev->name);
	} else {
		pr_info("ft2: file->private_data get error\n");
		return -1;
	}

        if(!strncmp(ft2_dev->name, "ft2_test", strlen("ft2_test"))) {
                ret = ft2_test_write_handle(buffer, len);
                return ret;
        } else if(!strncmp(ft2_dev->name, "ft2_memory", strlen("ft2_memory"))) {
                ret = ft2_memory_write_handle(buffer, len);
                return ret;
        } else {
                pr_info("ft2: read error\n");
                return -1;
        }
}

static int dev_release(struct inode *inode, struct file *file) {

	pr_info("ft2: device closed\n");
	return 0;
}

module_init(ft2_init);
module_exit(ft2_exit);

// module information
MODULE_LICENSE("GPL");
MODULE_AUTHOR("ft2");
MODULE_DESCRIPTION("ft2 kernel program");
MODULE_VERSION("0.1");
