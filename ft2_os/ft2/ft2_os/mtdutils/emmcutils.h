/*
 * HTC Corporation Proprietary Rights Acknowledgment
 *
 * Copyright (C) 2010 HTC Corporation
 *
 * All Rights Reserved.
 *
 * The information contained in this work is the exclusive property of HTC Corporation
 * ("HTC").  Only the user who is legally authorized by HTC ("Authorized User") has
 * right to employ this work within the scope of this statement.  Nevertheless, the
 * Authorized User shall not use this work for any purpose other than the purpose
 * agreed by HTC.  Any and all addition or modification to this work shall be
 * unconditionally granted back to HTC and such addition or modification shall be
 * solely owned by HTC.  No right is granted under this statement, including but not
 * limited to, distribution, reproduction, and transmission, except as otherwise
 * provided in this statement.  Any other usage of this work shall be subject to the
 * further written consent of HTC.
 */

#ifndef EMMCUTILS_H
#define EMMCUTILS_H

#include <sys/types.h>
#include <unistd.h>

#ifdef HAVE_SELINUX
#include <selinux/selinux.h>
#include <selinux/label.h>
#else
struct selabel_handle;
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define LOGE(...) fprintf(stdout, "E:" __VA_ARGS__)
#define LOGI(...) fprintf(stdout, "I:" __VA_ARGS__)

#define EMMC_PARTITION_MISC_NAME "misc"

#define EMMC_DEFAULT_PAGE_SIZE 4096
#define EMMC_MISC_PAGES 7

#define EMMC_MISC_PAGE0_PAGE 0
#define EMMC_MISC_COMMAND_PAGE 1

#define EMMC_PARTITION_EXTRA_NAME "extra"
#define ENC_KEY_OFFSET_EXT 34
#define ENC_KEY_OFFSET_FAT 33

#define DEVPATHLENGTH 1024
#define DM_TYPE_EXT  2

typedef struct {
    char *dev;
    unsigned int size;
    unsigned int erasesize;
    char *name;
}eMMCPartition;

typedef struct {
    eMMCPartition *partitions;
    int partitions_allocd;
    int partition_count;
} eMMCState;

//=====================================
// Help functions for emmc
//=====================================
void emmc_set_page_size(int page_size);
int emmc_get_page_size();

int emmc_scan_partitions(void);
const eMMCPartition* emmc_find_partition_by_name(const char *name);
const eMMCPartition* emmc_find_partition_by_dev(const char *dev);
int emmc_mount_partition(const eMMCPartition *partition,const char *mount_point,const char *filesystem);
int emmc_umount_partition(const char *devpath,const char *mount_point);

int emmc_format_partition(const eMMCPartition *partition,const char* mount_point,const char *filesystem,int length,struct selabel_handle *sehandle);

int emmc_read(const eMMCPartition *ep,loff_t offset,long length,void *pdata);
int emmc_write(const eMMCPartition *ep,loff_t offset,long length,void *pdata);

int emmc_erase_partition(const eMMCPartition *partition);

int emmc_get_bootloader_message(void *data,int size);
int emmc_set_bootloader_message(void *data,int size);

int emmc_get_misc_page0(void *data,int size);
int emmc_set_misc_page0(void *data,int size);

int emmc_get_tz_encrypted_key(unsigned char *data,int size,int page_num,int offset);

#ifdef __cplusplus
}
#endif

#endif

