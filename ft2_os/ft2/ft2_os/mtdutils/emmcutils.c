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
#include "cutils/properties.h"

#include "make_ext4fs.h"

#include "emmcutils.h"
#include "encdevice.h"
#include "sdutils.h"

//=====================================
// Help functions for emmc
//=====================================
// NOTICE: we need to sync these values from hboot if they changed!!
// Define emmc page size (bytes) for bootloader read/write
#define EMMC_PROC_FILENAME   "/proc/emmc"

static int emmc_page_size=EMMC_DEFAULT_PAGE_SIZE;

static eMMCState g_emmc_state = {
    NULL,   // partitions
    0,      // partitions_allocd
    -1      // partition_count
};

void emmc_set_page_size(int page_size){
    fprintf(stderr,"%s: page size %d\n",__FUNCTION__,page_size);
    if(page_size!=0)emmc_page_size=page_size;
}

int emmc_get_page_size(){
    return emmc_page_size;
}

int emmc_scan_partitions(void){
    char buf[4096];
    const char *bufp;
    int fd;
    int i;
    ssize_t nbytes;

    if (g_emmc_state.partitions == NULL) {
        //The max partition is 128 in GPT spec
        const int nump = 128;
        eMMCPartition *partitions = malloc(nump * sizeof(*partitions));
        if (partitions == NULL) {
            errno = ENOMEM;
            return -1;
        }
        g_emmc_state.partitions = partitions;
        g_emmc_state.partitions_allocd = nump;
        memset(partitions, 0, nump * sizeof(*partitions));
    }
    g_emmc_state.partition_count = 0;

    /* Initialize all of the entries to make things easier later.
     * (Lets us handle sparsely-numbered partitions, which
     * may not even be possible.)
     */
    for (i = 0; i < g_emmc_state.partitions_allocd; i++) {
        eMMCPartition *p = &g_emmc_state.partitions[i];
        if (p->dev !=NULL) {
            free(p->dev);
            p->dev = NULL;
        }
        if (p->name != NULL) {
            free(p->name);
            p->name = NULL;
        }
    }

    /* Open and read the file contents.
     */
    fd = open(EMMC_PROC_FILENAME, O_RDONLY);
    if (fd < 0) {
        fprintf(stderr,"%s: Failed to open %s\n",__FUNCTION__,EMMC_PROC_FILENAME);
        goto bail;
    }
    nbytes = read(fd, buf, sizeof(buf) - 1);
    close(fd);
    if (nbytes < 0) {
        goto bail;
    }
    buf[nbytes] = '\0';

    /* Parse the contents of the file, which looks like:
     *
     *     # cat /proc/emmc
     *     dev:        size     erasesize name
     *     mmcblk0p21: 000ffa00 00000200 "misc"
     *     mmcblk0p20: 00fffe00 00000200 "recovery"
     *     mmcblk0p19: 01000000 00000200 "boot"
     *     mmcblk0p32: 73fffc00 00000200 "system"
     */
    bufp = buf;
    while (nbytes > 0) {
        int emmcsize, emmcerasesize;
        int matches;
        char emmcdev[64];
        char emmcname[64];
        emmcname[0] = '\0';

        matches = sscanf(bufp, "%63[^:]: %x %x \"%63[^\"]",emmcdev, &emmcsize, &emmcerasesize, emmcname);
        //LOGI("%s:[emmcdev:%s] [emmcsize:%d] [emmcerasesize:%d] [emmcname:%s]\n", __FUNCTION__, emmcdev, emmcsize, emmcerasesize, emmcname);
        /* This will fail on the first line, which just contains
         * column headers.
         */
        if (matches == 4) {
            eMMCPartition *p = &g_emmc_state.partitions[g_emmc_state.partition_count];
            p->dev = strdup(emmcdev);
            p->size = emmcsize;
            p->erasesize = emmcerasesize;
            p->name = strdup(emmcname);
            if (p->dev==NULL||p->name==NULL) {
                errno = ENOMEM;
                goto bail;
            }
            g_emmc_state.partition_count++;
        }

        /* Eat the line.
         */
        while (nbytes > 0 && *bufp != '\n') {
            bufp++;
            nbytes--;
        }
        if (nbytes > 0) {
            bufp++;
            nbytes--;
        }
    }
    LOGI("%s:[partition_count:%d] [allocat_num:%d]\n", __FUNCTION__, g_emmc_state.partition_count, g_emmc_state.partitions_allocd);
    return g_emmc_state.partition_count;

bail:
    // keep "partitions" around so we can free the names on a rescan.
    g_emmc_state.partition_count = -1;
    return -1;

}

