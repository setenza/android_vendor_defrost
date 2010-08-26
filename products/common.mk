# Generic cyanogenmod product
PRODUCT_NAME := defrost
PRODUCT_BRAND := defrost
PRODUCT_DEVICE := bravo

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=edify

# Include backuptool
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_BACKUPTOOL=true

# Display modversion in edify script.
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_MODVER=true

# Add ROMManager build property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=DonMessWivIt.ogg

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=richardtrip

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    DFParts \
    DFPartsHelper \
    Superuser

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/defrost/changelog:system/etc/changelog

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/defrost/overlay/common

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/defrost/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/defrost/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/defrost/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/defrost/prebuilt/common/etc/init.d/01modules:system/etc/init.d/01modules \
    vendor/defrost/prebuilt/common/etc/init.d/02cachedalvikcache:system/etc/init.d/02cachedalvikcache \
    vendor/defrost/prebuilt/common/etc/init.d/40a2sd:system/etc/init.d/40a2sd \
    vendor/defrost/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/defrost/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/defrost/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/defrost/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/defrost/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/defrost/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/defrost/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/defrost/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/defrost/prebuilt/common/xbin/powertop:system/xbin/powertop \

PRODUCT_COPY_FILES +=  \
    vendor/defrost/proprietary/RomManager.apk:data/app/RomManager.apk \

# Always run in insecure mode, enables root on user build variants
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef DEFROST_WITH_GOOGLE
    PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_BACKUPTOOL=false

    PRODUCT_COPY_FILES += \
        vendor/defrost/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
        vendor/defrost/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
        vendor/defrost/proprietary/Facebook.apk:./data/app/Facebook.apk \
        vendor/defrost/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
        vendor/defrost/proprietary/Gmail.apk:./system/app/Gmail.apk \
        vendor/defrost/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
        vendor/defrost/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
        vendor/defrost/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
        vendor/defrost/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
        vendor/defrost/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
        vendor/defrost/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
        vendor/defrost/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
        vendor/defrost/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
        vendor/defrost/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
        vendor/defrost/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
        vendor/defrost/proprietary/LatinImeGoogle.apk:./system/app/LatinImeGoogle.apk \
        vendor/defrost/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
        vendor/defrost/proprietary/Maps.apk:./data/app/Maps.apk \
        vendor/defrost/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
        vendor/defrost/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
        vendor/defrost/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
        vendor/defrost/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
        vendor/defrost/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
        vendor/defrost/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
        vendor/defrost/proprietary/Street.apk:./system/app/Street.apk \
        vendor/defrost/proprietary/Talk.apk:./data/app/Talk.apk \
        vendor/defrost/proprietary/Twitter.apk:./data/app/Twitter.apk \
        vendor/defrost/proprietary/Vending.apk:./system/app/Vending.apk \
        vendor/defrost/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
        vendor/defrost/proprietary/YouTube.apk:./data/app/YouTube.apk \
        vendor/defrost/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
        vendor/defrost/proprietary/kickback.apk:./system/app/kickback.apk \
        vendor/defrost/proprietary/soundback.apk:./system/app/soundback.apk \
        vendor/defrost/proprietary/talkback.apk:./system/app/talkback.apk \
        vendor/defrost/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
        vendor/defrost/proprietary/features.xml:./system/etc/permissions/features.xml \
        vendor/defrost/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
        vendor/defrost/proprietary/libinterstitial.so:./system/lib/libinterstitial.so \
        vendor/defrost/proprietary/libspeech.so:./system/lib/libspeech.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif

