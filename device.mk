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

# Device path
PLATFORM_COMMON_PATH := device/motorola/amogus

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 29

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor \
    vbmeta

ifneq ($(TARGET_IS_AMOGUS_DOHA),true)
  AB_OTA_PARTITIONS += \
      product \
      recovery
endif

AB_OTA_POSTINSTALL_CONFIG := \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Camera
TARGET_NEEDS_RAW10_BUFFER_FIX := true
TARGET_USES_64BIT_CAMERA := false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.tof.direct=1

## Camera Requirements
PRODUCT_PACKAGES += \
    libcamera_shim \
    libgbp_shim \
    libgui_vendor

# Device Characteristics
DEVICE_CHARACTERISTICS += fm erofs

# Device Folders
PRODUCT_PACKAGES += \
    amogus_folders

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS ?= true

# Fingerprint
TARGET_USES_EGISTEC_FINGERPRINT := true
TARGET_USES_FPC_FINGERPRINT := true

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor

# Init
PRODUCT_PACKAGES += \
    init.amogus.sh

# Model
PRODUCT_MODEL := moto g(8) family

# Overlays
PRODUCT_PACKAGES += \
    ravFrameworksOverlay \
    sofiaFrameworksOverlay \
    sofiapFrameworksOverlay \
    sofiapSFrameworksOverlay \
    sofiarFrameworksOverlay \
    ravSystemUIOverlay \
    sofiaSystemUIOverlay \
    sofiapSystemUIOverlay \
    sofiapSSystemUIOverlay \
    sofiarSystemUIOverlay

## Regulatory
PRODUCT_PACKAGES += \
    XT2041-1RegulatoryOverlay \
    XT2041-3RegulatoryOverlay \
    XT2041-4RegulatoryOverlay \
    XT2041-5RegulatoryOverlay \
    XT2041-6RegulatoryOverlay \
    XT2041-7RegulatoryOverlay \
    XT2043-7RegulatoryOverlay \
    XT2043-8RegulatoryOverlay \
    XT2045-1RegulatoryOverlay \
    XT2045-2RegulatoryOverlay \
    XT2045-3RegulatoryOverlay \
    XT2045-6RegulatoryOverlay

# Platform
TRINKET := trinket
TARGET_BOARD_PLATFORM := $(TRINKET)
TARGET_KERNEL_VERSION := 4.14
PRODUCT_PLATFORM_MOT := true
PRODUCT_USES_QCOM_HARDWARE := true

# Power
PRODUCT_USES_PIXEL_POWER_HAL := true

# Props
$(call copy-files-recursive,$(PLATFORM_COMMON_PATH)/props,$(TARGET_COPY_OUT_VENDOR))

TARGET_VENDOR_PROP += $(PLATFORM_COMMON_PATH)/props/vendor.prop

# QCOM Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Recovery
ifneq ($(TARGET_IS_AMOGUS_DOHA),true)
  include $(PLATFORM_COMMON_PATH)/device-recovery.mk
endif

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10,10

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/common/common.mk)
# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/amogus/amogus-vendor.mk)