const eMMCPartition* emmc_find_partition_by_dev(const char *dev){
    if (g_emmc_state.partitions != NULL && dev != NULL) {
        int i;
        const char *devname=NULL;

        if(strncmp(dev,"/dev/block/",strlen("/dev/block/")) == 0)
            devname=dev+strlen("/dev/block/");
        else
            devname=dev;

        for (i = 0; i < g_emmc_state.partitions_allocd; i++) {
            eMMCPartition *p = &g_emmc_state.partitions[i];
            if (p->dev!=NULL&&strcmp(p->dev, devname) == 0) {
                return p;
            }
        }
    }
    return NULL;
}

const eMMCPartition* emmc_find_partition_by_name(const char *name){

    if (g_emmc_state.partitions == NULL){
        LOGE("%s: g_emmc_state.partitions is NULL\n",__FUNCTION__);
        return NULL;
    }
    if (name == NULL){
        LOGE("%s: name is NULL\n",__FUNCTION__);
        return NULL;
    }
    if (g_emmc_state.partitions != NULL && name != NULL) {
        int i;
        for (i = 0; i < g_emmc_state.partitions_allocd; i++) {
            eMMCPartition *p = &g_emmc_state.partitions[i];
            if (p->name!=NULL && strcmp(p->name, name) == 0) {
                return p;
            }
        }
    }

    LOGE("%s: Can't not find partition:%s\n", __FUNCTION__, name);
    return NULL;
}

int emmc_mount_partition(const eMMCPartition *partition,const char *mount_point,const char *filesystem){
    char devpath[32]="/dev/block/";
    char enc_devpath[DEVPATHLENGTH]={0};
    char master_key_ascii[128]={0};;
    char param[256]={0};
    unsigned char tz_enc_key[32]={0};
    unsigned char tz_dec_key[32]={0};
    int keysize = 0;
    int retry_count = 0;
    int retry_max = 10;

    strncat(devpath,partition->dev,strlen(partition->dev));
    if(strcmp(filesystem, "ext3") == 0 ||
       strcmp(filesystem, "ext4") == 0){
        if(!strncmp(partition->name,"userdata",strlen("userdata"))&&ext_check_encrypt(devpath)){
            //encrypted userdata partition
            if(emmc_get_tz_encrypted_key(tz_enc_key,sizeof(tz_enc_key),ENC_KEY_OFFSET_EXT,0)){
                fprintf(stderr,"%s: read key failed\n",__FUNCTION__);
                return -1;
            }
            if(tz_decrypt_key(tz_enc_key,tz_dec_key,sizeof(tz_enc_key))){
                fprintf(stderr,"%s: decrypt key failed\n",__FUNCTION__);
                return -1;
            }
            if(!dm_dev_exists(partition->name,enc_devpath)){
                //dm dev didn't exist, so create it
                convert_key_to_hex_ascii(tz_dec_key,32,master_key_ascii);
                keysize=ext_check_encrypt_keysize();
                if(keysize!=16&&keysize!=32){
                    fprintf(stderr, "%s: invalid encryption keysize %d\n",__FUNCTION__, keysize);
                    return -1;
                }else if(keysize==16){
                    /* ICS: we use AES 128-bit key */
                    master_key_ascii[32]=0;
                }
                fprintf(stdout, "%s: The keysize in crypto footer of %s is %d\n",
                        __FUNCTION__,partition->name,keysize);
                snprintf(param,sizeof(param), "%s %s 0 %s 0", "aes-cbc-essiv:sha256",master_key_ascii,devpath);
                if(dm_dev_create(partition->name,DM_TYPE_EXT,param,devpath,enc_devpath)){
                    fprintf(stderr,"%s: create dm-crypt device failed\n",__FUNCTION__);
                    return -1;
                }
            }
            for(retry_count = 0; retry_count < retry_max; retry_count++){
                if(!mount(enc_devpath,mount_point,filesystem,MS_NOATIME|MS_NODEV|MS_NODIRATIME,"")){
                    fprintf(stderr,"%s: mount dm-dev %s success\n",__FUNCTION__,partition->name);
                    return 0;
                }else{
                    usleep(50000);
                }
            }
            fprintf(stderr,"%s: mount dm-dev %s failed\n",__FUNCTION__,partition->name);
            dm_dev_destroy(partition->name);
            return -1;
        }else{
            //no encrypted partition
            if(!mount(devpath,mount_point,filesystem,MS_NOATIME|MS_NODEV|MS_NODIRATIME,"discard")){
                fprintf(stderr,"%s: mount dev %s success\n",__FUNCTION__,partition->name);
                return 0;
            }else{
                fprintf(stderr,"%s: mount dev %s failed\n",__FUNCTION__,partition->name);
                return -1;
            }
        }
    }else if(strcmp(filesystem, "vfat") == 0){
        return sd_mount_partition(devpath,NULL,mount_point,filesystem);
    }else{
        fprintf(stderr,"%s: unknown filesystem %s\n",__FUNCTION__,filesystem);
        return -1;
    }
    return 0;
}

