#
# Copyright 2018 The Android Open Source Project
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
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel
BOARD_KERNEL_CMDLINE = androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += androidboot.configfs=true
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += panic_on_err=1
BOARD_KERNEL_CMDLINE += msm_drm.dsi_display0=dsi_panel_cmd_display:config0
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_PREBUILT_KERNEL := device/sony/akari/Image.gz-dtb
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_KERNEL_ARCH := arm64

# Ramdisk compression
LZMA_RAMDISK_TARGETS := recovery

# Platform
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4227858432
BOARD_VENDORIMAGE_PARTITION_SIZE := 1056714752
BOARD_USERDATAIMAGE_PARTITION_SIZE := 44712755200
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_OTA_ASSERT_DEVICE := akari
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Android Verified Boot
#BOARD_AVB_ENABLE := false
#BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Crypto
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 1023
TW_DEFAULT_BRIGHTNESS := 420
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_INCLUDE_NTFS_3G := true
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_TOOLBOX := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Debug-tools
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true
