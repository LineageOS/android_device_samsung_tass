#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := tass
PRODUCT_DEVICE := tass
PRODUCT_MODEL := GT-S5570

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/tass/tass-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/tass/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    copybit.tass \
    gralloc.tass \
    libOmxCore \
    libOmxVidEnc \
    make_ext4fs \
    dexpreopt

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/tass/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

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
    device/samsung/tass/init.gt-s5570.rc:root/init.gt-s5570.rc

## RIL related stuff
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/samsung/tass/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/samsung/tass/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \
    vendor/samsung/tass/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \
    vendor/samsung/tass/proprietary/lib/libril.so:system/lib/libril.so 

## OMX proprietaries
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/samsung/tass/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/samsung/tass/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/samsung/tass/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxEvrcHwDec.so:system/lib/libOmxEvrcHwDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/samsung/tass/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/samsung/tass/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/samsung/tass/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/samsung/tass/proprietary/lib/libOmxOn2Dec.so:system/lib/libOmxOn2Dec.so \
    vendor/samsung/tass/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/samsung/tass/proprietary/lib/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/samsung/tass/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/samsung/tass/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

## Camera proprietaries
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/samsung/tass/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/samsung/tass/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/samsung/tass/proprietary/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so


## Atheros AR6002 firmware
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/wifi/ar6000.ko:system/wifi/ar6000.ko \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01 \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02 \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03 \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    vendor/samsung/tass/proprietary/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/tass/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/samsung/tass/proprietary/bin/hostapd:system/bin/hostapd \
    device/samsung/tass/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/tass/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Bluetooth
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/bin/BCM2049C0_003.001.031.0088.0094.hcd:system/bin/BCM2049C0_003.001.031.0088.0094.hcd 
	
## Audio
PRODUCT_COPY_FILES += \
    device/samsung/tass/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/tass/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/samsung/tass/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/samsung/tass/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so 

##GPS
PRODUCT_COPY_FILES += \
#    vendor/samsung/tass/proprietary/lib/hw/gps.msm7k.so:system/lib/hw/gps.msm7k.so \
#    vendor/samsung/tass/proprietary/bin/gpsd:system/bin/gpsd \

## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    device/samsung/tass/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/tass/vold.fstab:system/etc/vold.fstab \

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/tass/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/tass/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/tass/sec_key.kl:system/usr/keychars/sec_key.kl \
	
## 3D
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/samsung/tass/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/samsung/tass/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/samsung/tass/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/samsung/tass/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/samsung/tass/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/samsung/tass/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/samsung/tass/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg 

## Sensor
PRODUCT_COPY_FILES += \
    vendor/samsung/tass/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    vendor/samsung/tass/proprietary/bin/memsicd:system/bin/memsicd 
