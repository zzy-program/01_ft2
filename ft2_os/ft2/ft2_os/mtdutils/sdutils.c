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
#include <unistd.h>
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
#include "htc_recvy_utils/dir_operation.h"

#include "sdutils.h"
#include "emmcutils.h"
#include "encdevice.h"
#include <dirent.h>

#define PERSISTENT_PROPERTY_DIR  "/data/property"
int rpipes [2];
int wpipes [2];

static const char *USERDATA_ROOT = "/data";

extern int ensure_path_mounted(const char* path);

//=====================================
// SD Card common function
//=====================================
int sd_mount_partition(const char *devpath1,const char *devpath2,const char *mount_point,const char *filesystem){
    int enc_ver=0;
    unsigned int p_keyhash=0,keyhash=0,keyhashlen=0;
    unsigned char tz_enc_key[64]={0};
    unsigned char tz_dec_key[64]={0};
    char enc_devpath[DEVPATHLENGTH]={0};
    char key[65]={0},keylen=0;
    char param[256]={0};
    const char* devlist[3]={devpath1,devpath2,(char*)NULL};
    const char* devpath=NULL;
    int index=0;
    char* name=NULL;
    int retry_count=0;
    int retry_max=3;
    int retry_sleep_time=1;
    int encrypt_mount_fail=0;
    int fd,isExFat = 0, mError = 0;

#ifdef HTC_EXFAT
    const char *filesystem_exfat = "exfat";
#else
    const char *filesystem_exfat = "texfat";
#endif

    //For exFAT check
    fd = open(devpath1, O_RDONLY);
    if (fd != -1) {
           fprintf(stderr,"%s: open success, fd=%d\n",__FUNCTION__, fd);
           loff_t seek_res = lseek64(fd, 0, SEEK_SET);
           if (seek_res == 0) {
                   char boot_sector[512];
                   ssize_t read_res = read(fd, boot_sector, 512);
                   if (read_res == 512) {
                           if (!memcmp(&boot_sector[3], "EXFAT   ", 8)) {
                                  //Filesystem check completed OK (exFAT volume)
                                  isExFat = 1;
                                  fprintf(stderr,"%s: EXFAT, isExFat: %d\n",__FUNCTION__,isExFat);
                           }
                           else if (!memcmp(&boot_sector[0], "RRaAXFAT   ", 11)) {
                                   //Filesystem check completed OK (fixing corrupted exFAT volume)
                                   isExFat = 1;
                                   fprintf(stderr,"%s: RaAXFAT, isExFat: %d\n",__FUNCTION__,isExFat);
                           }
                           else {
                                   isExFat = 0;
                                   fprintf(stderr,"%s: else, isExFat: %d\n",__FUNCTION__,isExFat);
                           }
                   }
                   else if (read_res != -1)
                   {
                           isExFat = 0;
                           fprintf(stderr,"%s: read_res != -1, isExFat: %d",__FUNCTION__, isExFat);
                   }
           }
           else if (seek_res != -1){
                       isExFat = 0;
                       fprintf(stderr,"%s: seek_res != -1, isExFat: %d",__FUNCTION__, isExFat);
           }

           close(fd);
    }
    else{
        fprintf(stderr,"%s: open failed, fd=%d\n",__FUNCTION__, fd);
    }

    //For encryption check
    for(retry_count=0;retry_count<retry_max;++retry_count){ //For Retry
        index=0;
        while(1){ //Foreach device
            devpath=devlist[index++];
            if(devpath==NULL)break;

            name=strrchr(devpath,'/');
            if(name==NULL){
                fprintf(stderr,"%s: check name failed for %s\n",__FUNCTION__,devpath);
                continue;
            }
            name=name+1;

            enc_ver=vfat_check_encrypt(devpath,&p_keyhash);
            if(!enc_ver){
                fprintf(stderr,"%s: check encrypt failed for %s\n",__FUNCTION__,devpath);
                continue;
            }

            if(enc_ver==SDENC_SB_VER1){
                keyhashlen=56;
                keylen=48;
            }else if(enc_ver==SDENC_SB_VER2){
                keyhashlen=64;
                keylen=64;
            }

            if(emmc_get_tz_encrypted_key(tz_enc_key,sizeof(tz_enc_key),ENC_KEY_OFFSET_FAT,(enc_ver-1)*64)){
                fprintf(stderr,"%s: read key failed for %s\n",__FUNCTION__,devpath);
                continue;
            }

            if(tz_decrypt_key(tz_enc_key,tz_dec_key,sizeof(tz_enc_key))){
                fprintf(stderr,"%s: decrypt key failed %s\n",__FUNCTION__,devpath);
                continue;
            }

            if(!vfat_check_key(p_keyhash,tz_dec_key,keyhashlen)){
                fprintf(stderr,"%s: check key failed %s\n",__FUNCTION__,devpath);
                continue;
            }

            if(!dm_dev_exists(name,enc_devpath)){
                memcpy(key,tz_dec_key,keylen);
                snprintf(param,sizeof(param),"%s %s 0 %s 1","aes",key,devpath);
                //dm dev didn't exist, so create it
                if(dm_dev_create(name,DM_TYPE_VFAT,param,devpath,enc_devpath)){
                    fprintf(stderr,"%s: create dm-crypt device failed\n",__FUNCTION__);
                    continue;
                }
            }

            mError = mount(enc_devpath,mount_point,filesystem,MS_NOATIME|MS_NODEV|MS_NODIRATIME,"");
            if(mError){
                fprintf(stderr,"%s: Enc fat mount failed %d; enc_devpath:%s\n",__FUNCTION__, mError, enc_devpath);
                mError = mount(enc_devpath,mount_point,filesystem_exfat,MS_NOATIME|MS_NODEV|MS_NODIRATIME,"");
            }

            if(!mError){
                fprintf(stderr,"%s: mount dm-dev for %s success; enc_devpath:%s\n",__FUNCTION__, mount_point, enc_devpath);
                return 0;
            }else{
                fprintf(stderr,"%s: Enc exfat mount dm-dev for %s failed; enc_devpath:%s\n",__FUNCTION__, mount_point, enc_devpath);
                dm_dev_destroy(name);
                encrypt_mount_fail=1;
                continue;
            }

        } //Foreach Device
        sleep(retry_sleep_time);
    } //For Retry
    if(encrypt_mount_fail)return -1; //Encrypted and mount failed

    //For no encryption and file level encryption
    for(retry_count=0;retry_count<retry_max;++retry_count){ //For Retry
        index=0;
        while(1){ //Foreach Device
            char buff[200];
            unsigned char tz_enc_key[64]={0};
            unsigned char tz_dec_key[65]={0};
            char prop[PROPERTY_VALUE_MAX];
            int sdcard_ecryptfs = 0;
            devpath=devlist[index++];
            if(devpath==NULL)break;
            get_persist_property();
            property_get("persist.sys.sdcard_ecryptfs", prop, "false");
            sdcard_ecryptfs = (strcmp(prop, "true") ? 0 : 1);
            fprintf(stderr,"persist.sys.sdcard_ecryptfs: %s\n", prop);
            //Get the encrypted key
            if (sdcard_ecryptfs) {
                char *sig = NULL;
                int rc = 0;
                char ecryptfs_level_prop[PROPERTY_VALUE_MAX];
                char crypto_type_name[64];

                if (emmc_get_tz_encrypted_key(tz_enc_key,sizeof(tz_enc_key),ENC_KEY_OFFSET_FAT,64)){
                    fprintf(stderr,"%s: read key failed for %s\n",__FUNCTION__,devpath);
                    continue;
                }

                if (tz_decrypt_key(tz_enc_key,tz_dec_key,64)){
                    fprintf(stderr,"%s: decrypt key failed %s\n",__FUNCTION__,devpath);
                    continue;
                }

                //call the MOC_ecryptfs_add_passphrase
                pid_t pid;
                char returned_string [200];

                if (pipe(rpipes) != 0)
                    fprintf(stderr,"%s: pipe() call for rpipes failed",__FUNCTION__);

                if (pipe(wpipes) != 0)
                    fprintf(stderr,"%s: pipe() call for wpipes failed",__FUNCTION__);

                pid = fork();
                if (pid < 0) {
                    fprintf(stderr,"%s: fork() call failed",__FUNCTION__);
                } else if (pid > 0) {
                    // parent
                    ssize_t num_read = 0;
                    close(wpipes[0]);
                    close(rpipes[1]);
                    if (write(wpipes[1], tz_dec_key, sizeof(tz_dec_key)) != sizeof(tz_dec_key))
                        fprintf(stderr,"%s: parent: write() call failed",__FUNCTION__);
                    if ((num_read = read(rpipes[0], returned_string, 200)) < 0)
                        fprintf(stderr,"%s: parent: read() call failed",__FUNCTION__);
                    returned_string [num_read] = 0;
                    wait(NULL);
                } else {
                    // child
                    close(wpipes[1]);
                    close(rpipes[0]);
                    dup2(wpipes[0], STDIN_FILENO);
                    dup2(rpipes[1], STDOUT_FILENO);
                    close(wpipes[0]);
                    close(rpipes[1]);
                    execlp("/sbin/MOC_ecryptfs_add_passphrase", "/sbin/MOC_ecryptfs_add_passphrase", NULL);
                }
                //parse the return string for getting the sig
                char *delim = " ";
                char *delim_bracket = "[]";
                char * pch;
                pch = strtok(returned_string, delim);
                while (pch != NULL) {
                    if (!strncmp(pch, "[", 1)) {
                        sig = strtok(pch, delim_bracket);
                        break;
                    }
                    pch = strtok(NULL, delim);
                }

                /* aes-xts and aes-cbc */
                property_get("persist.sys.encrypt_level", ecryptfs_level_prop, "high");

                if (strcmp(ecryptfs_level_prop, "high") == 0) {
                    strcpy(crypto_type_name, "aes-xts");
                    fprintf(stderr, "%s: Just setup for aes-xts encryption\n", __FUNCTION__);
                } else {
                    strcpy(crypto_type_name, "aes-cbc");
                    fprintf(stderr, "%s: Just setup for aes-cbc encryption\n", __FUNCTION__);
                }
                snprintf(buff, sizeof(buff), "ecryptfs_sig=%s,ecryptfs_cipher=%s,ecryptfs_key_bytes=32,ecryptfs_unlink_sigs,ecryptfs_passthrough", (sig==NULL)?"NULL":sig, crypto_type_name);
            }

            mError = mount(devpath,mount_point,filesystem,MS_NOATIME|MS_NODEV|MS_NODIRATIME,"");
            if(mError){
                fprintf(stderr,"%s: fat mount failed %d; devpath:%s\n",__FUNCTION__, mError, devpath);
                mError = mount(devpath,mount_point,filesystem_exfat,MS_NOATIME|MS_NODEV|MS_NODIRATIME,"");
            }

            if(!mError){
                fprintf(stderr,"%s: mount dev for %s success; devpath:%s\n",__FUNCTION__,mount_point,devpath);
                if (sdcard_ecryptfs) {
                    if (!mount(mount_point, mount_point,"ecryptfs",MS_NOEXEC|MS_NODEV, buff)) {
                        fprintf(stderr,"%s: ecryptfs mount for %s success\n",__FUNCTION__,mount_point);
                    } else {
                        fprintf(stderr,"%s: mount ecryptfs for %s failed\n",__FUNCTION__,mount_point);
                        continue;
                    }
                }
                return 0;
            } else {
                fprintf(stderr,"%s: exfat mount dev for %s failed; devpath:%s\n",__FUNCTION__,mount_point,devpath);
                continue;
            }
            ++devpath;
        } //Foreach Device
        sleep(retry_sleep_time);
    } //For Retry

    return -1;
}

