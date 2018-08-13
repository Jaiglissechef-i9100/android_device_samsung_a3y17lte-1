#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018 RR Remixed
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

LOCAL_PATH := device/samsung/a3y17lte

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit from Exynos7870-common
$(call inherit-product, device/samsung/exynos7870-common/device-common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/a3y17lte/a3y17lte-vendor.mk)

# Specific Ramdisk Package
  PRODUCT_PACKAGES += \
    init.target.rc

# Device uses high-density artwork where available
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1080

# Audio
PRODUCT_PACKAGES += \
    libtfa98xx \
    audio_amplifier.universal7870 \
    libtinycompress

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_gains.xml:system/etc/mixer_gains.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:system/etc/mixer_paths_0.xml

# Audio Package
PRODUCT_PACKAGES += \
   libtfa98xx \
   audio_amplifier.universal7870 \
   libtinycompress

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-impl \
    android.hardware.biometrics.fingerprint@2.1-service \
    mcDriverDaemon \
    fingerprint.exynos5 \
    libbauthtzcommon_shim

#  Light
PRODUCT_PACKAGES += \
    AdvancedDisplay \
    android.hardware.light@2.0-impl \
    lights.universal7870

# NFC Packages
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    com.android.nfc_extras \
    NfcNci \
    Tag

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-sec.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/vendor/etc/libnfc-sec-hal.conf \
    $(LOCAL_PATH)/configs/nfc/nfc_key:system/etc/nfc_key \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/vendor/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/android.hardware.wifi@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.wifi@1.0-service.rc

#  Permission
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/vendor/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/vendor/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/vendor/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/vendor/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/vendor/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/vendor/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/vendor/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/vendor/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/vendor/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/vendor/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/vendor/etc/permissions/com.nxp.mifare.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.permission.HRM_EXT.xml:system/vendor/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.permission.SSENSOR.xml:system/vendor/etc/permissions/com.samsung.permission.SSENSOR.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.nfc.hce.xml:system/vendor/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.nfc.hcef.xml:system/vendor/etc/permissions/android.hardware.nfc.hcef.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.nfc.xml:system/vendor/etc/permissions/android.hardware.nfc.xml \
    $(LOCAL_PATH)/configs/permissions/com.android.nfc_extras.xml:system/vendor/etc/permissions/com.android.nfc_extras.xml \
    $(LOCAL_PATH)/configs/permissions/com.gsma.services.nfc.xml:system/vendor/etc/permissions/com.gsma.services.nfc.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.android.nfc.mpos.xml:system/vendor/etc/permissions/com.samsung.android.nfc.mpos.xml \
    $(LOCAL_PATH)/configs/permissions/com.sec.feature.cover.nfc_authentication.xml:system/vendor/etc/permissions/com.sec.feature.cover.nfc_authentication.xml \
    $(LOCAL_PATH)/configs/permissions/com.sec.feature.nfc_authentication.xml:system/vendor/etc/permissions/com.sec.feature.nfc_authentication.xml

# Shim
TARGET_LD_SHIM_LIBS += \
    /system/lib/libbauthserver.so|/system/vendor/lib/libbauthtzcommon_shim.so

# Root
PRODUCT_PACKAGES += \
    su

# Wifi
PRODUCT_PACKAGES += \
    init.wifi.rc \
    android.hardware.wifi@1.0-service \
    hostapd \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    wifiloader \
    wpa_supplicant \
    wpa_supplicant.conf \
    wificond

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/grippower.info:system/etc/firmware/wlan/grippower.info \
    $(LOCAL_PATH)/configs/wifi/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/WCNSS_cfg.dat
