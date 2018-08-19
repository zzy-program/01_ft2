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

#ifndef ENCDEVICE_H
#define ENCDEVICE_H

#include <sys/types.h>
#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

//=====================================
// TZ Decryption
//=====================================
#define HTC_IOCTL_SDSERVICE 0x9527

enum {
    HTC_SD_KEY_ENCRYPT = 0x33,
    HTC_SD_KEY_DECRYPT,
};

typedef struct _htc_sdservice_msg_s {
    int func;
    int offset;
    unsigned char *req_buf;
    int req_len;
    unsigned char *resp_buf;
    int resp_len;
} htc_sdservice_msg_s;

int tz_decrypt_key(unsigned char *input_buf, unsigned char *output_buf,int keylen);

//=====================================
// utility for dm-crypt
//=====================================
void convert_key_to_hex_ascii(unsigned char *master_key, unsigned int keysize, char *master_key_ascii);

//=====================================
// dm-crypt
//=====================================
#define DEVPATHLENGTH 1024
#define DM_CRYPT_BUF_SIZE 4096

#define DM_TYPE_VFAT 1
#define DM_TYPE_EXT  2

void ioctl_init(struct dm_ioctl *io, size_t dataSize, const char *name, unsigned flags);
int dm_dev_exists(const char* name,char* dm_dev_path);
int dm_dev_find_name_by_id(unsigned int id,char* name);
int dm_dev_create(const char* name,int type,const char* param,const char* dev_path,char* dm_dev_path);
int dm_dev_destroy(const char* name);

//=====================================
// Help functions for ext encryption
//=====================================
#define __le32 unsigned int
#define __le16 unsigned short int
#define MAX_CRYPTO_TYPE_NAME_LEN 64

struct crypt_mnt_ftr {
  __le32 magic;		/* See above */
  __le16 major_version;
  __le16 minor_version;
  __le32 ftr_size; 	/* in bytes, not including key following */
  __le32 flags;		/* See above */
  __le32 keysize;	/* in bytes */
  __le32 spare1;	/* ignored */
  __le64 fs_size;	/* Size of the encrypted fs, in 512 byte sectors */
  __le32 failed_decrypt_count; /* count of # of failed attempts to decrypt and
				  mount, set to 0 on successful mount */
  unsigned char crypto_type_name[MAX_CRYPTO_TYPE_NAME_LEN]; /* The type of encryption
							       needed to decrypt this
							       partition, null terminated */
};

int ext_check_encrypt(const char* devpath);
int ext_check_encrypt_keysize(void);

//=====================================
// Help functions for vfat encryption
//=====================================
#define SDENC_SB_MAGIC 0xc0defeed
#define SDENC_SB_VER1 1
#define SDENC_SB_VER2 2
#define MD5_DIGEST_LENGTH 16

struct sdenc_superblock {
    unsigned int magic;
    unsigned char ver;
    unsigned char c_cipher;
    unsigned char c_chain;
    unsigned char c_opts;
    unsigned char c_mode;
    unsigned int key_hash;
}__attribute__((packed));

int vfat_check_encrypt(const char* devpath,unsigned int* keyhash);
int vfat_check_key(unsigned int keyhash,unsigned char* key, int keylen);

#ifdef __cplusplus
}
#endif

#endif

