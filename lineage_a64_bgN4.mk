TARGET_GAPPS_ARCH := arm
include build/make/target/product/aosp_arm.mk
$(call inherit-product, device/phh/treble/base.mk)

$(call inherit-product-if-exists, vendor/gapps/arm/arm-vendor.mk)
$(call inherit-product, device/phh/treble/lineage.mk)

PRODUCT_NAME := lineage_a64_bgN4
PRODUCT_BRAND := google
PRODUCT_MODEL := Generic System

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

LINEAGE_BUILDTYPE := GAPPS
LINEAGE_BUILD := GSI

#EXT4
LINEAGE_EXTRAVERSION := -EXT4
PRODUCT_EXTRA_VNDK_VERSIONS += 28 29
