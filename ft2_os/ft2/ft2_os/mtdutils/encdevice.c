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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mount.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/wait.h>
#include <sys/ioctl.h>
#include <linux/dm-ioctl.h>
#include <openssl/md5.h>
#include <cutils/properties.h>

#include "encdevice.h"
#include "emmcutils.h"

//=====================================
// TZ Decryption
//=====================================
int tz_decrypt_key(unsigned char *input_buf, unsigned char *output_buf,int keylen){
    int fd, ret,i,count;
    htc_sdservice_msg_s sdservice_msg;

    if(keylen%32!=0){
        fprintf(stderr,"%s: The key len must be multiple of 32\n",__FUNCTION__);
        return -1;
    }

    fd = open("/dev/htc_sdservice", O_RDWR);
    if (fd == -1) {
        fprintf(stderr,"%s: open device htc_sdservice error\n",__FUNCTION__);
        return -1;
    }

    count=keylen/32;
    for(i=0;i<count;++i){
        memset(&sdservice_msg, 0, sizeof(htc_sdservice_msg_s));
        sdservice_msg.func = HTC_SD_KEY_DECRYPT;
        sdservice_msg.req_len = 32;
        sdservice_msg.req_buf = input_buf+32*i;
        sdservice_msg.resp_buf = output_buf+32*i;

        ret = ioctl(fd, HTC_IOCTL_SDSERVICE, &sdservice_msg);
        if (ret < 0) {
            fprintf(stderr,"%s: TZ Key En/Decrypt error (%d)\n",__FUNCTION__,ret);
            close(fd);
            return ret;
        }
    }

    return 0;
}

//=====================================
// utility for dm-crypt
//=====================================
void convert_key_to_hex_ascii(unsigned char *master_key, unsigned int keysize, char *master_key_ascii) {
    unsigned int i, a;
    unsigned char nibble;

    for (i=0, a=0; i<keysize; i++, a+=2) {
        /* For each byte, write out two ascii hex digits */
        nibble = (master_key[i] >> 4) & 0xf;
        master_key_ascii[a] = nibble + (nibble > 9 ? 0x37 : 0x30);

        nibble = master_key[i] & 0xf;
        master_key_ascii[a+1] = nibble + (nibble > 9 ? 0x37 : 0x30);
    }

    /* Add the null termination */
    master_key_ascii[a] = '\0';
}

//=====================================
// dm-crypt
//=====================================
void ioctl_init(struct dm_ioctl *io, size_t dataSize, const char *name, unsigned flags) {
    memset(io, 0, dataSize);
    io->data_size = dataSize;
    io->data_start = sizeof(struct dm_ioctl);
    io->version[0] = 4;
    io->version[1] = 0;
    io->version[2] = 0;
    io->flags = flags;
    if (name) {
        strncpy(io->name, name, sizeof(io->name));
    }
}

int dm_dev_exists(const char* name,char* dm_dev_path){
    int fd=-1;
    unsigned int minor;
    struct dm_ioctl *io=NULL;
    char buffer[DM_CRYPT_BUF_SIZE];

    if ((fd = open("/dev/device-mapper", O_RDWR)) < 0) {
        fprintf(stderr,"%s: Cannot open device-mapper\n",__FUNCTION__);
        return 0;
    }

    io = (struct dm_ioctl *) buffer;
    /* Get the device status, in particular, the name of it's device file */
    ioctl_init(io, DM_CRYPT_BUF_SIZE,name, 0);
    if (ioctl(fd, DM_DEV_STATUS, io)) {
        fprintf(stderr,"%s: Cannot retrieve dm-crypt device status\n",__FUNCTION__);
        close(fd);
        return 0;
    }

    close(fd);
    minor = (io->dev & 0xff) | ((io->dev >> 12) & 0xfff00);
    snprintf(dm_dev_path, DEVPATHLENGTH, "/dev/block/dm-%u", minor);
    return 1;
}