int sd_umount_partition(const char *devpath,const char *mount_point){
    int ret = 0;
    int retry_count=0;
    int retry_max=3;
    int retry_sleep_time=1;
    int id=0;
    char prop[PROPERTY_VALUE_MAX];
    int sdcard_ecryptfs = 0;
    char dm_dev_name[32]={0};

    property_get("persist.sys.sdcard_ecryptfs", prop, "false");
    sdcard_ecryptfs = (strcmp(prop, "true") ? 0 : 1);
    fprintf(stderr,"persist.sys.sdcard_ecryptfs: %s\n", prop);

    //umount
    if (sdcard_ecryptfs) {
        for(retry_count=0;retry_count<retry_max;++retry_count){ //For Retry
            ret=umount(mount_point);
            if(ret==0)break;
            sleep(retry_sleep_time);
        } //For Retry
   }
   for (retry_count=0;ret==0 && retry_count<retry_max;++retry_count){ //For Retry
        ret=umount(mount_point);
        if(ret==0)break;
        sleep(retry_sleep_time);
    } //For Retry

    if (ret!=0){
        fprintf(stderr,"%s: umount %s failed\n",__FUNCTION__,mount_point);
        return ret;
    } else {
        fprintf(stderr, "%s: umount %s success\n",__FUNCTION__,mount_point);
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

int sd_format_partition(const char *devpath,const char *mount_point,const char *filesystem){
    char *param[12] = {"/sbin/newfs_msdos_recvy", "-F", "32" , "-O", "android","-c", "64", "-r", "3106", "-d", devpath,(char*)0};
    int fd,capacity = 0;
    pid_t pid;
    int status;

    //Get device size
    if ((fd = open(devpath, O_RDONLY)) < 0) {
        fprintf(stderr,"%s: Unable to open device %s (%s)",__FUNCTION__,devpath,strerror(errno));
        return -1;
    }
    if (ioctl(fd, BLKGETSIZE, &capacity)) {
        fprintf(stderr,"%s: Unable to get device size for %s (%s)",__FUNCTION__,devpath,strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);

    if (capacity == 51372032) param[8] = "3844";
    else if (capacity == 20836352) param[8] = "3106";
    else param[8] = "32";

    //Execute /sbin/newfs_msdos_recvy
    pid = fork();
    if (!pid){
        execv(param[0],param);
        fprintf(stderr,"%s: execv %s err = %s\n",__FUNCTION__,param[0],strerror(errno));
        return 0;
    } else {
        while(wait(&status)!=pid);
    }

    fprintf(stderr,"%s: execv %s finish\n",__FUNCTION__,param[0]);
    return  0;
}

void get_persist_property(){
    //if (ensure_path_mounted(USERDATA_ROOT) == 0) {
    if (0) {
        fprintf(stderr,"%s: Mount %s Successfully!\n",__FUNCTION__,USERDATA_ROOT);
        if(dir_exists(PERSISTENT_PROPERTY_DIR)!=0){
            fprintf(stderr,"%s: Dir %s Do Exist!\n",__FUNCTION__,PERSISTENT_PROPERTY_DIR);
            // read persist system property for enable or disable file level encryption
            DIR* dir = opendir(PERSISTENT_PROPERTY_DIR);
            struct dirent*  entry;
            char path[PATH_MAX];
            char value[PROPERTY_VALUE_MAX];
            int fd, length;
            if (dir) {
                while ((entry = readdir(dir)) != NULL) {
                    if (strncmp("persist.", entry->d_name, strlen("persist.")))
                        continue;

                    if (entry->d_type != DT_REG)
                        continue;

                    /* open the file and read the property value */
                    snprintf(path, sizeof(path), "%s/%s", PERSISTENT_PROPERTY_DIR, entry->d_name);
                    fd = open(path, O_RDONLY);
                    if (fd >= 0) {
                        length = read(fd, value, sizeof(value) - 1);
                        if (length >= 0) {
                            value[length] = 0;
                            property_set(entry->d_name, value);
                        } else {
                            fprintf(stderr,"%s: Unable to read persistent property file %s (%s)\n",__FUNCTION__, path, strerror(errno));
                        }
                        close(fd);
                    } else
                        fprintf(stderr,"%s: Unable to open persistent property file %s (%s)\n",__FUNCTION__, path, strerror(errno));
                }
                closedir(dir);
            } else
                fprintf(stderr,"%s: Unable to open persistent property directory %s (%s)\n",__FUNCTION__,PERSISTENT_PROPERTY_DIR, strerror(errno));
        } else
            fprintf(stderr,"%s: Dir %s Do NOT Exist!\n",__FUNCTION__,PERSISTENT_PROPERTY_DIR);
    } else
        fprintf(stderr,"%s: Mount %s Fail!\n",__FUNCTION__,USERDATA_ROOT);
}
