LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	mtdutils.c \
	mounts.c \
	emmcutils.c \
	encdevice.c \
	sdutils.c

LOCAL_MODULE := libmtdutils_ft2
LOCAL_CLANG := true

LOCAL_C_INCLUDES := system/extras/ext4_utils/include/ext4_utils/
LOCAL_C_INCLUDES += external/openssl/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..
LOCAL_STATIC_LIBRARIES := libext4_utils libz libcrypto_static libhtcrecvyutils

ifeq ($(HTC_EXFAT_SUPPORT),true)
LOCAL_CFLAGS += -DHTC_EXFAT
endif

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_SRC_FILES := flash_image.c
LOCAL_MODULE := flash_image_ft2
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := libmtdutils_ft2
LOCAL_SHARED_LIBRARIES := libcutils liblog libc
include $(BUILD_EXECUTABLE)
