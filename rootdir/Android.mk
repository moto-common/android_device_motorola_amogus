LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_IS_AMOGUS_DOHA),true)
include $(CLEAR_VARS)
include $(CLEAR_VARS)
LOCAL_MODULE := ramdisk-fstab.amogus
LOCAL_SRC_FILES := fstab.qcom
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := fstab.qcom
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RAMDISK_OUT)
include $(BUILD_PREBUILT)
endif
