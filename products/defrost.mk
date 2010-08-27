# Inherit AOSP device configuration for bravo.
$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/defrost/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/defrost/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := defrost
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=FRF91 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF91/43546:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="passion-user 2.2 FRF91 43546 release-keys"

# Include the Torch app
PRODUCT_PACKAGES += Torch \
    Stk \
    DSPManager

# Extra Passion overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/defrost/overlay/bravo

# Use a precompiled kernel until the merge with cm-kernel
TARGET_PREBUILT_KERNEL = device/htc/bravo/kernel

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,113,115,117,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Enable Windows Media
WITH_WINDOWS_MEDIA := true
DEFROST_WITH_GOOGLE := true

#
# Set ro.modversion
#
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=DeFroST_3.2 \
	ro.build.display.id=DeFroST 3.2 for HTC Desire (AOSP FRF91 + CyanogenMod)
	

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/defrost/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
