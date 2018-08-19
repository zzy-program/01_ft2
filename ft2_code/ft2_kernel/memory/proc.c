#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>

static char ft2_buf[2048];

static int ft2_show(struct seq_file *m, void *v)
{
	seq_printf(m, "%s\n", ft2_buf);
	return 0;
}

static ssize_t ft2_write(struct file *filp, const char *buf, size_t count, loff_t *offp)
{
	int ret = -1;

	memset(ft2_buf, 0, 2048);

	// todo check copy_from_user return value
	ret = copy_from_user(ft2_buf, buf, count);

	return count;	
}

static int ft2_open(struct inode *inode, struct file *file)
{
	return single_open(file, ft2_show, NULL);
}

static const struct file_operations ft2_fops = {
	.owner      = THIS_MODULE,
	.open       = ft2_open,
	.read       = seq_read,
	.write      = ft2_write,
	.llseek     = seq_lseek,
	.release    = single_release,
};

char *get_buf(void)
{
	return ft2_buf;
}

int mem_proc_init(void)
{
	memcpy(ft2_buf, "test", 5);
	printk(KERN_INFO "ft2 procfs init, buffer = %s\n", ft2_buf);
	proc_create("ft2", 0, NULL, &ft2_fops);
	return 0;
}

void mem_proc_exit(void)
{
	remove_proc_entry("ft2", NULL);
	printk(KERN_INFO "remove ft2 procfs \n");
}
