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

DEVICE_PATH := device/motorola/amogus

# AVB
BOARD_AVB_ENABLE := true

# Arch
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := kryo
TARGET_2ND_ARCH_VARIANT := armv8-a

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3

# SELinux
BOARD_USE_ENFORCING_SELINUX := true
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Partition information
TARGET_COPY_OUT_VENDOR := vendor
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_RECOVERYIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
ifneq ($(TARGET_DEVICE),amogus_doha)
  ## Build product image
  TARGET_COPY_OUT_PRODUCT := product
  BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 4458545152
  BOARD_MOT_DYNAMIC_PARTITIONS_PARTITION_LIST := \
      system \
      product \
      vendor
  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
  BOARD_SUPER_PARTITION_SIZE := 8925478912
  BOARD_SUPER_PARTITION_GROUPS := mot_dynamic_partitions
endif

# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/class/sensors/dt-gesture/enable"

include device/motorola/common/CommonConfig.mk