int emmc_umount_partition(const char *devpath,const char *mount_point){
    int ret = 0;
    int retry_count=0;
    int retry_max=10;
    int retry_sleep_time=1;
    int id=0;
    char dm_dev_name[32]={0};

    //umount
    for(retry_count=0;retry_count<retry_max;++retry_count){ //For Retry
        ret=umount(mount_point);
        if (ret == 0)
            break;
        else
            fprintf(stderr,"%s: umount %s failed, ret %d, errno %d (%s).. retry....%d\n",
                __FUNCTION__, mount_point, ret, errno, strerror(errno), retry_count);
        sleep(retry_sleep_time);
    } //For Retry

    if(ret != 0){
        fprintf(stderr,"%s: umount %s failed, ret %d, errno %d (%s)\n",
            __FUNCTION__, mount_point, ret, errno, strerror(errno));
        return ret;
    }

    //destroy dm-crypt device if exists
    if(strncmp(devpath,"/dev/block/dm-",strlen("/dev/block/dm-"))==0){
        sscanf(devpath,"/dev/block/dm-%d",&id);
        if(dm_dev_find_name_by_id((unsigned int)id,dm_dev_name)){
            for(retry_count=0;retry_count<retry_max;++retry_count){ //For Retry
                ret=dm_dev_destroy(dm_dev_name);
                if(ret==0){
                    fprintf(stderr,"%s: destroy %s successful\n",__FUNCTION__,dm_dev_name);
                    break;
                }else{
                    fprintf(stderr,"%s: destroy %s failed\n",__FUNCTION__,dm_dev_name);
                }
                sleep(retry_sleep_time);
            } //For Retry
        }
    }

    return ret;
}

int emmc_format_partition(const eMMCPartition *partition,const char* mount_point,const char *filesystem,int length,struct selabel_handle *sehandle){
    char devpath[32]="/dev/block/";
    strncat(devpath,partition->dev,strlen(partition->dev));
    if(strcmp(filesystem, "ext4") == 0) {
        return make_ext4fs(devpath,length,mount_point,sehandle);
    }else if(strcmp(filesystem, "ext3") == 0) {
        //FIXME:Not Support
        fprintf(stderr,"%s: Not support for %s!\n",__FUNCTION__,filesystem);
        return -1;
    }else if(strcmp(filesystem, "vfat") == 0) {
        return sd_format_partition(devpath,mount_point,filesystem);
    }else if(strcmp(filesystem, "raw") == 0) {
        return emmc_erase_partition(partition);
    }
    fprintf(stderr,"%s: Not support for %s!\n",__FUNCTION__,filesystem);
    return -1;
}