int dm_dev_find_name_by_id(unsigned int id,char* name){
    int fd;
    struct dm_ioctl *io=NULL;
    char buffer[DM_CRYPT_BUF_SIZE];
    unsigned int nlist_next;
    struct dm_name_list *nlist=0;
    unsigned int minor;

    if ((fd = open("/dev/device-mapper", O_RDWR)) < 0) {
        fprintf(stderr,"%s: Cannot open device-mapper\n",__FUNCTION__);
        return 0;
    }

    io = (struct dm_ioctl *) buffer;
    ioctl_init(io,DM_CRYPT_BUF_SIZE,NULL,0);
    if(ioctl(fd,DM_LIST_DEVICES,io)) {
        fprintf(stderr,"%s: Cannot list devices\n",__FUNCTION__);
        close(fd);
        return 0;
    }
    close(fd);

    //enumerate dm-crypt device
    nlist_next=0;
    nlist=(struct dm_name_list*)(((char*)buffer)+io->data_start);
    do{
        nlist =(struct dm_name_list*)(((char*)nlist)+nlist_next);
        minor = (io->dev & 0xff) | ((io->dev >> 12) & 0xfff00);
        if(minor==id){
            strcpy(name,nlist->name);
            return 1;
        }
        nlist_next=nlist->next;
    }while(nlist_next);

    return 0;
}

int dm_dev_create(const char* name,int type,const char* param,const char* dev_path,char* dm_dev_path){
    int fd=-1,fd_dev=-1;
    int retval = -1;
    unsigned int nr_sec;
    unsigned int minor;
    char *crypt_params;
    struct dm_ioctl *io=NULL;
    struct dm_target_spec *tgt;
    char buffer[DM_CRYPT_BUF_SIZE];

    if ((fd = open("/dev/device-mapper", O_RDWR)) < 0) {
        fprintf(stderr,"%s: Cannot open device-mapper\n",__FUNCTION__);
        return -1;
    }

    io = (struct dm_ioctl *) buffer;

    ioctl_init(io, DM_CRYPT_BUF_SIZE,name, 0);
    if(ioctl(fd, DM_DEV_CREATE, io)){
        fprintf(stderr,"%s: Cannot create dm-crypt device\n",__FUNCTION__);
        goto errout;
    }

    /* Get the device status, in particular, the name of it's device file */
    ioctl_init(io, DM_CRYPT_BUF_SIZE,name, 0);
    if (ioctl(fd, DM_DEV_STATUS, io)) {
        fprintf(stderr,"%s: Cannot retrieve dm-crypt device status\n",__FUNCTION__);
        goto errout;
    }
    minor = (io->dev & 0xff) | ((io->dev >> 12) & 0xfff00);
    snprintf(dm_dev_path, DEVPATHLENGTH, "/dev/block/dm-%u", minor);

    /* Load the mapping table for this device */
    if ((fd_dev = open(dev_path, O_RDWR)) < 0) {
        fprintf(stderr,"%s: Cannot open %s (%s)\n",__FUNCTION__,dev_path,strerror(errno));
        goto errout;
    }

    if (ioctl(fd_dev, BLKGETSIZE, &nr_sec)) {
        fprintf(stderr,"%s: Cannot get the size of %s\n",__FUNCTION__,dev_path);
        close(fd_dev);
        goto errout;
    }
    close(fd_dev);

    if(type==DM_TYPE_VFAT)nr_sec=nr_sec-1-(nr_sec%63);

    tgt=(struct dm_target_spec*)&buffer[sizeof(struct dm_ioctl)];

    ioctl_init(io, DM_CRYPT_BUF_SIZE,name, 0);
    io->target_count = 1;
    tgt->status = 0;
    tgt->sector_start = 0;
    tgt->length = nr_sec;
    strcpy(tgt->target_type, "crypt");

    crypt_params = buffer + sizeof(struct dm_ioctl) + sizeof(struct dm_target_spec);
    sprintf(crypt_params, "%s",param);
    crypt_params += strlen(crypt_params) + 1;
    crypt_params = (char *) (((unsigned long)crypt_params + 7) & ~8); /* Align to an 8 byte boundary */
    tgt->next = crypt_params - buffer;

    if (ioctl(fd, DM_TABLE_LOAD, io)) {
        fprintf(stderr,"%s: Cannot load dm-crypt mapping table. (%s)\n",__FUNCTION__,strerror(errno));
        goto errout;
    }

    /* Resume this device to activate it */
    ioctl_init(io, DM_CRYPT_BUF_SIZE, name, 0);
    if (ioctl(fd, DM_DEV_SUSPEND, io)) {
        fprintf(stderr,"%s: Cannot resume the dm-crypt device\n",__FUNCTION__);
        goto errout;
    }

       /* We made it here with no errors.  Woot! */
success:
       retval = 0;
errout:
       close(fd);
       return retval;
}

