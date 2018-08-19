#include <linux/init.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/sched.h>
#include <linux/mm_types.h>
#include <linux/mm.h>

MODULE_LICENSE("GPL");

extern char *get_buf(void);
extern int mem_proc_init(void);
extern int mem_proc_exit(void);
extern struct page *follow_page_mask(struct vm_area_struct *vma,
                              unsigned long address, unsigned int foll_flags,
                              unsigned int *page_mask);

static long ft2_get_pid(char *buf) {
	char *tmp = NULL;
	long pid = -1;

	if (NULL == buf) {
		printk(KERN_ALERT "buf==NULL\n");
		goto get_pid_fail;
	}

	tmp = strstr(buf, "pid");
	if(NULL == tmp) {
		printk(KERN_ALERT "tmp==NULL, buf=%s\n", buf);
		goto get_pid_fail;
	}

	tmp += 4;
	while(*tmp == ' ') {
		tmp++;
	}

	buf = tmp;
	tmp = strchr(buf, ' ');
	if(tmp) {
		*tmp = '\0';
	}

	if(kstrtol(buf, 10, &pid) == 0) {
		*tmp = ' ';
		return pid;
	}

	printk(KERN_ALERT "kstrtol fail, tmp: %s\n", tmp);

get_pid_fail:
	printk(KERN_ALERT "get pid fail\n");
	return -1;
}

static unsigned long long ft2_get_malloc_addr(char *buf) {
	char *tmp = NULL;
	unsigned long long addr;

	if(NULL == buf) {
		printk(KERN_ALERT "buf==NULL\n");
		goto get_malloc_addr_fail;
	}

	tmp = strstr(buf, "malloc_addr:");
	if(NULL == tmp) {
		printk(KERN_ALERT "tmp==NULL, buf=%s\n", buf);
		goto get_malloc_addr_fail;
	}

	tmp += strlen("malloc_addr:");
	while(*tmp == ' ') {
		tmp++;
	}

	buf = tmp;
	tmp = strchr(buf, ' ');
	if(tmp) {
		*tmp = '\0';
	}
	else {
		tmp = strchr(buf, '\n');
		if(tmp) {
			*tmp = '\0';
		}
	}

	sscanf(buf, "%llx", &addr);
	return addr;

get_malloc_addr_fail:
	printk(KERN_ALERT "get_malloc_addr_fail\n");
	return 0;
}

void memory_handle(char *buf) {
	long pid = ft2_get_pid(buf);
	unsigned long long addr = ft2_get_malloc_addr(buf);

	struct task_struct *p = NULL;
	struct mm_struct *mm = NULL;
	struct vm_area_struct *mmap = NULL;
	struct page *page = NULL;

	if(pid < 0 || addr == 0) {
		goto memory_handle_fail;
	}

	// get pid & addr successful
	printk(KERN_ALERT "pid=%ld, addr=%p\n", pid, (void *)addr);

	// p = find_task_by_vpid(pid);
	p = pid_task(find_vpid(pid), PIDTYPE_PID);
	mm = p->mm;

	if(NULL == p) {
		printk(KERN_ALERT "task struct not found\n");
		goto memory_handle_fail;
	}

	if(NULL == mm) {
		printk(KERN_ALERT "mm_struct not found\n");
		goto memory_handle_fail;
	}

	printk(KERN_ALERT "process name: %s\n", p->comm);

	printk(KERN_ALERT "mm->mmap_base=%p, mm->map_count=%d\n", (void *)mm->mmap_base, mm->map_count);
	printk(KERN_ALERT "mm->start_code=%p, mm->end_code=%p, mm->start_data=%p, mm->end_data=%p\n", 
		(void *)mm->start_code, (void *)mm->end_code, (void *)mm->start_data, (void *)mm->end_data);
	printk(KERN_ALERT "mm->start_brk=%p, mm->brk=%p, mm->start_stack=%p", (void *)mm->start_brk, (void *)mm->brk, (void *)mm->start_stack);
	printk(KERN_ALERT "mm->arg_start=%p, mm->arg_end=%p, mm->env_start=%p, mm->env_end=%p\n", (void *)mm->arg_start, (void *)mm->arg_end,
		(void *)mm->env_start, (void *)mm->env_end);

	mmap = mm->mmap;
	while(mmap) {
		static int i = 0;

		printk(KERN_ALERT "%d: mmap->vm_start=%p, mmap->vm_end=%p\n", i, (void *)mmap->vm_start, (void *)mmap->vm_end);
		mmap = mmap->vm_next;
		i++;
	}

#if 1
	mmap = find_vma(mm, mm->start_code);
	page = follow_page(mmap, mm->start_code, FOLL_GET);
	printk(KERN_ALERT "mm->start_code, page=%p\n", page);
	put_page(page);

	mmap = find_vma(mm, addr);
	page = follow_page(mmap, addr, FOLL_GET);
	printk(KERN_ALERT "addr, page=%p\n", page);
	put_page(page);
#endif

	return;

memory_handle_fail:
	printk(KERN_ALERT "memory handle fail\n");
}

static int memory_init(void)
{
	printk(KERN_ALERT "memory study init\n");
	mem_proc_init();

	while(1) {
		char *buf = NULL;

		buf = get_buf();

		msleep(200);

		if(!memcmp(buf, "quit", 4)) {
			break;
		}

		if(memcmp(buf, "idle", 4)) {
			printk(KERN_ALERT "buffer: %s\n", buf);
			memory_handle(buf);
			strcpy(buf, "idle");
		}
	}

	printk(KERN_ALERT "buffer: %s\n", get_buf());

	return 0;
}

static void memory_exit(void)
{
	printk(KERN_ALERT "memory study remove\n");
	mem_proc_exit();
}

module_init(memory_init);
module_exit(memory_exit);
