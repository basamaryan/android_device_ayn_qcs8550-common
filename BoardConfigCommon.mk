#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/ayn/qcs8550-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

# Boot
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kalama
TARGET_NO_BOOTLOADER := true

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_QCOM_MERGE_DTBS_SCRIPT := true
TARGET_NEEDS_DTBOIMAGE := true

# Init boot
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

# Kernel
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE += nosoftlockup
BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3

BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image

TARGET_KERNEL_SOURCE := kernel/ayn/qcs8550
TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/kalama_GKI.config \
    vendor/ayn/kalama_GKI.config \
    vendor/debugfs.config

# Kernel Modules
MODULE_LISTS_PATH := $(COMMON_PATH)/modules
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(MODULE_LISTS_PATH)/modules.load.system_dlkm))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(TARGET_KERNEL_SOURCE)/modules.vendor_blocklist.msm.kalama
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(MODULE_LISTS_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(MODULE_LISTS_PATH)/modules.load.first_stage))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(MODULE_LISTS_PATH)/modules.load.first_stage $(MODULE_LISTS_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(strip $(shell cat $(MODULE_LISTS_PATH)/modules.include.vendor_ramdisk $(MODULE_LISTS_PATH)/modules.load.first_stage $(MODULE_LISTS_PATH)/modules.load.recovery))
SYSTEM_KERNEL_MODULES := $(strip $(shell cat $(MODULE_LISTS_PATH)/modules.include.system_dlkm))

TARGET_KERNEL_EXT_MODULE_ROOT := kernel/ayn/qcs8550-modules
TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/mm-drivers/hw_fence \
    qcom/opensource/mm-drivers/msm_ext_display \
    qcom/opensource/mm-drivers/sync_fence \
    qcom/opensource/audio-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/securemsm-kernel \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/eva-kernel \
    qcom/opensource/video-driver \
    qcom/opensource/graphics-kernel \
    qcom/opensource/wlan/platform \
    qcom/opensource/wlan/qcacld-3.0/.kiwi_v2 \
    qcom/opensource/bt-kernel

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kalama

# Include the proprietary files BoardConfig.
include vendor/ayn/qcs8550-common/BoardConfigVendor.mk