int dm_dev_destroy(const char* name){
    int fd=-1;
    struct dm_ioctl *io=NULL;
    char buffer[DM_CRYPT_BUF_SIZE];

    if ((fd = open("/dev/device-mapper", O_RDWR)) < 0) {
        fprintf(stderr,"%s: Cannot open device-mapper\n",__FUNCTION__);
        return -1;
    }

    io = (struct dm_ioctl *) buffer;

    ioctl_init(io, DM_CRYPT_BUF_SIZE,name, 0);
    if (ioctl(fd, DM_DEV_REMOVE, io)) {
        fprintf(stderr,"%s: Error destroying device mapping (%s)\n",__FUNCTION__,strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

//=====================================
// Help functions for ext encryption
//=====================================
int ext_check_encrypt(const char* devpath){
    int fd;
    char buf[512];
    const eMMCPartition *ep;
    const char *ENCRYPT_HEADER = "This is an encrypted device:)";

    ep=emmc_find_partition_by_dev(devpath);
    if(!ep){
        fprintf(stderr,"%s: ext encrypted partition must be in EMMC\n",__FUNCTION__);
        return 0;
    }

    if(emmc_read(ep,0,sizeof(buf),buf)){
        fprintf(stderr,"%s: Can't read header for %s\n",__FUNCTION__,ep->name);
        return 0;
    }
    buf[strlen(ENCRYPT_HEADER)] = '\0';

    if (buf[0] != '\0')
        fprintf(stderr,"%s: The encryption header is \"%s\"\n",__FUNCTION__,buf);

    if (!strcmp(ENCRYPT_HEADER, buf))
        return 1;
    else
        return 0;
}

//ICS: The ascii key is char 32.
//JB : The ascii key is char 64.
int ext_check_encrypt_keysize(void){
    const eMMCPartition *ep=NULL;
	struct crypt_mnt_ftr crypt_ftr;

    ep=emmc_find_partition_by_name(EMMC_PARTITION_EXTRA_NAME);
    if(ep==NULL){
        fprintf(stderr,"%s: Can't find emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_EXTRA_NAME);
        return -1;
    }

    if(emmc_read(ep ,0,sizeof(struct crypt_mnt_ftr),&crypt_ftr)) {
        fprintf(stderr,"%s: Can't read emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_EXTRA_NAME);
        return -1;
    }

    return crypt_ftr.keysize;
}

//=====================================
// Help functions for vfat encryption
//=====================================
int vfat_check_encrypt(const char* devpath,unsigned int* keyhash){
    int fd;
    struct sdenc_superblock sb;

    if ((fd = open(devpath, O_RDWR)) < 0) {
        fprintf(stderr,"%s: Fail to open %s\n",__FUNCTION__,devpath);
        return 0;
    }

    // Validate superblock
    memset(&sb, 0, sizeof(sb));
    if (read(fd, &sb, sizeof(sb)) != sizeof(sb)) {
        fprintf(stderr,"%s: Superblock read failed %s\n",__FUNCTION__,devpath);
        close(fd);
        return 0;
    }

    if (sb.magic != SDENC_SB_MAGIC) {
        fprintf(stderr,"%s: Bad magic number (%.8x), expected %.8x\n",__FUNCTION__,sb.magic,SDENC_SB_MAGIC);
        close(fd);
        return 0;
    }

    if (sb.ver!=SDENC_SB_VER1&&sb.ver!=SDENC_SB_VER2) {
        fprintf(stderr,"%s: Bad version (%.2x)\n",__FUNCTION__,sb.ver);
        close(fd);
        return 0;
    }

    *keyhash=sb.key_hash;
    return sb.ver;
}

int vfat_check_key(unsigned int keyhash,unsigned char* key, int keylen){
    static const char* digits = "0123456789abcdef";
    unsigned char sig[MD5_DIGEST_LENGTH];
    unsigned char key_tmp[128]={0};
    unsigned char keyHash[33]={0};
    unsigned int keyHash32=0;
    unsigned char* p=NULL;
    int i=0;

    memcpy(key_tmp,key,keylen);
    MD5(key_tmp,keylen,sig);

    p = keyHash;
    for (i = 0; i < MD5_DIGEST_LENGTH; i++) {
        *p++ = digits[sig[i] >> 4];
        *p++ = digits[sig[i] & 0x0F];
    }
    *p = '\0';

    keyHash[8]=0;
    keyHash32 = (unsigned int)strtoul(keyHash,NULL,16);

    return keyhash==keyHash32;
}
