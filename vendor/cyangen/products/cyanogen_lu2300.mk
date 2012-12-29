# Inherit AOSP device configuration for lu2300.
$(call inherit-product, device/lge/lu2300/lu2300.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Broadcom FM radio
#$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_lu2300
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := lu2300
PRODUCT_MODEL := LGE OptimusQ
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lu2300 BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=lge/lu2300/lu2300:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="lu2300-user 2.3.4 GRJ22 121341 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-lu2300.map

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-OQ
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-OQ
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-OQ-HPA-T4
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
