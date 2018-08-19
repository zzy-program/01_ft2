LOCAL_PATH := $(call my-dir)

# Needed by build/make/core/Makefile.
#RECOVERY_API_VERSION := 3
#RECOVERY_FSTAB_VERSION := 2

# libmounts_ft2 (static library)
# ===============================
include $(CLEAR_VARS)
LOCAL_SRC_FILES := mounts.cpp
LOCAL_CLANG := true
LOCAL_CFLAGS := -Wall -Wno-unused-parameter -Werror
LOCAL_MODULE := libmounts_ft2
include $(BUILD_STATIC_LIBRARY)

# librecovery_ft2 (static library)
# ===============================
include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wno-unused-parameter -Werror
#LOCAL_CFLAGS += -DRECOVERY_API_VERSION=$(RECOVERY_API_VERSION)

LOCAL_MODULE := librecovery_ft2
LOCAL_STATIC_LIBRARIES := \
    libminui \
    libvintf_recovery \
    libcrypto_utils \
    libcrypto \
    libbase

include $(BUILD_STATIC_LIBRARY)

# recovery (static executable)
# ===============================
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    device.cpp \
    recovery.cpp \
    roots.cpp \
    screen_ui.cpp \
    ui.cpp

LOCAL_MODULE := recovery_ft2

LOCAL_FORCE_STATIC_EXECUTABLE := true

#LOCAL_CFLAGS += -DRECOVERY_API_VERSION=$(RECOVERY_API_VERSION)
LOCAL_CFLAGS += -Wno-unused-parameter -Werror
LOCAL_CLANG := true

LOCAL_C_INCLUDES += \
    system/vold \
    system/core/adb

LOCAL_STATIC_LIBRARIES := \
    librecovery_ft2 \
    libbatterymonitor \
    libext4_utils \
    libsparse \
    libziparchive \
    libmounts_ft2 \
    libz \
    libmtdutils \
    libminadbd \
    libminui \
    libpng \
    libfs_mgr \
    libcrypto_utils \
    libcrypto \
    libvintf_recovery \
    libvintf \
    libtinyxml2 \
    libbase \
    libcutils \
    libutils \
    liblog \
    libselinux \
    libm \
    libc

LOCAL_HAL_STATIC_LIBRARIES := libhealthd

LOCAL_CFLAGS += -DUSE_EXT4
LOCAL_C_INCLUDES += system/extras/ext4_utils
LOCAL_STATIC_LIBRARIES += libext4_utils libz libcrypto_static

LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin

LOCAL_SRC_FILES += default_device.cpp

include $(BUILD_EXECUTABLE)

include \
    $(LOCAL_PATH)/minadbd/Android.mk \
    $(LOCAL_PATH)/mtdutils/Android.mk \
    $(LOCAL_PATH)/minui/Android.mk
