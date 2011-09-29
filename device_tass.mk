#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, build/target/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/tass/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    copybit.tass \
    gralloc.tass \
    libOmxCore \
    make_ext4fs \
    dexpreopt \
    screencap

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/tass/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/tass/ueventd.gt-s5570.rc:root/ueventd.gt-s5570.rc \
    device/samsung/tass/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/tass/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/tass/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/tass/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/tass/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/tass/TASS.rle:root/TASS.rle \
    device/samsung/tass/init.gt-s5570.rc:root/init.gt-s5570.rc \
    device/samsung/tass/prebuilt/ramzswap.ko:system/lib/modules/ramzswap.ko 

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/tass/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/tass/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/tass/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/tass/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/tass/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/tass/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/tass/vold.fstab:system/etc/vold.fstab \

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/tass/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/tass/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/tass/sec_key.kl:system/usr/keychars/sec_key.kl 

$(call inherit-product-if-exists, vendor/samsung/tass/tass-vendor.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := tass
PRODUCT_DEVICE := tass
PRODUCT_MODEL := GT-S5570
