LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	gl2_basic.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
    libEGL \
    libGLESv2 \
    libui \
    libgui \
    libutils
LOCAL_STATIC_LIBRARIES += liboemaids
LOCAL_STATIC_LIBRARIES += libglTest

LOCAL_C_INCLUDES += $(call include-path-for, opengl-tests-includes)

LOCAL_MODULE:= gl2_test

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -DGL_GLEXT_PROTOTYPES

include $(BUILD_EXECUTABLE)
