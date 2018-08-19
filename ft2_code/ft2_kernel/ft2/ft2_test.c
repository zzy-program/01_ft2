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

#include "ft2_test.h"
#include "ft2_lib/ft2_lib.h"

// for ft2 read/write test
static int test_kbuf_len = 0;

// for ft2 kobject/kset test
static struct kobject *ft2_parent;
static struct kobject *ft2_child;
static struct kset    *ft2_kset;

// used for store attribute
static char event = '0';

// child attribute show/store
static ssize_t ft2_child_attr_show(struct kobject *kobj, struct attribute *attr, char *buf) {

	ssize_t count = 0;

	event = event - '0';
	count = sprintf(buf, "%d", event);
	return count;
}

static ssize_t ft2_child_attr_store(struct kobject *kobj, struct attribute *attr, 
	const char *buf, size_t count) {

	event = buf[0];
	return count;
}

// parent kobj attribute show/store
static ssize_t ft2_parent_kobj_attr_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) {

	ssize_t count = 0;

	event = event - '0';
	count = sprintf(buf, "%d", event);
	return count;
}

static ssize_t ft2_parent_kobj_attr_store(struct kobject *kobj, struct kobj_attribute *attr, 
	const char *buf, size_t count) {

	event = buf[0];
	return count;
}

static struct kobj_attribute ft2_parent_kobj_attr = {

	.attr.name = "ft2_parent_attr",
	.attr.mode = S_IRUGO | S_IWUSR,
	.show = ft2_parent_kobj_attr_show,
	.store = ft2_parent_kobj_attr_store,
};

static struct attribute ft2_child_attr = {

	.name = "ft2_child_attr",
	.mode = S_IRUGO | S_IWUSR,
};

static const struct sysfs_ops attr_ops = {

	.show = ft2_child_attr_show,
	.store = ft2_child_attr_store,
};

static struct kobj_type ft2_child_ktype = {

	.sysfs_ops = &attr_ops,
};

int __init ft2_test_init(void) {

	int ret = 0;

	pr_info("ft2: ft2_test_init\n");

	ft2_parent = kobject_create_and_add("ft2_parent_obj", NULL);
	ft2_child = kzalloc(sizeof(*ft2_child), GFP_KERNEL);
	if(!ft2_child) {
		return PTR_ERR(ft2_child);
	}

	ft2_kset = kset_create_and_add("ft2_kset", NULL, ft2_parent);
	if(!ft2_kset) {
		return -1;
	}
	ft2_child->kset = ft2_kset;

	ret = kobject_init_and_add(ft2_child, &ft2_child_ktype, ft2_parent, "ft2_child_obj");
	if(ret) {
		return ret;
	}

	ret = sysfs_create_file(ft2_parent, &ft2_parent_kobj_attr.attr);
	ret = sysfs_create_file(ft2_child, &ft2_child_attr);

	return ret;
}

void __exit ft2_test_exit(void) {

	pr_info("ft2: ft2_test_exit\n");

	sysfs_remove_file(ft2_child, &ft2_child_attr);
	kset_unregister(ft2_kset);
	kobject_del(ft2_child);
	kobject_del(ft2_parent);
}

// ft2 test read/write operations
ssize_t ft2_test_read_handle(char __user *buffer, size_t len) {

	ssize_t ret = 0;
	int read_len = 0;

	char *test_kbuf = ft2_lib_get_test_mem();

	pr_info("ft2_test: read\n");

        ret = copy_to_user(buffer, test_kbuf, len);

        if (ret == 0){

                pr_info("ft2: sent to userspace, buf_len: %d\n", test_kbuf_len);
                read_len = test_kbuf_len;

		// clear the test buffer
                test_kbuf_len = 0;
		memset(test_kbuf, 0, ft2_lib_get_test_mem_len());

                return (read_len);
        }
        else {
                pr_info("ft2: failed to send to userspace");
                return -EFAULT;
        }

	return ret;
}

ssize_t ft2_test_write_handle(const char __user *buffer, size_t len) {

	int count;

	char *test_kbuf = ft2_lib_get_test_mem();

	pr_info("ft2_test: write\n");

        count = copy_from_user(test_kbuf, buffer, len);
	if(count == 0) {
        	test_kbuf_len = strlen(test_kbuf);
        	pr_info("ft2: received %d characters from the user\n", (int)len);
		return len;
	} else {
		pr_info("ft2: failed to received from userspace\n");
		return -1;
	}
}
