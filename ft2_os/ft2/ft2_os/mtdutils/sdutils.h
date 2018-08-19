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

#ifndef SDUTILS_H
#define SDUTILS_H

#include <sys/types.h>
#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

//=====================================
// SD card common function
//=====================================
int sd_mount_partition(const char *devpath1,const char *devpath2,const char *mount_point,const char *filesystem);
int sd_umount_partition(const char *devpath,const char *mount_point);
int sd_format_partition(const char *devpath,const char *mount_point,const char *filesystem);
void get_persist_property();

#ifdef __cplusplus
}
#endif

#endif

