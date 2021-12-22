# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
# Switch to Cortex-A77 when it becomes available!
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
# Switch to Cortex-A77 when it becomes available!
TARGET_2ND_CPU_VARIANT_RUNTIME := generic

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000

BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3

# Serial console
#BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0xa90000

TARGET_RECOVERY_WIPE := $(PLATFORM_COMMON_PATH)/rootdir/recovery.wipe
TARGET_RECOVERY_FSTAB ?= $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.qcom

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

# Boot Image Header
BOARD_BOOT_HEADER_VERSION := 3
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 4096

# Build product image
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_JOURNAL_SIZE := 0
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := 4096

# Build system_ext image
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := 4096

# This platform has a metadata partition: declare this
# to create a mount point for it
BOARD_USES_METADATA_PARTITION := true

BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH ?= external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM ?= SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# This target has recovery partitions and bootloader
# will not set the skip_initramfs cmdline bootparam,
# so if we turn on recovery as boot, we always end up
# booting to recovery. Nice!
TARGET_NO_RECOVERY := false
BOARD_USES_RECOVERY_AS_BOOT := true

# DTBO partition definitions
TARGET_NEEDS_DTBOIMAGE ?= true

# Audio
AUDIO_FEATURE_ENABLED_GKI := true

include device/motorola/common/CommonConfig.mk