int emmc_read(const eMMCPartition *ep,loff_t offset,long length,void *pdata) {
    int fd=-1;
    char devpath[32]="/dev/block/";
    if ((!ep)||(offset<0)||(length<=0)||(!pdata)){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    strncat(devpath,ep->dev,strlen(ep->dev));
    fd=open(devpath,O_RDWR);
    if(fd<0){
        fprintf(stderr,"%s: open %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        return -1;
    }

    if(lseek64(fd,offset,SEEK_SET)<0){
        fprintf(stderr,"%s: seek %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        close(fd);
        return -1;
    }

    if (read(fd,pdata,length)!=length){
        fprintf(stderr,"%s: read %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int emmc_write(const eMMCPartition *ep,loff_t offset,long length,void *pdata){
    int fd=-1;
    char devpath[32]="/dev/block/";
    if((!ep)||(offset<0)||(length<=0)||(!pdata)){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    strncat(devpath,ep->dev,strlen(ep->dev));
    fd=open(devpath,O_RDWR);
    if(fd<0){
        fprintf(stderr,"%s: open %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        return -1;
    }

    if(lseek64(fd,offset,SEEK_SET)<0){
        fprintf(stderr,"%s: seek %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        close(fd);
        return -1;
    }

    if (write(fd,pdata,length)!=length){
        fprintf(stderr,"%s: write %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);
    sync();sync();sync();
    return 0;
}

int emmc_erase_partition(const eMMCPartition *partition) {
    int fd=-1;
    long long int i=0,size=0,count=0;
    char devpath[32]="/dev/block/";
    char dummy[512]={0};
    if(!partition){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    strncat(devpath,partition->dev,strlen(partition->dev));
    fd=open(devpath,O_RDWR);
    if(fd<0){
        fprintf(stderr,"%s: open %s failed %s\n",__FUNCTION__,devpath,strerror(errno));
        return -1;
    }

    //Get Parititon Size
    size=lseek(fd,0,SEEK_END);
    if(size<0)
        return -1;

    //Reset Position
    if(lseek(fd,0,SEEK_SET)!=0)
        return -1;

    //Write Block 512
    count=size/512;
    for(i=0;i<count;++i){
        if(write(fd,dummy,512)!=512)
            return -1;
    }

    //Write Left byte
    count=size%512;
    if(count!=0){
        if(write(fd,dummy,count)!=count)
            return -1;
    }
    fsync(fd);
    close(fd);
    return 0;
}


int emmc_get_bootloader_message(void *data,int size){
    const eMMCPartition *ep=NULL;
    int readsize = emmc_get_page_size() * EMMC_MISC_PAGES;
    char readdata[readsize];

    if(!data||size<=0){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    ep=emmc_find_partition_by_name(EMMC_PARTITION_MISC_NAME);
    if(ep==NULL){
        fprintf(stderr,"%s: Can't find emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME);
        return -1;
    }

    if(emmc_read(ep ,0,readsize,readdata)) {
        fprintf(stderr,"%s: Can't read emmc partition %s %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME,strerror(errno));
        return -1;
    }

    memcpy(data,&readdata[emmc_get_page_size()*EMMC_MISC_COMMAND_PAGE],size);
    return 0;
}

int emmc_set_bootloader_message(void *data,int size){
    const eMMCPartition *ep=NULL;
    int readsize = emmc_get_page_size() * EMMC_MISC_PAGES;
    char readdata[readsize];

    if(!data||size<=0){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    ep=emmc_find_partition_by_name(EMMC_PARTITION_MISC_NAME);
    if(ep==NULL){
        fprintf(stderr,"%s: Can't find emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME);
        return -1;
    }

    if(emmc_read(ep ,0,readsize,readdata)){
        fprintf(stderr,"%s: Can't read emmc partition %s %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME,strerror(errno));
        return -1;
    }

    memcpy(&readdata[emmc_get_page_size()*EMMC_MISC_COMMAND_PAGE],data,size);

    if(emmc_write(ep,0,readsize,(void*)readdata)){
        fprintf(stderr,"%s: Can't write emmc partition %s %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME,strerror(errno));
        return -1;
    }

    return 0;
}

int emmc_get_misc_page0(void *data,int size){
    const eMMCPartition *ep=NULL;
    int readsize = emmc_get_page_size() * EMMC_MISC_PAGES;
    char readdata[readsize];

    if(!data||size<=0){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    ep=emmc_find_partition_by_name(EMMC_PARTITION_MISC_NAME);
    if(ep==NULL){
        fprintf(stderr,"%s: Can't find emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME);
        return -1;
    }

    if(emmc_read(ep ,0,readsize,readdata)) {
        fprintf(stderr,"%s: Can't read emmc partition %s %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME,strerror(errno));
        return -1;
    }

    memcpy(data,&readdata[emmc_get_page_size()*EMMC_MISC_PAGE0_PAGE],size);
    return 0;
}

int emmc_set_misc_page0(void *data,int size){
    const eMMCPartition *ep=NULL;
    int readsize = emmc_get_page_size() * EMMC_MISC_PAGES;
    char readdata[readsize];

    if(!data||size<=0){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    ep=emmc_find_partition_by_name(EMMC_PARTITION_MISC_NAME);
    if(ep==NULL){
        fprintf(stderr,"%s: Can't find emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME);
        return -1;
    }

    if(emmc_read(ep ,0,readsize,readdata)){
        fprintf(stderr,"%s: Can't read emmc partition %s %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME,strerror(errno));
        return -1;
    }

    memcpy(&readdata[emmc_get_page_size()*EMMC_MISC_PAGE0_PAGE],data,size);

    if(emmc_write(ep,0,readsize,(void*)readdata)){
        fprintf(stderr,"%s: Can't write emmc partition %s %s\n",__FUNCTION__,EMMC_PARTITION_MISC_NAME,strerror(errno));
        return -1;
    }

    return 0;
}

int emmc_get_tz_encrypted_key(unsigned char *data,int size,int page_num,int offset){
    const eMMCPartition *ep=NULL;
    int blk_size=512;

    if(!data||size<=0){
        fprintf(stderr,"%s: invalid argument!\n",__FUNCTION__);
        return -1;
    }

    ep=emmc_find_partition_by_name(EMMC_PARTITION_EXTRA_NAME);
    if(ep==NULL){
        fprintf(stderr,"%s: Can't find emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_EXTRA_NAME);
        return -1;
    }

    if(emmc_read(ep ,(page_num-1)*blk_size+offset,size,data)) {
        fprintf(stderr,"%s: Can't read emmc partition %s\n",__FUNCTION__,EMMC_PARTITION_EXTRA_NAME);
        return -1;
    }

    return 0;
}

