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

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio - TAS2562 (RAV)
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_rav/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_rav/audio_platform_info_moto_rav.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_rav/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_rav/audio_policy_configuration.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_rav/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_rav/audio_policy_volumes.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_rav/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_rav/default_volume_tables.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_rav/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_rav/mixer_paths_moto_rav.xml

# Audio - Cirrus (SOFIAP)
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiap/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiap/audio_platform_info_moto_sofiap.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiap/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiap/audio_policy_configuration.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiap/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiap/audio_policy_volumes.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiap/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiap/default_volume_tables.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiap/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiap/mixer_paths_moto_sofiap.xml

# Audio - TAS2562 (SOFIAR)
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiar/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiar/audio_platform_info_moto_sofiar.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiar/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiar/audio_policy_configuration.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiar/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiar/audio_policy_volumes.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiar/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiar/default_volume_tables.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofiar/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofiar/mixer_paths_moto_sofiar.xml

# Audio - Cirrus (SOFIA)
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofia/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofia/audio_platform_info_moto_sofia.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofia/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofia/audio_policy_configuration.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofia/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofia/audio_policy_volumes.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofia/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofia/default_volume_tables.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio/sku_sofia/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_sofia/mixer_paths_moto_sofia.xml

# Camera
TARGET_NEEDS_RAW10_BUFFER_FIX := true
TARGET_USES_64BIT_CAMERA := false

PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/camera/camera_config_rav.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config_rav.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/camera/camera_config_sofia.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config_sofia.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/camera/camera_config_sofiap.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config_sofiap.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/camera/camera_config_sofiar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config_sofiar.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.tof.direct=1

## Camera Requirements
PRODUCT_PACKAGES += \
    libcamera_shim \
    libgbp_shim \
    libgui_vendor

# Device Folders
PRODUCT_PACKAGES += \
    amogus_folders

# Device Init
PRODUCT_PACKAGES += \
    fstab.amogus \
    ramdisk-fstab.amogus

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# Fingerprint
TARGET_USES_EGISTEC_FINGERPRINT := true
TARGET_USES_FPC_FINGERPRINT := true

## FPC Gestures
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/idc/uinput-egis.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-egis.idc \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/keylayout/uinput-egis.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-egis.kl \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

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

# Media
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Overlays
PRODUCT_PACKAGES += \
    ravFrameworkOverlay \
    sofiaFrameworkOverlay \
    sofiapFrameworkOverlay \
    sofiapSFrameworkOverlay \
    sofiarFrameworkOverlay \
    ravSystemUIOverlay \
    sofiaSystemUIOverlay \
    sofiapSystemUIOverlay \
    sofiapSSystemUIOverlay \
    sofiarSystemUIOverlay

# Platform
TRINKET := trinket
TARGET_KERNEL_VERSION := 4.14
PRODUCT_PLATFORM_MOT := true
TARGET_BOARD_PLATFORM := $(TRINKET)

# Power
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

PRODUCT_USES_PIXEL_POWER_HAL := true

# Props
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/props/build_rav.prop:$(TARGET_COPY_OUT_VENDOR)/build_rav.prop \
    $(PLATFORM_COMMON_PATH)/props/build_sofia.prop:$(TARGET_COPY_OUT_VENDOR)/build_sofia.prop \
    $(PLATFORM_COMMON_PATH)/props/build_sofiap.prop:$(TARGET_COPY_OUT_VENDOR)/build_sofiap.prop \
    $(PLATFORM_COMMON_PATH)/props/build_sofiar.prop:$(TARGET_COPY_OUT_VENDOR)/build_sofiar.prop

TARGET_VENDOR_PROP += $(PLATFORM_COMMON_PATH)/props/vendor.prop

# QCOM Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Qualcomm WiFi Configuration
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

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
