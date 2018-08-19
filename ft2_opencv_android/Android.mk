LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE:= ft2_hello
LOCAL_SRC_FILES:= \
    ft2_hello.cpp

# LOCAL_SDK_VERSION := 21
LOCAL_C_INCLUDES := \
    external/opencv3/include \
    external/opencv3/modules/highgui/include \
    external/opencv3/modules/core/include \
    external/opencv3/modules/hal/include \
    external/opencv3/modules/imgproc/include \
    external/opencv3/modules/imgcodecs/include \
    external/opencv3/modules/videoio/include

LOCAL_SHARED_LIBRARIES := \
    libopencv_imgproc libopencv_flann libopencv_core libopencv_ml libopencv_imgcodecs libopencv_videoio libopencv_highgui libopencv_features2d

# LOCAL_SHARED_LIBRARIES += \
#       libjpeg \
#       libz

LOCAL_MODULE_TAGS := optional
LOCAL_CPPFLAGS += -Wall -Werror -fexceptions
LOCAL_LDFLAGS += -v -stdlib=libstdc++
# LOCAL_LDFLAGS += -Xlinker --no-demangle
LOCAL_CLANG_CFLAGS += -Wno-c++11-narrowing
LOCAL_CPPFLAGS += -frtti

include $(BUILD_EXECUTABLE)
